// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;
// import '../Model/StatusCheck.dart';
// import '../Model/report.dart';
// import '../helpers/snackBar.dart';
//
// class TransactionProvider extends ChangeNotifier {
//   TransactionProvider() {
//     _initializeReportBox();
//   }
//
//   List<AccountTransaction> _filteredTransactions = [];
//
//   List<dynamic> get filteredTransactions => _filteredTransactions;
//
//   List<AccountTransaction> _filtered = [];
//
//   List<dynamic> get filtered => _filtered;
//
//   List<StatusCheck> statusCheck = [];
//
//   bool isLoading = true;
//
//   List<String> selectedValues = [];
//
//   String? selectedCategoryIncome;
//
//   String? selectedCategoryExpense;
//
//   String? selectedCategoryNameIncome;
//
//   String? selectedCategoryNameExpense;
//
//   double selectedCategoryNameTotalAmountIncome = 0.0;
//
//   double selectedCategoryNameTotalAmountExpense = 0.0;
//
//
//
//
//   Map<String, double> get datasMap => incomeExpenseMapData;
//
//   double chosedMonthTotalIncome = 0.0;
//   double choosedMonthTotalExpense = 0.0;
//
//   double totalCredit = 0.0;
//   double totalDebit = 0.0;
//   double totalInvestment = 0.0;
//   double totalBillsUtilities = 0.0;
//   double totalTravel = 0.0;
//   double totalTransferToBharatPe = 0.0;
//
//   double totalPetrol = 0.0;
//   double totalPolicyBazaar = 0.0;
//   double totalEmployeeSalary = 0.0;
//   double totalSavings = 0.0;
//   double totalMutualFunds = 0.0;
//   double totalRent = 0.0;
//   double totalShopping = 0.0;
//   double totalBhartPe = 0.0;
//
//   double totalIncome = 0.0;
//   double totalExpense = 0.0;
//
//   DateTime _dateTime = DateTime.now();
//
//   DateTime get dateTime => _dateTime;
//
//   DateTime _dateTimeValue = DateTime.now();
//
//   DateTime get dateTimeValue => _dateTimeValue;
//
//   DateTime _getDate = DateTime.now();
//
//   DateTime get getDate => _getDate;
//
//   bool issloading = false;
//
//   bool get isloading => issloading;
//
//   bool _isReportLoading = false;
//
//   bool get isReportLoading => _isReportLoading;
//
//   String? _requestId;
//
//   String? get requestId => _requestId;
//
//   String? _txn_id;
//
//   String? get txn_id => _txn_id;
//
//   String? phnno;
//
//   String? reqId;
//
//   Box<ReportDataHiveModel>? retrieveReportBox;
//
//   ReportDataHiveModel reportDataModel = ReportDataHiveModel();
//
//   Box<String>? phoneNumberBox;
//
//   String? phoneNumber;
//
//   Box<DateTime>? expireTimeBox;
//
//   DateTime? expireTime;
//
//   // Map<String, double> amountMap = {};
//
//   bool noTransactionsAvailable = false;
//
//   String? _selectedCategory;
//
//   TextEditingController textController = TextEditingController();
//
//   bool showAll = false;
//
//   bool isIncomeSelected = false;
//   bool isExpenseSelected = false;
//
//   void enableShowAll() {
//     showAll = !showAll;
//     notifyListeners();
//   }
//
//   void transactionFilter() {
//     _filteredTransactions =
//         reportDataModel.reportData?.banks?[0].accounts?[0].transactions ?? [];
//   }
//
//   void selectNarration(String name) {
//     if (kDebugMode) {
//       print(_dateTime.toString());
//     }
//
//     _filtered = reportDataModel.reportData?.banks?[0].accounts?[0].transactions
//             ?.where((element) {
//           return (element.narration!.contains(name) ||
//                   element.narration!.contains(name.toUpperCase()) ||
//                   element.narration!.contains(name.toLowerCase())) &&
//               '${element.date!.year}-${element.date!.month}' ==
//                   '${_dateTime.year}-${_dateTime.month}';
//         }).toList() ??
//         [];
//
//     notifyListeners();
//   }
//
//   // void filterTransactionsByDate(DateTime selectedDate) {
//   //   _filteredByDate = reportDataModel.reportData?.banks?[0].accounts?[0].transactions
//   //       ?.where((transaction) =>
//   //   transaction.date!.year == selectedDate.year &&
//   //       transaction.date!.month == selectedDate.month)
//   //       .toList() ?? [];
//   //
//   //   notifyListeners();
//   // }
//   void setSelectedCategory(String? category) {
//     _selectedCategory = category;
//     notifyListeners();
//   }
//
//   void filterTransactions(String searchText) {
//     var banks = reportDataModel.reportData?.banks;
//     if (banks == null || banks.isEmpty) {
//       return;
//     }
//
//     var accounts = banks[0].accounts;
//     if (accounts == null || accounts.isEmpty) {
//       return;
//     }
//
//     _filtered = accounts[0].transactions?.where((transaction) {
//           bool matchesNarration = transaction.narration!.contains(searchText) ||
//               transaction.narration!.contains(searchText.toUpperCase()) ||
//               transaction.narration!.contains(searchText.toLowerCase());
//
//           bool matchesCategory = _selectedCategory != null
//               ? transaction.narration == _selectedCategory
//               : true;
//
//           return matchesNarration && matchesCategory;
//         }).toList() ??
//         [];
//
//     notifyListeners();
//   }
//
//   void selectNarrations(DateTime selectedDate) {
//     if (kDebugMode) {
//       print(selectedDate.toString());
//     }
//
//     _filtered = reportDataModel.reportData?.banks?[0].accounts?[0].transactions
//             ?.where((transaction) {
//           return transaction.date != null &&
//               transaction.date!.year == selectedDate.year &&
//               transaction.date!.month == selectedDate.month;
//         }).toList() ??
//         [];
//
//     notifyListeners();
//   }
//
//   Future _initializeReportBox() async {
//     try {
//       _isReportLoading = true;
//       retrieveReportBox =
//           await Hive.openBox<ReportDataHiveModel>('reportDataBox');
//       phoneNumberBox = await Hive.openBox<String>('phoneNumberBox');
//       expireTimeBox = await Hive.openBox<DateTime>('expireTimeBox');
//
//       phoneNumber = phoneNumberBox?.get('phoneNumberKey');
//       expireTime = expireTimeBox?.get('expireTimeKey');
//
//       if (_isTimeExpired()) {
//         // await _deleteReportData();
//         await retrieveReportAPI();
//       } else {
//         _getHiveData();
//       }
//     }
//     ///////check this error ////====screenshot..
//     catch (error) {
//       showSnackBar('Error in Database $error');
//     }
//   }
//
//   void _getHiveData() {
//     if (retrieveReportBox?.isEmpty ?? true) {
//       const SizedBox.shrink();
//     } else {
//       reportDataModel = retrieveReportBox!.get('reportDataKey')!;
//       if (kDebugMode) {
//         print("reportDataModelreportDataModel$reportDataModel");
//       }
//     }
//
//     expireTime = expireTimeBox?.get('expireTimeKey');
//     phoneNumber = phoneNumberBox?.get('phoneNumberKey');
//
//     _isReportLoading = false;
//     notifyListeners();
//   }
//
//   bool _isTimeExpired() {
//     if (expireTime == null) {
//       return false;
//     } else if (DateTime.now().isAfter(expireTime!)) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future storeReportDataAndExpireTime(
//       ReportDataHiveModel? reportDataModel) async {
//     if (reportDataModel?.reportData == null) {
//       return;
//     }
//
//     await retrieveReportBox?.put('reportDataKey', reportDataModel!);
//     await expireTimeBox?.put(
//         'expireTimeKey', DateTime.now().add(const Duration(days: 1)));
//
//     _getHiveData();
//   }
//
//   Future _storePhoneNumber() async {
//     if (phnno == null) {
//       return;
//     }
//
//     await phoneNumberBox?.put('phoneNumberKey', phnno!);
//     phoneNumber = phoneNumberBox?.get('phoneNumberKey');
//   }
//
//   Future _deleteReportData() async {
//     await retrieveReportBox!.clear();
//     await expireTimeBox!.clear();
//   }
//
//
//
//   List<AccountTransaction> incomeCalenderRangeTransactionDate = [];
//
//   List<AccountTransaction> expenseCalendarRangeTransactionDate = [];
//
//   List<MapEntry<String, double>> incomeCategoryEntries = [];
//
//   List<MapEntry<String, double>> expenseCategoryEntries = [];
//
//   Map<String, double>? incomeCountCategory;
//   Map<String, double>? expenseCountCategory;
//
//   Map<String, double> incomeCountCategories(
//       List<AccountTransaction> incomeCalendarRangeTransactionDate) {
//     Map<String, double> incomeCount = {};
//
//     for (var incomeUserChosenDate in incomeCalenderRangeTransactionDate.where(
//             (element) => element.amount != null && (element.amount! > 0))) {
//       double percentage =
//           ((incomeUserChosenDate.amount!.abs()) / chosedMonthTotalIncome) * 100;
//
//       updateEntryIncome(incomeUserChosenDate.category ?? '', percentage);
//       notifyListeners();
//     }
//
//     return incomeCount;
//
//   }
//
//   Map<String, double> expenseCountCategories(
//       List<AccountTransaction> expenseCalenderRangeTransactionDate) {
//     Map<String, double> expenseCount = {};
//
//     for (var expenseUserChosenDate in expenseCalendarRangeTransactionDate.where(
//             (element) => element.amount != null && element.amount! < 0)) {
//       double percentage =
//           ((expenseUserChosenDate.amount!.abs()) / choosedMonthTotalExpense) * 100;
//
//       updateEntryExpense(expenseUserChosenDate.category ?? '', percentage);
//
//       notifyListeners();
//     }
//
//
//     return expenseCount;
//   }
//
//   void updateEntryIncome(String key, double newValue) {
//     for (int i = 0; i < incomeCategoryEntries.length; i++) {
//       if (incomeCategoryEntries[i].key == key) {
//         // Create a new MapEntry with the updated value
//         incomeCategoryEntries[i] = MapEntry(key, newValue);
//         print("newValue${newValue}");
//         break;
//       }
//     }
//   }
//
//   void updateEntryExpense(String key, double newValue) {
//     for (int i = 0; i < expenseCategoryEntries.length; i++) {
//       if (expenseCategoryEntries[i].key == key) {
//         // Create a new MapEntry with the updated value
//         expenseCategoryEntries[i] = MapEntry(key, newValue);
//         break;
//       }
//     }
//   }
//
//
//
//   double percentageCalculationForIncome(double incomeTotalMonth) {
//     return (incomeTotalMonth / chosedMonthTotalIncome) * 100;
//   }
//
//   double percentageCalculationForExpense(double expenseTotalMonth) {
//     return (expenseTotalMonth / choosedMonthTotalExpense) * 100;
//   }
//
//   void categoriesIncomeAnalytics() {
//     List<AccountTransaction> transactions =
//         reportDataModel.reportData?.banks?.first.accounts?.first.transactions ??
//             [];
//     if (transactions.isEmpty) {
//       showNoTransactionsMessage();
//       return;
//     }
//
//     incomeCalenderRangeTransactionDate = transactions
//         .where((AccountTransaction element) =>
//             (element.date == _dateTime) && (element.category != null))
//         .toList();
//
//     double chosedMonthTotalIncome = incomeCalenderRangeTransactionDate
//         .where((element) => (element.amount ?? 0) > 0)
//         .fold(
//             0.0,
//             (previousValue, element) =>
//                 previousValue + (element.amount ?? 0).toDouble())
//         .abs();
//
//     ///needed this function
//     // chosedMonthTotalIncome = incomeCalenderRangeTranscationDate
//     //     .fold(
//     //     0.0,
//     //         (previousValue, element) =>
//     //      previousValue + (element.amount?.toDouble() ?? 0.0)
//     // ).abs();
//
//     incomeCountCategory =
//         incomeCountCategories(incomeCalenderRangeTransactionDate);
//
//     // incoemCountCategory.update(key, (value) => null)
//
//     incomeCategoryEntries =
//         incomeCountCategories(incomeCalenderRangeTransactionDate)
//             .entries
//             .toList();
//
//     for (var incomeUserChosenDate in incomeCalenderRangeTransactionDate.where(
//         (element) => element.amount != null && (element.amount ?? 0.0) > 0)) {
//       double percentage =
//           ((incomeUserChosenDate.amount!.abs()) / chosedMonthTotalIncome) * 100;
//
//       updateEntryIncome(incomeUserChosenDate.category ?? '', percentage);
//     }
//
//     notifyListeners();
//   }
//
//   void categoriesExpenseAnalytics() {
//     List<AccountTransaction> transactions =
//         reportDataModel.reportData?.banks?.first.accounts?.first.transactions ??
//             [];
//     if (transactions.isEmpty) {
//       showNoTransactionsMessage();
//       return;
//     }
//
//     expenseCalendarRangeTransactionDate = transactions
//         .where((AccountTransaction element) =>
//     (element.date == _dateTime) && (element.category != null))
//         .toList();
//
//     double choosedMonthTotalExpense = expenseCalendarRangeTransactionDate
//         .where((element) => (element.amount ?? 0) < 0)
//         .fold(
//         0.0,
//             (previousValue, element) =>
//         previousValue + (element.amount ?? 0).toDouble())
//         .abs();
//
//     ///needed this function
//     // chosedMonthTotalIncome = incomeCalenderRangeTranscationDate
//     //     .fold(
//     //     0.0,
//     //         (previousValue, element) =>
//     //      previousValue + (element.amount?.toDouble() ?? 0.0)
//     // ).abs();
//
//     expenseCountCategory =
//         expenseCountCategories(expenseCalendarRangeTransactionDate);
//
//     // incoemCountCategory.update(key, (value) => null)
//
//     expenseCategoryEntries =
//         expenseCountCategories(expenseCalendarRangeTransactionDate)
//             .entries
//             .toList();
//
//     /* expenseCountCategory = expenseCountCategories(incomeCalenderRangeTranscationDate);
//
//     // incoemCountCategory.update(key, (value) => null)
//
//     expenseCategoryEntries =
//         expenseCountCategories(incomeCalenderRangeTranscationDate).entries.toList();*/
//
//     for (var expenseUserChosenDate in expenseCalendarRangeTransactionDate.where(
//             (element) => element.amount != null && (element.amount ?? 0.0) > 0)) {
//       double percentage =
//           ((expenseUserChosenDate.amount!.abs()) / choosedMonthTotalExpense) * 100;
//
//       updateEntryExpense(expenseUserChosenDate.category ?? '', percentage);
//     }
//
//     notifyListeners();
//   }
//
//   void applyCategoryFilterIncome({required String categoryNameFromServer}) {
//     String trimmedCategoryName = categoryNameFromServer;
//
//     if (categoryNameFromServer.startsWith('Transfer to')) {
//       trimmedCategoryName =
//           categoryNameFromServer.replaceFirst('Transfer to', '').trim();
//     } else if (categoryNameFromServer.startsWith('Transfer from')) {
//       trimmedCategoryName =
//           categoryNameFromServer.replaceFirst('Transfer from', '').trim();
//     }
//
//     selectedCategoryNameIncome = trimmedCategoryName;
//
//     selectedCategoryNameTotalAmountIncome = incomeCalenderRangeTransactionDate
//         .where((AccountTransaction accountTransaction) =>
//     accountTransaction.category == categoryNameFromServer)
//         .fold(
//         0.0,
//             (previousValue, element) =>
//         previousValue + (element.amount ?? 0.0));
//
//     incomeCalenderRangeTransactionDate = incomeCalenderRangeTransactionDate
//         .where((AccountTransaction accountTransaction) =>
//     accountTransaction.category?.contains(categoryNameFromServer) ??
//         false)
//         .toList();
//
//     notifyListeners();
//   }
//
//   void applyCategoryFilterExpense({required String categoryNameFromServer}) {
//     String trimmedCategoryName = categoryNameFromServer;
//
//     if (categoryNameFromServer.startsWith('Transfer to')) {
//       trimmedCategoryName =
//           categoryNameFromServer.replaceFirst('Transfer to', '').trim();
//     } else if (categoryNameFromServer.startsWith('Transfer from')) {
//       trimmedCategoryName =
//           categoryNameFromServer.replaceFirst('Transfer from', '').trim();
//     }
//
//     selectedCategoryNameExpense = trimmedCategoryName;
//
//     selectedCategoryNameTotalAmountExpense = expenseCalendarRangeTransactionDate
//         .where((AccountTransaction accountTransaction) =>
//     accountTransaction.category == categoryNameFromServer)
//         .fold(
//         0.0,
//             (previousValue, element) =>
//         previousValue + (element.amount ?? 0.0));
//
//     expenseCalendarRangeTransactionDate = expenseCalendarRangeTransactionDate
//         .where((AccountTransaction accountTransaction) =>
//     accountTransaction.category?.contains(categoryNameFromServer) ??
//         false)
//         .toList();
//
//     notifyListeners();
//   }
//
//   /*void categoriesExpenseAnalytics() {
//     List<AccountTransaction> transactions =
//         reportDataModel.reportData?.banks?.first.accounts?.first.transactions ??
//             [];
//     if (transactions.isEmpty) {
//       showNoTransactionsMessage();
//       return;
//     }
//
//     incomeCalenderRangeTranscationDate = transactions
//         .where((AccountTransaction element) =>
//     (element.date == _dateTime) && (element.category != null))
//         .toList();
//
//     double chosedMonthTotalIncome = incomeCalenderRangeTranscationDate
//         .where((element) => (element.amount ?? 0) > 0)
//         .fold(
//         0.0,
//             (previousValue, element) =>
//         previousValue + (element.amount ?? 0).toDouble())
//         .abs();
//
//     double choosedMonthTotalExpense = incomeCalenderRangeTranscationDate
//         .where((element) => (element.amount ?? 0) <= 0)
//         .fold(
//         0.0,
//             (previousValue, element) =>
//         previousValue + (element.amount ?? 0.0).toDouble());
//
//     ///needed this function
//     // chosedMonthTotalIncome = incomeCalenderRangeTranscationDate
//     //     .fold(
//     //     0.0,
//     //         (previousValue, element) =>
//     //      previousValue + (element.amount?.toDouble() ?? 0.0)
//     // ).abs();
//
//     incomeCountCategory = incomeCountCategories(incomeCalenderRangeTranscationDate);
//
//     // incoemCountCategory.update(key, (value) => null)
//
//     incomeCategoryEntries =
//         incomeCountCategories(incomeCalenderRangeTranscationDate).entries.toList();
//
//     expenseCountCategory = expenseCountCategories(incomeCalenderRangeTranscationDate);
//
//     // incoemCountCategory.update(key, (value) => null)
//
//     expenseCategoryEntries =
//         expenseCountCategories(incomeCalenderRangeTranscationDate).entries.toList();
//
//     for (var incomeUserChosenDate in incomeCalenderRangeTranscationDate
//         .where((element) => element.amount != null && (element.amount??0.0) > 0)) {
//       double percentage =
//           ((incomeUserChosenDate.amount!.abs()) / chosedMonthTotalIncome) * 100;
//
//       updateEntryIncome(incomeUserChosenDate.category ?? '', percentage);
//     }
//
//     for (var expenseChosenDate in expenseCalendarRangeTranscationDate
//         .where((element) => element.amount != null && (element.amount??0.0) <= 0)) {
//       double percentage =
//           ((expenseChosenDate.amount!.abs()) / choosedMonthTotalExpense) * 100;
//
//       updateEntry(expenseChosenDate.category ?? '', percentage);
//     }
//
//     notifyListeners();
//   }*/
//
//   void showNoTransactionsMessage() {
//     noTransactionsAvailable = true;
//     notifyListeners();
//   }
//
//   Map<String, double> incomeExpenseMapData = {
//     "Income": 0.0,
//     "Expense": 0.0,
//   };
//
//   void calculateIncomeExpenseAnalytics() {
//     isLoading = true;
//
//     if (reportDataModel.reportData?.banks?.isNotEmpty ?? false) {
//       var bank = reportDataModel.reportData?.banks;
//
//       if (bank?[0].accounts?.isNotEmpty ?? false) {
//         var account = bank?[0].accounts?[0];
//         var transactions = account?.transactions;
//
//         if (transactions?.isNotEmpty ?? false) {
//           // _dataMap.clear();
//
//           transactions?.forEach((transaction) {
//             DateTime transactionDate =
//                 DateTime.parse(transaction.transactionTimestamp.toString());
//             // double amount =
//             //     double.tryParse(transaction.amount.toString()) ?? 0.0;
//
//             if (transactionDate.year == _getDate.year &&
//                 transactionDate.month == _getDate.month) {
//               double chosedMonthTotalIncome = totalCredit +
//                   totalDebit +
//                   totalInvestment +
//                   totalBillsUtilities +
//                   totalTravel +
//                   totalTransferToBharatPe;
//
//               if (chosedMonthTotalIncome > 0) {
//                 double total = totalIncome + totalExpense;
//                 incomeExpenseMapData['Income'] =
//                     total > 0 ? (totalIncome / total) * 100 : 0;
//                 incomeExpenseMapData['Expense'] =
//                     total > 0 ? (totalExpense / total) * 100 : 0;
//               } else {
//                 incomeExpenseMapData = {
//                   'Income': 0.0,
//                   'Expense': 0.0,
//                 };
//               }
//             }
//           });
//
//           ///     print('Data Map: $_dataMap');
//
//           notifyListeners();
//         } else {
//           if (kDebugMode) {
//             print('No transactions found for the account.');
//           }
//           notifyListeners();
//         }
//       } else {
//         if (kDebugMode) {
//           print('No accounts found for the bank.');
//         }
//         notifyListeners();
//       }
//       isLoading = false;
//     } else {
//       if (kDebugMode) {
//         print('No banks found in the report data.');
//       }
//       isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void calculateIncomeAndExpense() {
//     final banks = reportDataModel.reportData?.banks;
//
//     if (banks != null && banks.isNotEmpty) {
//       final accounts = banks[0].accounts;
//
//       if (accounts != null && accounts.isNotEmpty) {
//         final transactions = accounts[0].transactions;
//
//         if (transactions != null && transactions.isNotEmpty) {
//           double totalIncome = 0.0;
//           double totalExpense = 0.0;
//           double totalTransactions = 0.0;
//
//           for (var transaction in transactions) {
//             DateTime? transactionDate = transaction.transactionTimestamp;
//
//             if (transactionDate != null) {
//               if (transactionDate.year == _getDate.year &&
//                   transactionDate.month == _getDate.month) {
//                 double amount = (transaction.amount ?? 0).toDouble();
//                 totalTransactions += amount.abs();
//
//                 if (amount > 0) {
//                   totalIncome += amount;
//                   if (kDebugMode) {
//                     print("Added income: $amount");
//                   }
//                 } else if (amount < 0) {
//                   totalExpense += amount.abs();
//                   if (kDebugMode) {
//                     print("Added expense: ${amount.abs()}");
//                   }
//                 }
//               }
//             } else {
//               if (kDebugMode) {
//                 print("Transaction timestamp is null.");
//               }
//             }
//           }
//
//           if (totalTransactions > 0) {
//             double incomePercentage = (totalIncome / totalTransactions) * 100;
//             double expensePercentage = (totalExpense / totalTransactions) * 100;
//
//             incomeExpenseMapData = {
//               "Income": incomePercentage,
//               "Expense": expensePercentage,
//             };
//
//             noTransactionsAvailable = false;
//           } else {
//             noTransactionsAvailable = true;
//           }
//
//           this.totalIncome = totalIncome;
//           this.totalExpense = totalExpense;
//
//           notifyListeners();
//           if (kDebugMode) {
//             print('Total Income for selected month: $totalIncome');
//           }
//           if (kDebugMode) {
//             print('Total Expense for selected month: $totalExpense');
//           }
//         } else {
//           if (kDebugMode) {
//             print('No transactions found.');
//           }
//           noTransactionsAvailable = true;
//         }
//       } else {
//         if (kDebugMode) {
//           print('No accounts found.');
//         }
//         noTransactionsAvailable = true;
//       }
//     } else {
//       if (kDebugMode) {
//         print('No banks found.');
//       }
//       noTransactionsAvailable = true;
//     }
//   }
//
//   void setIncomeExpense(DateTime newDateTime) {
//     _getDate = newDateTime;
//     calculateIncomeExpenseAnalytics();
//     calculateIncomeAndExpense();
//
//     notifyListeners();
//   }
//
//   void setCategoryDatesForIncome(DateTime newDateTime) {
//     _dateTime = newDateTime;
//     categoriesIncomeAnalytics();
//     notifyListeners();
//   }
//
//   void setCategoryDatesForExpense(DateTime newDateTime) {
//     _dateTimeValue = newDateTime;
//     categoriesExpenseAnalytics();
//     notifyListeners();
//   }
//
//   Color getColorForEntry({required MapEntry<String, double> entry}) {
//     final List<Color> colors = [
//       const Color.fromRGBO(168, 226, 156, 1),
//       const Color.fromRGBO(226, 211, 156, 1),
//       const Color.fromRGBO(195, 247, 236, 1),
//       const Color.fromRGBO(239, 183, 234, 1),
//       const Color.fromRGBO(154, 175, 225, 1),
//       const Color.fromRGBO(180, 224, 241, 1),
//       const Color.fromRGBO(229, 210, 239, 1),
//       const Color.fromRGBO(255, 215, 186, 1),
//       const Color.fromRGBO(210, 250, 220, 1),
//       const Color.fromRGBO(255, 239, 186, 1),
//     ];
//
//     int index = incomeCategoryEntries.indexOf(entry);
//
//     if (index < 0 || index >= colors.length) {
//       index = index % colors.length;
//     }
//
//     return colors[index];
//   }
//
//   Color getColorForIncomeCategories(int index) {
//     const colors = [
//       Color.fromRGBO(226, 211, 156, 1),
//       Color.fromRGBO(239, 183, 234, 1),
//     ];
//     return colors[index % colors.length];
//   }
//
//   void applyFilter(DateTime? selectedDateFrom, DateTime? selectedDateTo) {
//     _filteredTransactions =
//         reportDataModel.reportData?.banks?[0].accounts?[0].transactions ?? [];
//
//     bool hasDebit = selectedValues.contains('DEBIT');
//     bool hasCredit = selectedValues.contains('CREDIT');
//     bool hasUPI = selectedValues.contains('UPI');
//     bool hasATM = selectedValues.contains('ATM');
//     bool hasOthers = selectedValues.contains('OTHERS');
//
//     // Check if any filter is applied
//     if (!hasDebit && !hasCredit && !hasUPI && !hasATM && !hasOthers &&
//         selectedDateFrom == null && selectedDateTo == null) {
//       showSnackBar('Please choose at least one filter option');
//       return;
//     }
//
//     _filteredTransactions = _filteredTransactions.where((transaction) {
//       bool matchesDebitCredit = false;
//       bool matchesMode = false;
//       bool matchesDate = true;
//
//       // Filter by debit/credit
//       if (hasDebit && transaction.amount! < 0) {
//         matchesDebitCredit = true;
//       }
//       if (hasCredit && transaction.amount! > 0) {
//         matchesDebitCredit = true;
//       }
//
//       // Filter by mode
//       if (hasUPI && transaction.modeFromSource == 'UPI') {
//         matchesMode = true;
//       }
//       if (hasATM && transaction.modeFromSource == 'ATM') {
//         matchesMode = true;
//       }
//       if (hasOthers && transaction.modeFromSource == 'OTHERS') {
//         matchesMode = true;
//       }
//
//       // Filter by date
//       if (selectedDateFrom != null && selectedDateTo != null) {
//         DateTime? transactionDate = transaction.transactionTimestamp;
//         if (transactionDate != null) {
//           if (!(transactionDate.isAfter(selectedDateFrom) &&
//               transactionDate.isBefore(selectedDateTo.add(const Duration(days: 1))))) {
//             matchesDate = false;
//           }
//         }
//       }
//
//       // Ensure at least one of the filters matches
//       return (matchesDebitCredit || matchesMode) && matchesDate;
//     }).toList();
//
//     // If no transactions are found after filtering
//     if (_filteredTransactions.isEmpty) {
//       showSnackBar('No transactions found for the selected filters');
//     }
//
//     notifyListeners();
//   }
//
//
//   void resetFilter(TextEditingController dateFromController,
//       TextEditingController dateToController) {
//     selectedValues.clear();
//     dateFromController.clear();
//     dateToController.clear();
//     transactionFilter();
//     notifyListeners();
//   }
//
//   Map<String, Icon> categoryIcons = {
//     'UPI':
//         const Icon(Icons.credit_card_off_sharp, size: 35, color: Colors.blue),
//     'Transfer to': const Icon(CupertinoIcons.paperplane_fill,
//         size: 35, color: Colors.green),
//     'Investment Expense':
//         const Icon(Icons.currency_rupee_sharp, size: 35, color: Colors.orange),
//     'Insurance':
//         const Icon(CupertinoIcons.italic, size: 35, color: Colors.purple),
//     'Travel':
//         const Icon(Icons.travel_explore_outlined, size: 35, color: Colors.red),
//     'Cash Withdrawal': const Icon(Icons.money_off, size: 35, color: Colors.red),
//     'Bills & Utilities':
//         const Icon(CupertinoIcons.house_fill, size: 35, color: Colors.red),
//     'Salary': const Icon(Icons.account_balance_wallet_outlined,
//         size: 35, color: Colors.red),
//     'Interest': const Icon(Icons.interests, size: 35, color: Colors.red),
//     'Investment Income': const Icon(
//       Icons.money,
//       size: 35,
//       color: Colors.yellowAccent,
//     ),
//     'Charges': const Icon(
//       Icons.offline_bolt_outlined,
//       size: 35,
//       color: Colors.brown,
//     ),
//     'Others': const Icon(CupertinoIcons.arrow_down_left_square_fill,
//         size: 35, color: Color.fromRGBO(128, 155, 186, 1)),
//   };
//
//   Future<String?> generateUrl(String phoneNumber) async {
//     isLoading = true;
//     notifyListeners();
//
//     final generateUrl =
//         Uri.parse('https://aaa-prd.onrender.com/api/v1/generateUrl');
//     String? receivedUrl;
//
//     try {
//       final response = await http.post(
//         generateUrl,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'phoneNumber': phoneNumber}),
//       );
//       if (kDebugMode) {
//         print('generateUrl-------->>> ${response.body}');
//       }
//       if (response.statusCode == 200) {
//         final responseData = jsonDecode(response.body);
//         if (responseData['success']) {
//           receivedUrl = responseData['responseData']['url'];
//           // _requestId = responseData['updatedUser']['requestId'];
//           phnno = responseData['updatedUser']['phoneNumber'];
//           reqId = responseData['updatedUser']['requestId'];
//
//           if (kDebugMode) {
//             print("Received URL: $receivedUrl");
//           }
//           // if (kDebugMode) {
//           //   print("Request ID: $_requestId");
//           // }
//         } else if (response.statusCode == 400) {
//           showSnackBar('Failed: ${responseData['message']}');
//         } else if (response.statusCode == 500) {
//           showSnackBar('Failed: ${responseData['message']}');
//         } else {
//           showSnackBar('Failed: ${responseData['message']}');
//         }
//       }
//       else {
//         showSnackBar('Server responded with status: ${response.statusCode}');
//       }
//     } on SocketException catch (_) {
//       showSnackBar('Network error: Unable to connect to the server.');
//     } on FormatException catch (error) {
//       showSnackBar('Format Exception:Unable to connect to the server.$error');
//     } on PlatformException catch (_) {
//       showSnackBar('Platform Exception :Please Check the Permissions.');
//     } catch (error) {
//       showSnackBar('Exception: $error');
//     } finally {
//       issloading = false;
//       notifyListeners();
//     }
//
//     return receivedUrl;
//   }
//
//   Future<void> fetchStatusCheck() async {
//     // if (reqId == null) return;
//     issloading = true;
//     notifyListeners();
//     final statusCheckUrl =
//         Uri.parse('https://aaa-prd.onrender.com/api/v1/statusCheck');
//     try {
//       final response = await http.post(
//         statusCheckUrl,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           'phoneNumber': phnno, /*'requestId': reqId*/
//         }),
//       );
//       if (kDebugMode) {
//         print('fetchStatusCheck-------->>> ${response.body}');
//       }
//       if (response.statusCode == 200) {
//         /* if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated")*/
//         //final statusResponseData = jsonDecode(response.body);
//         StatusCheck statusCheckResponse =
//             StatusCheck.fromJson(json.decode(response.body));
//         if (statusCheckResponse.success == true &&
//             statusCheckResponse.status?.txnStatus?.first.code ==
//                 'ReportGenerated' /*statusCheck[0].status?.txnStatus?[0].code == "ReportGenerated"*/) {
//           //  if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated"){
//           await _storePhoneNumber();
//           if (kDebugMode) {
//             print(
//                 "Status Check txn_id: ${statusCheckResponse.status?.txnStatus?.first.txnId ?? ''}");
//           }
//           _txn_id = statusCheckResponse.status?.txnStatus?.first.txnId ?? '';
//           // final txnId = statusResponseData['responseData']['txn_id'];
//           await retrieveReportAPI();
//         } else {
//           showSnackBar('Status Check Failed Due to:${response.statusCode}');
//         }
//       }
//       // else {
//       //  showSnackBar('Status Check Failed: ${statusResponseData['message']}');
//       ////  }
//       // }
//       else if (response.statusCode == 500) {
//         showSnackBar('Status Check Server responded with status 500');
//       } else {
//         showSnackBar(
//             'Status Check Server responded with status: ${response.statusCode}');
//       }
//     } on SocketException catch (_) {
//       showSnackBar('Network error: Unable to connect to the server.');
//     } on FormatException catch (_) {
//       showSnackBar('Format Execption:Unable to connect to the server.');
//     } on PlatformException catch (_) {
//       showSnackBar('PlatformException :Please Check the Permissions.');
//     } catch (error) {
//       showSnackBar('Status Check Exception: $error');
//       if (kDebugMode) {
//         print('Status Check Exception: $error');
//       }
//     } finally {
//       issloading = false;
//       notifyListeners();
//     }
//   }
//
//   Future<void> fetchPeriodicRetrieveReport() async {
//     if (reqId == null) return;
//
//     issloading = true;
//     notifyListeners();
//
//     final statusCheckUrl = Uri.parse(
//         'https://accountaggregator.onrender.com/api/v1/periodicretriveReport');
//
//     try {
//       final response = await http.post(
//         statusCheckUrl,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'phoneNumber': phnno}),
//       );
//       //  print("${response.body}");
//       if (response.statusCode == 200) {
//         final statusResponseData = jsonDecode(response.body);
//
//         StatusCheck statusCheckResponse =
//             StatusCheck.fromJson(json.decode(response.body));
//
//         if (statusCheckResponse.success == true) {
//           if (kDebugMode) {
//             print(
//                 "Status Check txn_id: ${statusCheckResponse.status?.txnStatus?.first.txnId ?? ''}");
//           }
//           _txn_id = statusCheckResponse.status?.txnStatus?.first.txnId ?? '';
//           // final txnId = statusResponseData['responseData']['txn_id'];
//           /// await retrieveReport();
//         } else {
//           showSnackBar('Status Check Failed: ${statusResponseData['message']}');
//         }
//       } else {
//         showSnackBar(
//             'Status Check Server responded with status: ${response.statusCode}');
//       }
//     } catch (error) {
//       showSnackBar('Status Check Exception: $error');
//     } finally {
//       issloading = false;
//       notifyListeners();
//     }
//   }
//
//   // Future<void> retrieveReportAPI() async {
//   //   _isReportLoading = true;
//   //   _isProcessing = false;
//   //   _timerSeconds = 15;
//   //   ReportDataHiveModel reportDataModel = ReportDataHiveModel();
//   //   notifyListeners();
//   //
//   //   final retrieveReportUrl =
//   //       Uri.parse('https://aaa-prd.onrender.com/api/v1/retrieveReport');
//   //
//   //   try {
//   //     final response = await http.post(
//   //       retrieveReportUrl,
//   //       headers: {'Content-Type': 'application/json'},
//   //       body: jsonEncode({
//   //         'phoneNumber': phoneNumber, /*'txn_id': _txn_id*/
//   //       }),
//   //     );
//   //
//   //     print('retrieveReportAPI-------->>> ${response.body}');
//   //     print('Report Data Model: ${jsonEncode(reportDataModel.toJson())}');
//   //
//   //     if (response.statusCode == 200) {
//   //       _showTimer = true;
//   //       notifyListeners();
//   //
//   //       for (int i = _timerSeconds; i > 0; i--) {
//   //         await Future.delayed(const Duration(seconds: 1), () {
//   //           _timerSeconds--;
//   //           notifyListeners();
//   //         });
//   //       }
//   //
//   //       _showTimer = false;
//   //       _isProcessing = true;
//   //       notifyListeners();
//   //
//   //       reportDataModel = ReportDataHiveModel.fromJson(response.body);
//   //       if (kDebugMode) {
//   //         print("response.body${response.body}");
//   //       }
//   //       if (reportDataModel.success == true) {
//   //         await _deleteReportData();
//   //         await storeReportDataAndExpireTime(reportDataModel);
//   //         _isProcessing = false;
//   //         notifyListeners();
//   //       } else {
//   //         showSnackBar(
//   //             'Report Retrieval Server responded with status: ${response.statusCode}');
//   //         _isProcessing = false;
//   //         notifyListeners();
//   //       }
//   //     } else {
//   //       showSnackBar(
//   //           'Report Retrieval Server responded with status: ${response.statusCode}');
//   //     }
//   //   } on SocketException catch (_) {
//   //     showSnackBar('Network error: Unable to connect to the server.');
//   //   } on FormatException catch (_) {
//   //     showSnackBar('Format Exception: Unable to connect to the server.');
//   //   } on PlatformException catch (_) {
//   //     showSnackBar('PlatformException: Please Check the Permissions.');
//   //   } catch (error) {
//   //     showSnackBar('Report Retrieval Exception: $error');
//   //   } finally {
//   //     _isReportLoading = false;
//   //     notifyListeners();
//   //   }
//   // }
//
//   Future<void> retrieveReportAPI() async {
//     _isReportLoading = true;
//     ReportDataHiveModel reportDataModel = ReportDataHiveModel();
//     notifyListeners();
//
//     final retrieveReportUrl =
//         Uri.parse('https://aaa-prd.onrender.com/api/v1/retrieveReport');
//
//     try {
//       final response = await http.post(
//         retrieveReportUrl,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({'phoneNumber': phoneNumber, 'txn_id': _txn_id}),
//       );
//
//       print('retrieveReportAPI-------->>> ${response.body}');
//
//       if (response.statusCode == 200) {
//         reportDataModel = ReportDataHiveModel.fromJson(response.body);
//
//         if (reportDataModel.success == true) {
//           await _deleteReportData();
//           await storeReportDataAndExpireTime(reportDataModel);
//           notifyListeners();
//         } else {
//           showSnackBar(
//               'Report Retrieval Server responded with status: ${response.statusCode}');
//         }
//         // final reportResponseData = jsonDecode(response.body);
//         // if (_reportModelData?.success == false) {
//         //   showSnackBar(
//         //       'Report Retrieval Failed status is ${_reportModelData?.success}');
//         // }
//       } else {
//         showSnackBar(
//             'Report Retrieval Server responded with status: ${response.statusCode}');
//       }
//     } on SocketException catch (_) {
//       showSnackBar('Network error: Unable to connect to the server.');
//     } on FormatException catch (_) {
//       showSnackBar('Format Execption:Unable to connect to the server.');
//     } on PlatformException catch (_) {
//       showSnackBar('PlatformException :Please Check the Permissions.');
//     } catch (error) {
//       showSnackBar('Report Retrieval Exception: $error');
//     } finally {
//       _isReportLoading = false;
//       notifyListeners();
//     }
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../Model/StatusCheck.dart';
import '../Model/report.dart';
import '../helpers/snackBar.dart';
import 'package:intl/intl.dart';
import '../widgets/custom_container.dart';

