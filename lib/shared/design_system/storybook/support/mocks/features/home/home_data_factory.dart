abstract class HomeDataFactory {
  /// Dados para o Donut Chart
  static Map<String, double> get donutDataDefault => {
    'Alimentação': 1250.0,
    'Transporte': 320.5,
    'Lazer': 450.0,
    'Saúde': 200.0,
  };

  /// Dados para o Weekly Chart
  static Map<int, double> get weeklyDataDefault => {
    1: 400.0,  /// Seg
    2: -150.0, /// Ter
    3: 800.0,  /// Qua
    4: -50.0,  /// Qui
    5: 1200.0, /// Sex
    6: 900.0,  /// Sab
    7: 1500.0, /// Dom
  };

  /// Estado vazio
  static Map<String, double> get emptyMap => {};
  static Map<int, double> get emptyWeekly => {};
}