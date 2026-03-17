import 'dart:io' show File;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/enums/transaction_type.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  final FirebaseStorage storage;

  TransactionService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
    FirebaseStorage? storage,
  })  : firestore = firestore ?? FirebaseFirestore.instance,
        auth = auth ?? FirebaseAuth.instance,
        storage = storage ?? FirebaseStorage.instance;

  User get _currentUser {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não autenticado.');
    }

    return user;
  }

  CollectionReference<Map<String, dynamic>> get _transactionsCollection {
    return firestore
        .collection('users')
        .doc(_currentUser.uid)
        .collection('transactions');
  }

  Future<String?> _uploadReceiptImage(XFile? image) async {
    if (image == null) return null;

    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${image.name}';

    final reference = storage
        .ref()
        .child('users/${_currentUser.uid}/receipts/$fileName');

    final UploadTask uploadTask = kIsWeb
        ? await _uploadFromWeb(reference, image)
        : await _uploadFromDevice(reference, image);

    await uploadTask;

    return reference.getDownloadURL();
  }

  Future<UploadTask> _uploadFromWeb(
    Reference reference,
    XFile image,
  ) async {
    final Uint8List bytes = await image.readAsBytes();
    return reference.putData(bytes);
  }

  Future<UploadTask> _uploadFromDevice(
    Reference reference,
    XFile image,
  ) async {
    return reference.putFile(File(image.path));
  }

  Future<void> addTransaction({
    required TransactionType type,
    required String description,
    required String category,
    required double amount,
    required DateTime date,
    XFile? receiptImage,
  }) async {
    final receiptImageUrl = await _uploadReceiptImage(receiptImage);

    final transaction = TransactionModel(
      id: '',
      type: type,
      description: description,
      category: category,
      amount: amount,
      date: date,
      receiptImageUrl: receiptImageUrl,
    );

    await _transactionsCollection.add(transaction.toMap());
  }

  Stream<List<TransactionModel>> getTransactions() {
    return _transactionsCollection
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(TransactionModel.fromDoc)
              .toList(),
        );
  }

  Future<void> deleteTransaction(String id) async {
    await _transactionsCollection.doc(id).delete();
  }
}