class TransactionProvider extends ChangeNotifier {
  TransactionProvider() {
    _initializeReportBox();
  }

  List<AccountTransaction> _filteredTransactions = [];

  List<dynamic> get filteredTransactions => _filteredTransactions;

  List<AccountTransaction> _filtered = [];

  List<dynamic> get filtered => _filtered;

  bool isLoading = true;

  List<String> selectedValues = [];

  String? selectedCategory;

  String? selectedCategoryName;

  String? selectedCategoryNames;

  double selectedCategoryNameTotalAmount = 0.0;

  double selectedCategoryNameTotalAmounts = 0.0;

  Map<String, double> get datasMap => incomeExpenseMapData;

  double choosedMonthTotalAmount = 0.0;

  double choseTotalAMount=0.0;

  double totalCredit = 0.0;

  double totalDebit = 0.0;

  double totalInvestment = 0.0;

  double totalBillsUtilities = 0.0;

  double totalTravel = 0.0;

  double totalTransferToBharatPe = 0.0;

  double totalIncome = 0.0;

  double totalExpense = 0.0;

  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;

  DateTime _getDate = DateTime.now();

  DateTime get getDate => _getDate;

  bool issloading = false;

  bool get isloading => issloading;

  bool _isReportLoading = false;

  bool get isReportLoading => _isReportLoading;

