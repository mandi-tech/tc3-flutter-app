import 'dart:typed_data';
import 'dart:io' show File;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

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

  CollectionReference<Map<String, dynamic>> get _transactions {
    final user = auth.currentUser;

    if (user == null) {
      throw Exception('Usuário não autenticado');
    }

    return firestore
        .collection('users')
        .doc(user.uid)
        .collection('transactions');
  }

  Future<String?> _uploadReceiptImage(XFile? image) async {
    if (image == null) return null;

    final user = auth.currentUser;
    if (user == null) {
      throw Exception('Usuário não autenticado');
    }

    final fileName =
        '${DateTime.now().millisecondsSinceEpoch}_${image.name}';
    final ref = storage
        .ref()
        .child('users/${user.uid}/receipts/$fileName');

    UploadTask uploadTask;

    if (kIsWeb) {
      final Uint8List bytes = await image.readAsBytes();
      uploadTask = ref.putData(bytes);
    } else {
      uploadTask = ref.putFile(File(image.path));
    }

    await uploadTask;
    return ref.getDownloadURL();
  }

  Future<void> addTransaction({
    required String type,
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

    await _transactions.add(transaction.toMap());
  }

  Stream<List<TransactionModel>> getTransactions() {
    return _transactions
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TransactionModel.fromDoc(doc))
              .toList(),
        );
  }

  Future<void> deleteTransaction(String id) async {
    await _transactions.doc(id).delete();
  }
}