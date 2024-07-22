import 'package:flutter/material.dart';

class CreateUserModel extends ChangeNotifier {
  int _selectedAvatarIndex = -1;
  String? _title;
  String? _amount;
  String? _selectedCurrency;
  String? _transactionDate;
  String? _selectedCategory;
  String? _selectedClient;
  final List<String> _clients = [];

  int get selectedAvatarIndex => _selectedAvatarIndex;
  String? get title => _title;
  String? get amount => _amount;
  String? get selectedCurrency => _selectedCurrency;
  String? get transactionDate => _transactionDate;
  String? get selectedCategory => _selectedCategory;
  String? get selectedClient => _selectedClient;
  List<String> get clients => _clients;

  void selectAvatar(int index) {
    _selectedAvatarIndex = index;
    notifyListeners();
  }

  void setTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void setAmount(String amount) {
    _amount = amount;
    notifyListeners();
  }

  void selectCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }

  void setTransactionDate(String date) {
    _transactionDate = date;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSelectedClient(String client) {
    _selectedClient = client;
    notifyListeners();
  }

  void addClient(String client) {
    _clients.add(client);
    notifyListeners();
  }
}