  String? _requestId;

  String? get requestId => _requestId;

  String? _txn_id;

  String? get txn_id => _txn_id;

  String? phnno;

  String? reqId;

  Box<ReportDataHiveModel>? retrieveReportBox;

  ReportDataHiveModel reportDataModel = ReportDataHiveModel();

  Box<String>? phoneNumberBox;

  String? phoneNumber;

  Box<DateTime>? expireTimeBox;

  DateTime? expireTime;

  bool isTransactionAvailable = false;

  String? _selectedCategory;

  TextEditingController textController = TextEditingController();

  bool showAll = false;

  void enableShowAll() {
    showAll = !showAll;
    notifyListeners();
  }

  void transactionFilter() {
    _filteredTransactions =
        reportDataModel.reportData?.banks?[0].accounts?[0].transactions ?? [];
  }

  void applyCategoryFilter({required String categoryNameFromServer,required bool isFromCategoryIncome}) {
    if(isFromCategoryIncome==true){


      selectedCategoryName = categoryNameFromServer;


      calenderRangeTransactionDate = _filteredTransactions;

      selectedCategoryNameTotalAmount = calenderRangeTransactionDate
          .where((AccountTransaction accountTransaction) =>
      accountTransaction.category == categoryNameFromServer)
          .fold(0.0, (previousValue, element) =>
      previousValue + (element.amount ?? 0.0));

      calenderRangeTransactionDate = calenderRangeTransactionDate
          .where((AccountTransaction accountTransaction) =>
      accountTransaction.category?.contains(categoryNameFromServer) ?? false)
          .toList();

      print("Filtered list length: ${calenderRangeTransactionDate.length}");

      notifyListeners();
    }else{
      selectedCategoryNames = categoryNameFromServer;


      calenderRangesTransactionDate = _filteredTransactions;

      selectedCategoryNameTotalAmounts = calenderRangesTransactionDate
          .where((AccountTransaction accountTransaction) =>
      accountTransaction.category == categoryNameFromServer)
          .fold(0.0, (previousValue, element) =>
      previousValue + (element.amount ?? 0.0));

      calenderRangesTransactionDate = calenderRangesTransactionDate
          .where((AccountTransaction accountTransaction) =>
      accountTransaction.category?.contains(categoryNameFromServer) ?? false)
          .toList();

      print("Filtered list length: ${calenderRangesTransactionDate.length}");

      notifyListeners();
    }

  }

  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void filterTransactions(String searchText) {
    var banks = reportDataModel.reportData?.banks;
    if (banks == null || banks.isEmpty) {
      return;
    }

    var accounts = banks[0].accounts;
    if (accounts == null || accounts.isEmpty) {
      return;
    }

    _filtered = accounts[0].transactions?.where((transaction) {
          bool matchesNarration = transaction.narration!.contains(searchText) ||
              transaction.narration!.contains(searchText.toUpperCase()) ||
              transaction.narration!.contains(searchText.toLowerCase());

          bool matchesCategory = _selectedCategory != null
              ? transaction.narration == _selectedCategory
              : true;

          return matchesNarration && matchesCategory;
        }).toList() ??
        [];

    notifyListeners();
  }

  void selectNarrations(DateTime selectedDate) {
    if (kDebugMode) {
      print(selectedDate.toString());
    }

    _filtered = reportDataModel.reportData?.banks?[0].accounts?[0].transactions
            ?.where((transaction) {
          return transaction.date != null &&
              transaction.date!.year == selectedDate.year &&
              transaction.date!.month == selectedDate.month;
        }).toList() ??
        [];

    notifyListeners();
  }

  Future _initializeReportBox() async {
    try {
      _isReportLoading = true;
      retrieveReportBox =
          await Hive.openBox<ReportDataHiveModel>('reportDataBox');
      phoneNumberBox = await Hive.openBox<String>('phoneNumberBox');
      expireTimeBox = await Hive.openBox<DateTime>('expireTimeBox');

      phoneNumber = phoneNumberBox?.get('phoneNumberKey');
      expireTime = expireTimeBox?.get('expireTimeKey');

      if (_isTimeExpired()) {
        // await _deleteReportData();
        await retrieveReportAPI();
      } else {
        _getHiveData();
      }
    } catch (error) {
      showSnackBar('Error in Database $error');
    }
  }

  void _getHiveData() {
    if (retrieveReportBox?.isEmpty ?? true) {
      const SizedBox.shrink();
    } else {
      reportDataModel = retrieveReportBox!.get('reportDataKey')!;
      if (kDebugMode) {
        print("reportDataModelreportDataModel$reportDataModel");
      }
    }

    expireTime = expireTimeBox?.get('expireTimeKey');
    phoneNumber = phoneNumberBox?.get('phoneNumberKey');

    _isReportLoading = false;
    notifyListeners();
  }

  bool _isTimeExpired() {
    if (expireTime == null) {
      return false;
    } else if (DateTime.now().isAfter(expireTime!)) {
      return true;
    } else {
      return false;
    }
  }

  Future storeReportDataAndExpireTime(
      ReportDataHiveModel? reportDataModel) async {
    if (reportDataModel?.reportData == null) {
      return;
    }

    await retrieveReportBox?.put('reportDataKey', reportDataModel!);
    await expireTimeBox?.put(
        'expireTimeKey', DateTime.now().add(const Duration(days: 1)));

    _getHiveData();
  }

  Future _storePhoneNumber() async {
    if (phnno == null) {
      return;
    }

    await phoneNumberBox?.put('phoneNumberKey', phnno!);
    phoneNumber = phoneNumberBox?.get('phoneNumberKey');
  }

  Future _deleteReportData() async {
    await retrieveReportBox!.clear();
    await expireTimeBox!.clear();
  }

  List<AccountTransaction> calenderRangeTransactionDate = [];
  List<AccountTransaction> calenderRangesTransactionDate = [];
  List<MapEntry<String, double>> categoryEntries = [];
  List<MapEntry<String, double>> categoryEntry = [];
  Map<String, double>? countCategory;
  Map<String,double>? countedCategory;

  void showTransactionDetails(
      BuildContext context,
      AccountTransaction transaction,
      TransactionProvider transactionProvider,
      ) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {

        DateTime transactionDateTime;
        try {
          transactionDateTime = transaction.transactionTimestamp??DateTime.now();
        } catch (e) {
          transactionDateTime = DateTime.now();
        }

        String formattedDate =
        DateFormat('yyyy-MM-dd').format(transactionDateTime);
        String formattedTime = DateFormat.jm().format(transactionDateTime);


        IconData getTypeIcon(String type) {
          return type == 'DEBIT'
              ? CupertinoIcons.arrow_up_right_square_fill
              : CupertinoIcons.arrow_down_left_square_fill;
        }

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.67,
          child: SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              borderOnForeground: true,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Transaction Details",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),
                    ),
                    const SizedBox(height: 5),
                    transactionContainer(
                      "Transaction To:".toUpperCase(),
                      transaction.narration ?? '',
                      Icons.transcribe,
                    ),
                    transactionContainer(
                      "Transaction Type:".toUpperCase(),
                      (transaction.amount ?? 0.0) < 0 ? 'DEBIT' : 'CREDIT',
                      getTypeIcon(
                          (transaction.amount ?? 0.0) < 0 ? 'DEBIT' : 'CREDIT'),
                    ),
                    transactionContainer(
                      "Amount:".toUpperCase(),
                      "₹ ${(transaction.amount ?? 0.0)}",
                      Icons.currency_rupee_sharp,
                    ),
                    transactionContainer(
                      "Mode Of Payment:".toUpperCase(),
                      transaction.modeFromSource ?? 'Unknown',
                      Icons.payment,
                    ),
                    transactionContainer(
                      "Payment Date:".toUpperCase(),
                      formattedDate,
                      Icons.date_range,
                    ),
                    transactionContainer(
                      "Payment Time:".toUpperCase(),
                      formattedTime,
                      Icons.date_range,
                    ),
                    transactionContainer(
                      "Current Balance:".toUpperCase(),
                      "₹ ${transaction.balance}",
                      Icons.account_balance_wallet,
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'CLOSE',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> selectedCategories = [];

  void onCategorySelected(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }

  List<AccountTransaction> getFilteredTransactions() {
    if (selectedCategories.isEmpty) {
      return calenderRangeTransactionDate;
    }

    return calenderRangeTransactionDate.where((transaction) {
      return selectedCategories.contains(transaction.category);
    }).toList();
  }

  Map<String, double> countCategories(
      List<AccountTransaction> calenderRangeTransactionDate) {
    Map<String, double> categoryCount = {};
    for (var userChoosedDataItem in calenderRangeTransactionDate) {
      String category = userChoosedDataItem.category ?? '';
      if (categoryCount.containsKey(category)) {
        categoryCount[category] = categoryCount[category]! + 1.0;
      } else {
        categoryCount[category] = 1.0;
      }
    }

    return categoryCount;
  }

  Map<String, double> countedCategories(
      List<AccountTransaction> calenderRangeTransactionDate) {
    Map<String, double> categoryCounts = {};
    for (var userChoosedDataItem in calenderRangeTransactionDate) {
      String category = userChoosedDataItem.category ?? '';
      if (categoryCounts.containsKey(category)) {
        categoryCounts[category] = categoryCounts[category]! + 1.0;
      } else {
        categoryCounts[category] = 1.0;
      }
    }

    return categoryCounts;
  }

  double percentageCalculation(
      double sameCategoryChosenMonthTotalAmount, double totalAmount) {
    if (totalAmount == 0) {
      return 0;
    } else {
      return (sameCategoryChosenMonthTotalAmount / totalAmount) * 100;
    }
  }

  double percentageCalculationExpense(
      double sameCategoryChosenMonthTotalAmounts, double totalAmount) {
    if (totalAmount == 0) {
      return 0;
    } else {
      return (sameCategoryChosenMonthTotalAmounts / totalAmount) * 100;
    }
  }

  void updateEntry(String key, double newValue) {
    bool entryFound = false;


    for (int i = 0; i < categoryEntries.length; i++) {
      if (categoryEntries[i].key == key) {
        // Add the new percentage to the existing percentage
        double updatedValue = categoryEntries[i].value + newValue;
        categoryEntries[i] = MapEntry(key, updatedValue);
        entryFound = true;
        break;
      }
    }
    if (!entryFound) {
      categoryEntries.add(MapEntry(key, newValue));
    }
  }

  void updateEntryForExpense(String key, double newValue) {
    bool entryFound = false;

    for (int i = 0; i < categoryEntry.length; i++) {
      if (categoryEntry[i].key == key) {
        // Add newValue as a negative expense
        double updatedValue = categoryEntry[i].value + newValue.abs(); // Use abs to avoid negative sign
        categoryEntry[i] = MapEntry(key, updatedValue);
        entryFound = true;
        break;
      }
    }

    if (!entryFound) {
      categoryEntry.add(MapEntry(key, newValue.abs())); // Also add as a positive value
    }
  }

  void calculateAnalyticsForExpense() {
    List<AccountTransaction> transactions =
        reportDataModel.reportData?.banks?.first.accounts?.first.transactions ?? [];

    if (transactions.isEmpty) {
      notifyListeners();
      showNoTransactionsMessage(
        message: 'Transaction Data is Empty !!',
      );
      return;
    }

    // Filter transactions based on the selected date and non-null categories
    calenderRangesTransactionDate = transactions.where((AccountTransaction element) {
      return element.date != null &&
          element.date!.year == _dateTime.year &&
          element.date!.month == _dateTime.month &&
          element.category != null &&
          element.amount != null &&
          element.amount! < 0; // Only consider expenses
    }).toList();

    if (calenderRangesTransactionDate.isEmpty) {
      showNoTransactionsMessage(
        message: 'EXPENSE Data is not available for the chosen date',
      );
      return;
    }

    // Calculate the total absolute amount across all transactions
    double totalAbsoluteAmounts = calenderRangesTransactionDate.fold(
        0.0,
            (previousValue, element) =>
        previousValue + (element.amount?.toDouble().abs() ?? 0.0));

    choseTotalAMount = totalAbsoluteAmounts;

    // Clear previous category entries and create a new map for counting
    Map<String, double> expenseByCategory = {};

    // Process each transaction to calculate the total expense per category
    for (var userChosenDataItem in calenderRangesTransactionDate) {
      String category = userChosenDataItem.category ?? '';
      double amount = userChosenDataItem.amount?.toDouble() ?? 0.0;

      if (amount < 0) {
        double absoluteAmount = amount.abs();
        expenseByCategory.update(category, (value) => value + absoluteAmount,
            ifAbsent: () => absoluteAmount);
      }
    }

    // Update categoryEntry with calculated percentages
    categoryEntry = expenseByCategory.entries.map((entry) {
      double percentage = (entry.value / totalAbsoluteAmounts) * 100;
      print("Expense Category: ${entry.key}, Amount: ${entry.value}, Percentage: $percentage%");
      return MapEntry(entry.key, percentage); // Store the percentage instead of absolute amount
    }).toList();

    // Sort the entries by percentage for expense
    categoryEntry.sort((a, b) => b.value.compareTo(a.value));

    notifyListeners();
  }

  void calculateAnalyticsForIncome() {
    List<AccountTransaction> transactions =
        reportDataModel.reportData?.banks?.first.accounts?.first.transactions ??
            [];
    if (transactions.isEmpty) {
      notifyListeners();
      showNoTransactionsMessage(
        message: 'Transaction Data is Empty !!',
      );
      return;
    }

    // Filter transactions based on the selected date and non-null categories
    calenderRangeTransactionDate = transactions.where((AccountTransaction element) {
      return element.date != null &&
          element.date!.year == _dateTime.year &&
          element.date!.month == _dateTime.month &&
          element.amount != null &&
          element.amount! > 0;
    }).toList();


    // If no valid transactions remain, show no transactions message
    if (calenderRangeTransactionDate.isEmpty) {
      showNoTransactionsMessage(
        message: 'INCOME Data is not available for the chosen date',
      );
      return;
    }

    // Calculate the total absolute amount across all transactions
    double totalAbsoluteAmount = calenderRangeTransactionDate.fold(
        0.0,
            (previousValue, element) =>
        previousValue + (element.amount?.toDouble().abs() ?? 0.0));

    choosedMonthTotalAmount = totalAbsoluteAmount;

    countCategory = countCategories(calenderRangeTransactionDate);

    categoryEntries =
        countCategories(calenderRangeTransactionDate).entries.toList();

    categoryEntries = categoryEntries.toList()
      ..sort((a, b) {
        final percentageA = a.value.truncate() > 0 ? a.value.truncate() : 0;
        final percentageB = b.value.truncate() > 0 ? b.value.truncate() : 0;
        return percentageB.compareTo(percentageA);
      });

    Map<String, double> incomeByCategory = {};
    Map<String, double> expenseByCategory = {};

    for (var userChosenDataItem in calenderRangeTransactionDate) {
      String category = userChosenDataItem.category ?? '';
      double amount = userChosenDataItem.amount?.toDouble() ?? 0.0;


      if (amount > 0) {
        incomeByCategory.update(category, (value) => value += amount,
            ifAbsent: () => amount);

        double percentage = (amount.abs() / totalAbsoluteAmount) * 100;
        updateEntry(category, percentage);

        print("Income Category: $category, Amount: $amount, Percentage: $percentage%");
      }

      // else if (amount < 0) {
      //   double absoluteAmount = amount.abs();
      //   expenseByCategory.update(category, (value) => value += absoluteAmount,
      //       ifAbsent: () => absoluteAmount);
      //
      //   double percentage = (absoluteAmount / totalAbsoluteAmount) * 100;
      //   updateEntry(category, percentage);
      //
      //   print("Expense Category: $category, Amount: $absoluteAmount, Percentage: $percentage%");
      // }
    }

    notifyListeners();
  }

  void showNoTransactionsMessage({String? message}) {
    if (message != null) {
      showSnackBar(message);
    }

    notifyListeners();
  }

  Map<String, double> incomeExpenseMapData = {
    "Income": 0.0,
    "Expense": 0.0,
  };

  void calculateIncomeExpenseAnalytics() {
    isLoading = true;

    if (reportDataModel.reportData?.banks?.isNotEmpty ?? false) {
      var bank = reportDataModel.reportData?.banks;

      if (bank?[0].accounts?.isNotEmpty ?? false) {
        var account = bank?[0].accounts?[0];
        var transactions = account?.transactions;

        if (transactions?.isNotEmpty ?? false) {
          ///   _dataMap.clear();

          transactions?.forEach((transaction) {
            DateTime transactionDate =
                DateTime.parse(transaction.transactionTimestamp.toString());
            // double amount =
            //     double.tryParse(transaction.amount.toString()) ?? 0.0;

            if (transactionDate.year == _getDate.year &&
                transactionDate.month == _getDate.month) {
              double choosedMonthTotalAmount = totalCredit +
                  totalDebit +
                  totalInvestment +
                  totalBillsUtilities +
                  totalTravel +
                  totalTransferToBharatPe;

              if (choosedMonthTotalAmount > 0) {
                double total = totalIncome + totalExpense;
                incomeExpenseMapData['Income'] =
                    total > 0 ? (totalIncome / total) * 100 : 0;
                incomeExpenseMapData['Expense'] =
                    total > 0 ? (totalExpense / total) * 100 : 0;
              } else {
                incomeExpenseMapData = {
                  'Income': 0.0,
                  'Expense': 0.0,
                };
              }
            }
          });

          ///     print('Data Map: $_dataMap');

          notifyListeners();
        } else {
          if (kDebugMode) {
            print('No transactions found for the account.');
          }
          notifyListeners();
        }
      } else {
        if (kDebugMode) {
          print('No accounts found for the bank.');
        }
        notifyListeners();
      }
      isLoading = false;
    } else {
      if (kDebugMode) {
        print('No banks found in the report data.');
      }
      isLoading = false;
      notifyListeners();
    }
  }

  void calculateIncomeAndExpense() {
    final banks = reportDataModel.reportData?.banks;

    if (banks != null && banks.isNotEmpty) {
      final accounts = banks[0].accounts;

      if (accounts != null && accounts.isNotEmpty) {
        final transactions = accounts[0].transactions;

        if (transactions != null && transactions.isNotEmpty) {
          double totalIncome = 0.0;
          double totalExpense = 0.0;
          double totalTransactions = 0.0;

          for (var transaction in transactions) {
            DateTime? transactionDate = transaction.transactionTimestamp;

            if (transactionDate != null) {
              if (transactionDate.year == _getDate.year &&
                  transactionDate.month == _getDate.month) {
                double amount = (transaction.amount ?? 0).toDouble();
                totalTransactions += amount.abs();

                if (amount > 0) {
                  totalIncome += amount;
                  if (kDebugMode) {
                    print("Added income: $amount");
                  }
                } else if (amount < 0) {
                  totalExpense += amount.abs();
                  if (kDebugMode) {
                    print("Added expense: ${amount.abs()}");
                  }
                }
              }
            } else {
              if (kDebugMode) {
                print("Transaction timestamp is null.");
              }
            }
          }

          if (totalTransactions > 0) {
            double incomePercentage = (totalIncome / totalTransactions) * 100;
            double expensePercentage = (totalExpense / totalTransactions) * 100;

            incomeExpenseMapData = {
              "Income": incomePercentage,
              "Expense": expensePercentage,
            };

            isTransactionAvailable = false;
          } else {
            isTransactionAvailable = true;
          }

          this.totalIncome = totalIncome;
          this.totalExpense = totalExpense;

          notifyListeners();
          if (kDebugMode) {
            print('Total Income for selected month: $totalIncome');
          }
          if (kDebugMode) {
            print('Total Expense for selected month: $totalExpense');
          }
        } else {
          if (kDebugMode) {
            print('No transactions found.');
          }
          isTransactionAvailable = true;
        }
      } else {
        if (kDebugMode) {
          print('No accounts found.');
        }
        isTransactionAvailable = true;
      }
    } else {
      if (kDebugMode) {
        print('No banks found.');
      }
      isTransactionAvailable = true;
    }
  }

  void setIncomeExpense(DateTime newDateTime) {
    _getDate = newDateTime;
    calculateIncomeExpenseAnalytics();
    calculateIncomeAndExpense();

    notifyListeners();
  }

  void setCategoryDatas(DateTime newDateTime) {
    _dateTime = newDateTime;
    calculateAnalyticsForIncome();


    notifyListeners();
  }

  void setCategoryDatasExpense(DateTime newDateTime) {
    _dateTime = newDateTime;
   calculateAnalyticsForExpense();


    notifyListeners();
  }


  void onSelectFilterName(String selectedCategory) {
    calenderRangeTransactionDate = calenderRangeTransactionDate
        .where((element) =>
            element.category == selectedCategory && (element.amount ?? 0.0) > 0)
        .toList();
    notifyListeners();
  }

  void onSelectCategoryItem({
    required int index,
    required String selectedCategory,
  }) {
     selectedCategoryName = selectedCategory;

    selectedCategoryNameTotalAmount = calenderRangeTransactionDate
        .where(
          (AccountTransaction accountTransaction) =>
              accountTransaction.category == selectedCategory,
        )
        .fold(
            0.0,
            (previousValue, element) =>
                previousValue + (element.amount ?? 0));

    notifyListeners();
  }

  void onSelectCategoryItems({
    required int index,
    required String selectedCategory,
  }) {
    selectedCategoryNames = selectedCategory;

    selectedCategoryNameTotalAmount = calenderRangesTransactionDate
        .where(
          (AccountTransaction accountTransaction) =>
      accountTransaction.category == selectedCategory,
    )
        .fold(
        0.0,
            (previousValue, element) =>
        previousValue + (element.amount ?? 0));

    notifyListeners();
  }

  Color getColorForEntry({required MapEntry<String, double> entry,required bool isFromIncome}) {
    final List<Color> colors = [
      const Color.fromRGBO(168, 226, 156, 1),
      const Color.fromRGBO(226, 211, 156, 1),
      const Color.fromRGBO(195, 247, 236, 1),
      const Color.fromRGBO(239, 183, 234, 1),
      const Color.fromRGBO(154, 175, 225, 1),
      const Color.fromRGBO(180, 224, 241, 1),
      const Color.fromRGBO(229, 210, 239, 1),
      const Color.fromRGBO(255, 215, 186, 1),
      const Color.fromRGBO(210, 250, 220, 1),
      const Color.fromRGBO(255, 239, 186, 1),
    ];
if(isFromIncome==true){
  int index = categoryEntries.indexOf(entry);

  if (index < 0 || index >= colors.length) {
    index = index % colors.length;
  }
  print("colorscolorscolors====${colors[index]}");
  return colors[index];
}else{
  int index = categoryEntry.indexOf(entry);

  if (index < 0 || index >= colors.length) {
    index = index % colors.length;
  }
  if (kDebugMode) {
    print("colorscolorscolors====${colors[index]}");
  }
  return colors[index];
}

  }
  String formatCategoryName(String category) {
    if (category.startsWith('Transfer to')) {
      return category.replaceFirst('Transfer to', '').trim();
    } else if (category.startsWith('Transfer from')) {
      return category.replaceFirst('Transfer from', '').trim();
    }
    return category;
  }


  Color getColorForIncomeCategories(int index) {
    const colors = [
      Color.fromRGBO(226, 211, 156, 1),
      Color.fromRGBO(239, 183, 234, 1),
    ];
    return colors[index % colors.length];
  }

  void applyFilter(DateTime? selectedDateFrom, DateTime? selectedDateTo) {

    _filteredTransactions =
        reportDataModel.reportData?.banks?[0].accounts?[0].transactions ?? [];


    if (selectedDateFrom != null && selectedDateTo != null && selectedDateFrom.isAfter(selectedDateTo)) {
      showSnackBar('Please check the date range: From date cannot be after To date.');
      return;
    }

    _filteredTransactions = _filteredTransactions.where((transaction) {
      int matchedFilters = 0;


      if (selectedValues.contains('DEBIT') && transaction.amount! < 0) {
        matchedFilters++;
      }


      if (selectedValues.contains('CREDIT') && transaction.amount! > 0) {
        matchedFilters++;
      }


      if (selectedValues.contains('UPI') && transaction.modeFromSource == 'UPI') {
        matchedFilters++;
      }


      if (selectedValues.contains('ATM') && transaction.modeFromSource == 'ATM') {
        matchedFilters++;
      }


      if (selectedValues.contains('OTHERS') && transaction.modeFromSource == 'OTHERS') {
        matchedFilters++;
      }


      bool isValid = matchedFilters >= 1;


      if (isValid) {
        if (selectedDateFrom != null && selectedDateTo != null) {
          DateTime? transactionDate = transaction.transactionTimestamp;
          if (transactionDate != null) {

            isValid = transactionDate.isAfter(selectedDateFrom) &&
                transactionDate.isBefore(selectedDateTo.add(const Duration(days: 1)));
          } else {
            isValid = false;
          }
        }
      }

      return isValid;
    }).toList();

    // Handle empty filtered transactions
    if (_filteredTransactions.isEmpty) {
      showSnackBar('No transactions found for the selected filters');
    }

    // Handle no filter selected
    if (selectedValues.isEmpty) {
      showSnackBar('Please choose at least one filter option');
    }

    notifyListeners();
  }

  void resetFilter(TextEditingController dateFromController,
      TextEditingController dateToController) {
    selectedValues.clear();
    dateFromController.clear();
    dateToController.clear();
    transactionFilter();
    notifyListeners();
  }

  Map<String, Icon> categoryIcons = {
    'UPI':
        const Icon(Icons.credit_card_off_sharp, size: 35, color: Colors.blue),
    'Transfer to': const Icon(CupertinoIcons.paperplane_fill,
        size: 35, color: Colors.green),
    'Investment Expense':
        const Icon(Icons.currency_rupee_sharp, size: 35, color: Colors.orange),
    'Insurance':
        const Icon(CupertinoIcons.italic, size: 35, color: Colors.purple),
    'Travel':
        const Icon(Icons.travel_explore_outlined, size: 35, color: Colors.red),
    'Cash Withdrawal': const Icon(Icons.money_off, size: 35, color: Colors.red),
    'Bills & Utilities':
        const Icon(CupertinoIcons.house_fill, size: 35, color: Colors.red),
    'Salary': const Icon(Icons.account_balance_wallet_outlined,
        size: 35, color: Colors.red),
    'Interest': const Icon(Icons.interests, size: 35, color: Colors.red),
    'Investment Income': const Icon(
      Icons.money,
      size: 35,
      color: Colors.yellowAccent,
    ),
    'Charges': const Icon(
      Icons.offline_bolt_outlined,
      size: 35,
      color: Colors.brown,
    ),
    'Others': const Icon(CupertinoIcons.arrow_down_left_square_fill,
        size: 35, color: Color.fromRGBO(128, 155, 186, 1)),
  };

  Future<String?> generateUrl(String phoneNumber) async {
    isLoading = true;
    notifyListeners();

    final generateUrl =
        Uri.parse('https://aaa-prd.onrender.com/api/v1/generateUrl');
    String? receivedUrl;

    try {
      final response = await http.post(
        generateUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      if (kDebugMode) {
        print('generateUrl-------->>> ${response.body}');
      }

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['success']) {
          receivedUrl = responseData['responseData']['url'];
          // _requestId = responseData['updatedUser']['requestId'];
          phnno = responseData['updatedUser']['phoneNumber'];
          reqId = responseData['updatedUser']['requestId'];

          if (kDebugMode) {
            print("Received URL: $receivedUrl");
          }
          if (kDebugMode) {
            print("Request ID: $_requestId");
          }
          // fetchStatusCheck();
          // await statusCheck(context, phoneNumber, _requestId);
        } else if (response.statusCode == 400) {
          showSnackBar('Failed: ${responseData['message']}');
        } else if (response.statusCode == 500) {
          showSnackBar('Failed: ${responseData['message']}');
        } else {
          showSnackBar('Failed: ${responseData['message']}');
        }
      } else {
        showSnackBar('Server responded with status: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      showSnackBar('Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showSnackBar('Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showSnackBar('PlatformException :Please Check the Permissions.');
    } catch (error) {
      showSnackBar('Exception: $error');
    } finally {
      issloading = false;
      notifyListeners();
    }

    return receivedUrl;
  }

  Future<void> fetchStatusCheck() async {
    // if (reqId == null) return;
    issloading = true;
    notifyListeners();
    final statusCheckUrl =
        Uri.parse('https://aaa-prd.onrender.com/api/v1/statusCheck');
    try {
      final response = await http.post(
        statusCheckUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phoneNumber': phnno, /*'requestId': reqId*/
        }),
      );
      if (kDebugMode) {
        print('fetchStatusCheck-------->>> ${response.body}');
      }
      if (response.statusCode == 200) {
        /* if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated")*/
        //final statusResponseData = jsonDecode(response.body);
        StatusCheck statusCheckResponse =
            StatusCheck.fromJson(json.decode(response.body));
        if (statusCheckResponse.success == true &&
            statusCheckResponse.status?.txnStatus?.first.code ==
                'ReportGenerated' /*statusCheck[0].status?.txnStatus?[0].code == "ReportGenerated"*/) {
          //  if(statusCheck.isNotEmpty&&statusCheck[0].status?.txnStatus?[0].code=="ReportGenerated"){
          await _storePhoneNumber();
          if (kDebugMode) {
            print(
                "Status Check txn_id: ${statusCheckResponse.status?.txnStatus?.first.txnId ?? ''}");
          }
          _txn_id = statusCheckResponse.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          await retrieveReportAPI();
        } else {
          showSnackBar('Status Check Failed Due to:${response.statusCode}');
        }
      }
      // else {
      //  showSnackBar('Status Check Failed: ${statusResponseData['message']}');
      ////  }
      // }
      else if (response.statusCode == 500) {
        showSnackBar('Status Check Server responded with status 500');
      } else {
        showSnackBar(
            'Status Check Server responded with status: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      showSnackBar('Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showSnackBar('Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showSnackBar('PlatformException :Please Check the Permissions.');
    } catch (error) {
      showSnackBar('Status Check Exception: $error');
      if (kDebugMode) {
        print('Status Check Exception: $error');
      }
    } finally {
      issloading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPeriodicRetrieveReport() async {
    if (reqId == null) return;

    issloading = true;
    notifyListeners();

    final statusCheckUrl = Uri.parse(
        'https://accountaggregator.onrender.com/api/v1/periodicretriveReport');

    try {
      final response = await http.post(
        statusCheckUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phoneNumber': phnno}),
      );
      //  print("${response.body}");
      if (response.statusCode == 200) {
        final statusResponseData = jsonDecode(response.body);

        StatusCheck statusCheckResponse =
            StatusCheck.fromJson(json.decode(response.body));

        if (statusCheckResponse.success == true) {
          if (kDebugMode) {
            print(
                "Status Check txn_id: ${statusCheckResponse.status?.txnStatus?.first.txnId ?? ''}");
          }
          _txn_id = statusCheckResponse.status?.txnStatus?.first.txnId ?? '';
          // final txnId = statusResponseData['responseData']['txn_id'];
          /// await retrieveReport();
        } else {
          showSnackBar('Status Check Failed: ${statusResponseData['message']}');
        }
      } else {
        showSnackBar(
            'Status Check Server responded with status: ${response.statusCode}');
      }
    } catch (error) {
      showSnackBar('Status Check Exception: $error');
    } finally {
      issloading = false;
      notifyListeners();
    }
  }

  // Future<void> retrieveReportAPI() async {
  //   _isReportLoading = true;
  //   _isProcessing = false;
  //   _timerSeconds = 15;
  //   ReportDataHiveModel reportDataModel = ReportDataHiveModel();
  //   notifyListeners();
  //
  //   final retrieveReportUrl =
  //       Uri.parse('https://aaa-prd.onrender.com/api/v1/retrieveReport');
  //
  //   try {
  //     final response = await http.post(
  //       retrieveReportUrl,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'phoneNumber': phoneNumber, /*'txn_id': _txn_id*/
  //       }),
  //     );
  //
  //     print('retrieveReportAPI-------->>> ${response.body}');
  //     print('Report Data Model: ${jsonEncode(reportDataModel.toJson())}');
  //
  //     if (response.statusCode == 200) {
  //       _showTimer = true;
  //       notifyListeners();
  //
  //       for (int i = _timerSeconds; i > 0; i--) {
  //         await Future.delayed(const Duration(seconds: 1), () {
  //           _timerSeconds--;
  //           notifyListeners();
  //         });
  //       }
  //
  //       _showTimer = false;
  //       _isProcessing = true;
  //       notifyListeners();
  //
  //       reportDataModel = ReportDataHiveModel.fromJson(response.body);
  //       if (kDebugMode) {
  //         print("response.body${response.body}");
  //       }
  //       if (reportDataModel.success == true) {
  //         await _deleteReportData();
  //         await storeReportDataAndExpireTime(reportDataModel);
  //         _isProcessing = false;
  //         notifyListeners();
  //       } else {
  //         showSnackBar(
  //             'Report Retrieval Server responded with status: ${response.statusCode}');
  //         _isProcessing = false;
  //         notifyListeners();
  //       }
  //     } else {
  //       showSnackBar(
  //           'Report Retrieval Server responded with status: ${response.statusCode}');
  //     }
  //   } on SocketException catch (_) {
  //     showSnackBar('Network error: Unable to connect to the server.');
  //   } on FormatException catch (_) {
  //     showSnackBar('Format Exception: Unable to connect to the server.');
  //   } on PlatformException catch (_) {
  //     showSnackBar('PlatformException: Please Check the Permissions.');
  //   } catch (error) {
  //     showSnackBar('Report Retrieval Exception: $error');
  //   } finally {
  //     _isReportLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> retrieveReportAPI() async {
    _isReportLoading = true;
    ReportDataHiveModel reportDataModel = ReportDataHiveModel();
    notifyListeners();

    final retrieveReportUrl =
        Uri.parse('https://aaa-prd.onrender.com/api/v1/retrieveReport');

    try {
      final response = await http.post(
        retrieveReportUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'phoneNumber': phoneNumber, /*'txn_id': _txn_id*/
        }),
      );

      print('retrieveReportAPI-------->>> ${response.body}');

      if (response.statusCode == 200) {
        reportDataModel = ReportDataHiveModel.fromJson(response.body);

        if (reportDataModel.success == true) {
          await _deleteReportData();
          await storeReportDataAndExpireTime(reportDataModel);
          notifyListeners();
        } else {
          showSnackBar(
              'Report Retrieval Server responded with status: ${response.statusCode}');
        }
        // final reportResponseData = jsonDecode(response.body);
        // if (_reportModelData?.success == false) {
        //   showSnackBar(
        //       'Report Retrieval Failed status is ${_reportModelData?.success}');
        // }
      } else {
        showSnackBar(
            'Report Retrieval Server responded with status: ${response.statusCode}');
      }
    } on SocketException catch (_) {
      showSnackBar('Network error: Unable to connect to the server.');
    } on FormatException catch (_) {
      showSnackBar('Format Execption:Unable to connect to the server.');
    } on PlatformException catch (_) {
      showSnackBar('PlatformException :Please Check the Permissions.');
    } catch (error) {
      showSnackBar('Report Retrieval Exception: $error');
    } finally {
      _isReportLoading = false;
      notifyListeners();
    }
  }


}
