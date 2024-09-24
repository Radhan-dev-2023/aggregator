import 'package:hive/hive.dart';
import 'dart:convert';
part 'report.g.dart';

@HiveType(typeId: 1)
class ReportDataHiveModel {
  @HiveField(1)
  final bool? success;
  @HiveField(2)
  final ReportData? reportData;

  ReportDataHiveModel({
    this.success,
    this.reportData,
  });

  ReportDataHiveModel copyWith({
    bool? success,
    ReportData? reportData,
  }) =>
      ReportDataHiveModel(
        success: success ?? this.success,
        reportData: reportData ?? this.reportData,
      );

  factory ReportDataHiveModel.fromJson(String str) => ReportDataHiveModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportDataHiveModel.fromMap(Map<String, dynamic> json) => ReportDataHiveModel(
    success: json["success"],
    reportData: json["reportData"] == null ? null : ReportData.fromMap(json["reportData"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "reportData": reportData?.toMap(),
  };
}

@HiveType(typeId: 2)
class ReportData {
  @HiveField(1)
  final String? clientRefNum;
  @HiveField(2)
  final int? requestId;
  @HiveField(3)
  final String? txnId;
  @HiveField(4)
  final DateTime? startDate;
  @HiveField(5)
  final DateTime? endDate;
  @HiveField(6)
  final int? durationInMonth;
  @HiveField(7)
  final String? dgReportVersion;
  @HiveField(8)
  final int? reportNum;
  @HiveField(9)
  final DateTime? reportFetchTime;
  @HiveField(10)
  final String? reportFetchType;
  @HiveField(11)
  final String? sourceOfData;
  @HiveField(12)
  final DateTime? statementStartDate;
  @HiveField(13)
  final DateTime? statementEndDate;
  @HiveField(14)
  final String? multipleAccountsFound;
  @HiveField(15)
  final String? sourceReport;
  @HiveField(16)
  final List<Bank>? banks;
  @HiveField(17)
  final LevelSummaryVar? requestLevelSummaryVar;

  ReportData({
    this.clientRefNum,
    this.requestId,
    this.txnId,
    this.startDate,
    this.endDate,
    this.durationInMonth,
    this.dgReportVersion,
    this.reportNum,
    this.reportFetchTime,
    this.reportFetchType,
    this.sourceOfData,
    this.statementStartDate,
    this.statementEndDate,
    this.multipleAccountsFound,
    this.sourceReport,
    this.banks,
    this.requestLevelSummaryVar,
  });

  ReportData copyWith({
    String? clientRefNum,
    int? requestId,
    String? txnId,
    DateTime? startDate,
    DateTime? endDate,
    int? durationInMonth,
    String? dgReportVersion,
    int? reportNum,
    DateTime? reportFetchTime,
    String? reportFetchType,
    String? sourceOfData,
    DateTime? statementStartDate,
    DateTime? statementEndDate,
    String? multipleAccountsFound,
    String? sourceReport,
    List<Bank>? banks,
    LevelSummaryVar? requestLevelSummaryVar,
  }) =>
      ReportData(
        clientRefNum: clientRefNum ?? this.clientRefNum,
        requestId: requestId ?? this.requestId,
        txnId: txnId ?? this.txnId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        durationInMonth: durationInMonth ?? this.durationInMonth,
        dgReportVersion: dgReportVersion ?? this.dgReportVersion,
        reportNum: reportNum ?? this.reportNum,
        reportFetchTime: reportFetchTime ?? this.reportFetchTime,
        reportFetchType: reportFetchType ?? this.reportFetchType,
        sourceOfData: sourceOfData ?? this.sourceOfData,
        statementStartDate: statementStartDate ?? this.statementStartDate,
        statementEndDate: statementEndDate ?? this.statementEndDate,
        multipleAccountsFound: multipleAccountsFound ?? this.multipleAccountsFound,
        sourceReport: sourceReport ?? this.sourceReport,
        banks: banks ?? this.banks,
        requestLevelSummaryVar: requestLevelSummaryVar ?? this.requestLevelSummaryVar,
      );

  factory ReportData.fromJson(String str) => ReportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReportData.fromMap(Map<String, dynamic> json) => ReportData(
    clientRefNum: json["client_ref_num"],
    requestId: json["request_id"],
    txnId: json["txn_id"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    durationInMonth: json["duration_in_month"],
    dgReportVersion: json["dg_report_version"],
    reportNum: json["report_num"],
    reportFetchTime: json["report_fetch_time"] == null ? null : DateTime.parse(json["report_fetch_time"]),
    reportFetchType: json["report_fetch_type"],
    sourceOfData: json["source_of_data"],
    statementStartDate: json["statement_start_date"] == null ? null : DateTime.parse(json["statement_start_date"]),
    statementEndDate: json["statement_end_date"] == null ? null : DateTime.parse(json["statement_end_date"]),
    multipleAccountsFound: json["multiple_accounts_found"],
    sourceReport: json["source_report"],
    banks: json["banks"] == null ? [] : List<Bank>.from(json["banks"]!.map((x) => Bank.fromMap(x))),
    requestLevelSummaryVar: json["request_level_summary_var"] == null ? null : LevelSummaryVar.fromMap(json["request_level_summary_var"]),
  );

  Map<String, dynamic> toMap() => {
    "client_ref_num": clientRefNum,
    "request_id": requestId,
    "txn_id": txnId,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "duration_in_month": durationInMonth,
    "dg_report_version": dgReportVersion,
    "report_num": reportNum,
    "report_fetch_time": reportFetchTime?.toIso8601String(),
    "report_fetch_type": reportFetchType,
    "source_of_data": sourceOfData,
    "statement_start_date": "${statementStartDate!.year.toString().padLeft(4, '0')}-${statementStartDate!.month.toString().padLeft(2, '0')}-${statementStartDate!.day.toString().padLeft(2, '0')}",
    "statement_end_date": "${statementEndDate!.year.toString().padLeft(4, '0')}-${statementEndDate!.month.toString().padLeft(2, '0')}-${statementEndDate!.day.toString().padLeft(2, '0')}",
    "multiple_accounts_found": multipleAccountsFound,
    "source_report": sourceReport,
    "banks": banks == null ? [] : List<dynamic>.from(banks!.map((x) => x.toMap())),
    "request_level_summary_var": requestLevelSummaryVar?.toMap(),
  };
}

@HiveType(typeId: 3)
class Bank {
  @HiveField(1)
  final String? bank;
  @HiveField(2)
  final int? digitapInstitutionId;
  @HiveField(3)
  final String? sourceBankId;
  @HiveField(4)
  final String? multipleAccountsFound;
  @HiveField(5)
  final List<Account>? accounts;
  @HiveField(6)
  final LevelSummaryVar? bankLevelSummaryVar;

  Bank({
    this.bank,
    this.digitapInstitutionId,
    this.sourceBankId,
    this.multipleAccountsFound,
    this.accounts,
    this.bankLevelSummaryVar,
  });

  Bank copyWith({
    String? bank,
    int? digitapInstitutionId,
    String? sourceBankId,
    String? multipleAccountsFound,
    List<Account>? accounts,
    LevelSummaryVar? bankLevelSummaryVar,
  }) =>
      Bank(
        bank: bank ?? this.bank,
        digitapInstitutionId: digitapInstitutionId ?? this.digitapInstitutionId,
        sourceBankId: sourceBankId ?? this.sourceBankId,
        multipleAccountsFound: multipleAccountsFound ?? this.multipleAccountsFound,
        accounts: accounts ?? this.accounts,
        bankLevelSummaryVar: bankLevelSummaryVar ?? this.bankLevelSummaryVar,
      );

  factory Bank.fromJson(String str) => Bank.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Bank.fromMap(Map<String, dynamic> json) => Bank(
    bank: json["bank"],
    digitapInstitutionId: json["digitap_institution_id"],
    sourceBankId: json["source_bank_id"],
    multipleAccountsFound: json["multiple_accounts_found"],
    accounts: json["accounts"] == null ? [] : List<Account>.from(json["accounts"]!.map((x) => Account.fromMap(x))),
    bankLevelSummaryVar: json["bank_level_summary_var"] == null ? null : LevelSummaryVar.fromMap(json["bank_level_summary_var"]),
  );

  Map<String, dynamic> toMap() => {
    "bank": bank,
    "digitap_institution_id": digitapInstitutionId,
    "source_bank_id": sourceBankId,
    "multiple_accounts_found": multipleAccountsFound,
    "accounts": accounts == null ? [] : List<dynamic>.from(accounts!.map((x) => x.toMap())),
    "bank_level_summary_var": bankLevelSummaryVar?.toMap(),
  };
}

@HiveType(typeId: 4)
class Account {
  @HiveField(1)
  final CustomerInfo? customerInfo;
  @HiveField(2)
  final String? location;
  @HiveField(3)
  final DateTime? openingDate;
  @HiveField(4)
  final String? currentBalance;
  @HiveField(5)
  final Pending? pending;
  @HiveField(6)
  final DateTime? balanceDateTime;
  @HiveField(7)
  final String? currentOdLimit;
  @HiveField(8)
  final String? drawingLimit;
  @HiveField(9)
  final String? currency;
  @HiveField(10)
  final String? exchgeRate;
  @HiveField(11)
  final String? accountStatus;
  @HiveField(12)
  final String? facility;
  @HiveField(13)
  final String? accountIfscCode;
  @HiveField(14)
  final String? micrCode;
  @HiveField(15)
  final String? accountNumber;
  @HiveField(16)
  final String? accountType;
  @HiveField(17)
  final String? accountDescription;
  @HiveField(18)
  final DateTime? transactionStartDate;
  @HiveField(19)
  final DateTime? transactionEndDate;
  @HiveField(20)
  final List<AccountTransaction>? transactions;
  @HiveField(21)
  final List<dynamic>? tamperDetectionDetails;
  @HiveField(22)
  final String? ifscCode;
  // @HiveField(23)
  // final AnalysisData? analysisData;
  @HiveField(23)
  final List<RawDatum>? rawData;
  @HiveField(24)
  final List<DailyOpenCloseBalance>? dailyOpenCloseBalances;
  //@HiveField(25)
  // final RecurrentCr? recurrentCr;
  // @HiveField(26)
  // final RecurrentDr? recurrentDr;
  @HiveField(25)
  final List<LoanAnalysis>? loanAnalysis;
  @HiveField(26)
  final List<FraudAnalysis>? fraudAnalysis;

  Account({
    this.customerInfo,
    this.location,
    this.openingDate,
    this.currentBalance,
    this.pending,
    this.balanceDateTime,
    this.currentOdLimit,
    this.drawingLimit,
    this.currency,
    this.exchgeRate,
    this.accountStatus,
    this.facility,
    this.accountIfscCode,
    this.micrCode,
    this.accountNumber,
    this.accountType,
    this.accountDescription,
    this.transactionStartDate,
    this.transactionEndDate,
    this.transactions,
    this.tamperDetectionDetails,
    this.ifscCode,
    //this.analysisData,
    this.rawData,
    this.dailyOpenCloseBalances,
    // this.recurrentCr,
    // this.recurrentDr,
    this.loanAnalysis,
    this.fraudAnalysis,
  });

  Account copyWith({
    CustomerInfo? customerInfo,
    String? location,
    DateTime? openingDate,
    String? currentBalance,
    Pending? pending,
    DateTime? balanceDateTime,
    String? currentOdLimit,
    String? drawingLimit,
    String? currency,
    String? exchgeRate,
    String? accountStatus,
    String? facility,
    String? accountIfscCode,
    String? micrCode,
    String? accountNumber,
    String? accountType,
    String? accountDescription,
    DateTime? transactionStartDate,
    DateTime? transactionEndDate,
    List<AccountTransaction>? transactions,
    List<dynamic>? tamperDetectionDetails,
    String? ifscCode,
   // AnalysisData? analysisData,
    List<RawDatum>? rawData,
    List<DailyOpenCloseBalance>? dailyOpenCloseBalances,
    //RecurrentCr? recurrentCr,
    //RecurrentDr? recurrentDr,
    List<LoanAnalysis>? loanAnalysis,
    List<FraudAnalysis>? fraudAnalysis,
  }) =>
      Account(
        customerInfo: customerInfo ?? this.customerInfo,
        location: location ?? this.location,
        openingDate: openingDate ?? this.openingDate,
        currentBalance: currentBalance ?? this.currentBalance,
        pending: pending ?? this.pending,
        balanceDateTime: balanceDateTime ?? this.balanceDateTime,
        currentOdLimit: currentOdLimit ?? this.currentOdLimit,
        drawingLimit: drawingLimit ?? this.drawingLimit,
        currency: currency ?? this.currency,
        exchgeRate: exchgeRate ?? this.exchgeRate,
        accountStatus: accountStatus ?? this.accountStatus,
        facility: facility ?? this.facility,
        accountIfscCode: accountIfscCode ?? this.accountIfscCode,
        micrCode: micrCode ?? this.micrCode,
        accountNumber: accountNumber ?? this.accountNumber,
        accountType: accountType ?? this.accountType,
        accountDescription: accountDescription ?? this.accountDescription,
        transactionStartDate: transactionStartDate ?? this.transactionStartDate,
        transactionEndDate: transactionEndDate ?? this.transactionEndDate,
        transactions: transactions ?? this.transactions,
        tamperDetectionDetails: tamperDetectionDetails ?? this.tamperDetectionDetails,
        ifscCode: ifscCode ?? this.ifscCode,
       // analysisData: analysisData ?? this.analysisData,
        rawData: rawData ?? this.rawData,
        dailyOpenCloseBalances: dailyOpenCloseBalances ?? this.dailyOpenCloseBalances,
       // recurrentCr: recurrentCr ?? this.recurrentCr,
      //  recurrentDr: recurrentDr ?? this.recurrentDr,
        loanAnalysis: loanAnalysis ?? this.loanAnalysis,
        fraudAnalysis: fraudAnalysis ?? this.fraudAnalysis,
      );

  factory Account.fromJson(String str) => Account.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Account.fromMap(Map<String, dynamic> json) => Account(
    customerInfo: json["customer_info"] == null ? null : CustomerInfo.fromMap(json["customer_info"]),
    location: json["location"],
    openingDate: json["opening_date"] == null ? null : DateTime.parse(json["opening_date"]),
    currentBalance: json["current_balance"],
    pending: json["pending"] == null ? null : Pending.fromMap(json["pending"]),
    balanceDateTime: json["balance_date_time"] == null ? null : DateTime.parse(json["balance_date_time"]),
    currentOdLimit: json["current_od_Limit"],
    drawingLimit: json["drawing_limit"],
    currency: json["currency"],
    exchgeRate: json["exchge_rate"],
    accountStatus: json["account_status"],
    facility: json["facility"],
    accountIfscCode: json["ifsc_code"],
    micrCode: json["micr_code"],
    accountNumber: json["account_number"],
    accountType: json["account_type"],
    accountDescription: json["account_description"],
    transactionStartDate: json["transaction_start_date"] == null ? null : DateTime.parse(json["transaction_start_date"]),
    transactionEndDate: json["transaction_end_date"] == null ? null : DateTime.parse(json["transaction_end_date"]),
    transactions: json["transactions"] == null ? [] : List<AccountTransaction>.from(json["transactions"]!.map((x) => AccountTransaction.fromMap(x))),
    tamperDetectionDetails: json["tamper_detection_details"] == null ? [] : List<dynamic>.from(json["tamper_detection_details"]!.map((x) => x)),
    ifscCode: json["ifscCode"],
    //analysisData: json["analysis_data"] == null ? null : AnalysisData.fromMap(json["analysis_data"]),
    rawData: json["raw_data"] == null ? [] : List<RawDatum>.from(json["raw_data"]!.map((x) => RawDatum.fromMap(x))),
    dailyOpenCloseBalances: json["daily_open_close_balances"] == null ? [] : List<DailyOpenCloseBalance>.from(json["daily_open_close_balances"]!.map((x) => DailyOpenCloseBalance.fromMap(x))),
   // recurrentCr: json["recurrent_cr"] == null ? null : RecurrentCr.fromMap(json["recurrent_cr"]),
   // recurrentDr: json["recurrent_dr"] == null ? null : RecurrentDr.fromMap(json["recurrent_dr"]),
    loanAnalysis: json["loan_analysis"] == null ? [] : List<LoanAnalysis>.from(json["loan_analysis"]!.map((x) => LoanAnalysis.fromMap(x))),
    fraudAnalysis: json["fraud_analysis"] == null ? [] : List<FraudAnalysis>.from(json["fraud_analysis"]!.map((x) => FraudAnalysis.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "customer_info": customerInfo?.toMap(),
    "location": location,
    "opening_date": "${openingDate!.year.toString().padLeft(4, '0')}-${openingDate!.month.toString().padLeft(2, '0')}-${openingDate!.day.toString().padLeft(2, '0')}",
    "current_balance": currentBalance,
    "pending": pending?.toMap(),
    "balance_date_time": balanceDateTime?.toIso8601String(),
    "current_od_Limit": currentOdLimit,
    "drawing_limit": drawingLimit,
    "currency": currency,
    "exchge_rate": exchgeRate,
    "account_status": accountStatus,
    "facility": facility,
    "ifsc_code": accountIfscCode,
    "micr_code": micrCode,
    "account_number": accountNumber,
    "account_type": accountType,
    "account_description": accountDescription,
    "transaction_start_date": "${transactionStartDate!.year.toString().padLeft(4, '0')}-${transactionStartDate!.month.toString().padLeft(2, '0')}-${transactionStartDate!.day.toString().padLeft(2, '0')}",
    "transaction_end_date": "${transactionEndDate!.year.toString().padLeft(4, '0')}-${transactionEndDate!.month.toString().padLeft(2, '0')}-${transactionEndDate!.day.toString().padLeft(2, '0')}",
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toMap())),
    "tamper_detection_details": tamperDetectionDetails == null ? [] : List<dynamic>.from(tamperDetectionDetails!.map((x) => x)),
    "ifscCode": ifscCode,
    //"analysis_data": analysisData?.toMap(),
    "raw_data": rawData == null ? [] : List<dynamic>.from(rawData!.map((x) => x.toMap())),
    "daily_open_close_balances": dailyOpenCloseBalances == null ? [] : List<dynamic>.from(dailyOpenCloseBalances!.map((x) => x.toMap())),
    //"recurrent_cr": recurrentCr?.toMap(),
    //"recurrent_dr": recurrentDr?.toMap(),
    "loan_analysis": loanAnalysis == null ? [] : List<dynamic>.from(loanAnalysis!.map((x) => x.toMap())),
    "fraud_analysis": fraudAnalysis == null ? [] : List<dynamic>.from(fraudAnalysis!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 5)
class CustomerInfo {
  @HiveField(1)
  final String? holdingType;
  @HiveField(2)
  final List<Holder>? holders;

  CustomerInfo({
    this.holdingType,
    this.holders,
  });

  CustomerInfo copyWith({
    String? holdingType,
    List<Holder>? holders,
  }) =>
      CustomerInfo(
        holdingType: holdingType ?? this.holdingType,
        holders: holders ?? this.holders,
      );

  factory CustomerInfo.fromJson(String str) => CustomerInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CustomerInfo.fromMap(Map<String, dynamic> json) => CustomerInfo(
    holdingType: json["holding_type"],
    holders: json["holders"] == null ? [] : List<Holder>.from(json["holders"]!.map((x) => Holder.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "holding_type": holdingType,
    "holders": holders == null ? [] : List<dynamic>.from(holders!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 6)
class Holder {
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final String? contactNumber;
  @HiveField(4)
  final String? address;
  @HiveField(5)
  final String? pan;
  @HiveField(6)
  final String? ckycCompliance;
  @HiveField(7)
  final DateTime? dob;
  @HiveField(8)
  final String? landline;
  @HiveField(9)
  final String? nominee;

  Holder({
    this.name,
    this.email,
    this.contactNumber,
    this.address,
    this.pan,
    this.ckycCompliance,
    this.dob,
    this.landline,
    this.nominee,
  });

  Holder copyWith({
    String? name,
    String? email,
    String? contactNumber,
    String? address,
    String? pan,
    String? ckycCompliance,
    DateTime? dob,
    String? landline,
    String? nominee,
  }) =>
      Holder(
        name: name ?? this.name,
        email: email ?? this.email,
        contactNumber: contactNumber ?? this.contactNumber,
        address: address ?? this.address,
        pan: pan ?? this.pan,
        ckycCompliance: ckycCompliance ?? this.ckycCompliance,
        dob: dob ?? this.dob,
        landline: landline ?? this.landline,
        nominee: nominee ?? this.nominee,
      );

  factory Holder.fromJson(String str) => Holder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Holder.fromMap(Map<String, dynamic> json) => Holder(
    name: json["name"],
    email: json["email"],
    contactNumber: json["contact_number"],
    address: json["address"],
    pan: json["pan"],
    ckycCompliance: json["ckyc_compliance"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    landline: json["landline"],
    nominee: json["nominee"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "email": email,
    "contact_number": contactNumber,
    "address": address,
    "pan": pan,
    "ckyc_compliance": ckycCompliance,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "landline": landline,
    "nominee": nominee,
  };
}

@HiveType(typeId: 7)
class DailyOpenCloseBalance {
  @HiveField(1)
  final String? month;
  @HiveField(2)
  final List<DailyBalance>? dailyBalance;

  DailyOpenCloseBalance({
    this.month,
    this.dailyBalance,
  });

  DailyOpenCloseBalance copyWith({
    String? month,
    List<DailyBalance>? dailyBalance,
  }) =>
      DailyOpenCloseBalance(
        month: month ?? this.month,
        dailyBalance: dailyBalance ?? this.dailyBalance,
      );

  factory DailyOpenCloseBalance.fromJson(String str) => DailyOpenCloseBalance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyOpenCloseBalance.fromMap(Map<String, dynamic> json) => DailyOpenCloseBalance(
    month: json["month"],
    dailyBalance: json["dailyBalance"] == null ? [] : List<DailyBalance>.from(json["dailyBalance"]!.map((x) => DailyBalance.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "month": month,
    "dailyBalance": dailyBalance == null ? [] : List<dynamic>.from(dailyBalance!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 8)
class DailyBalance {
  @HiveField(1)
  final int? timestamp;
  @HiveField(2)
  final DateTime? transactionDate;
  @HiveField(3)
  final double? openingBalance;
  @HiveField(4)
  final double? closingBalance;

  DailyBalance({
    this.timestamp,
    this.transactionDate,
    this.openingBalance,
    this.closingBalance,
  });

  DailyBalance copyWith({
    int? timestamp,
    DateTime? transactionDate,
    double? openingBalance,
    double? closingBalance,
  }) =>
      DailyBalance(
        timestamp: timestamp ?? this.timestamp,
        transactionDate: transactionDate ?? this.transactionDate,
        openingBalance: openingBalance ?? this.openingBalance,
        closingBalance: closingBalance ?? this.closingBalance,
      );

  factory DailyBalance.fromJson(String str) => DailyBalance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyBalance.fromMap(Map<String, dynamic> json) => DailyBalance(
    timestamp: json["timestamp"],
    transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
    openingBalance: json["opening_balance"]?.toDouble(),
    closingBalance: json["closing_balance"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "timestamp": timestamp,
    "transaction_date": "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
    "opening_balance": openingBalance,
    "closing_balance": closingBalance,
  };
}

@HiveType(typeId: 9)
class FraudAnalysis {
  @HiveField(1)
  final String? type;
  @HiveField(2)
  final String? dgBdtinCode;
  @HiveField(3)
  final String? result;
  @HiveField(4)
  final List<FraudAnalysisTransaction>? transactions;

  FraudAnalysis({
    this.type,
    this.dgBdtinCode,
    this.result,
    this.transactions,
  });

  FraudAnalysis copyWith({
    String? type,
    String? dgBdtinCode,
    String? result,
    List<FraudAnalysisTransaction>? transactions,
  }) =>
      FraudAnalysis(
        type: type ?? this.type,
        dgBdtinCode: dgBdtinCode ?? this.dgBdtinCode,
        result: result ?? this.result,
        transactions: transactions ?? this.transactions,
      );

  factory FraudAnalysis.fromJson(String str) => FraudAnalysis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FraudAnalysis.fromMap(Map<String, dynamic> json) => FraudAnalysis(
    type: json["type"],
    dgBdtinCode: json["dg_bdtin_code"],
    result: json["result"],
    transactions: json["transactions"] == null ? [] : List<FraudAnalysisTransaction>.from(json["transactions"]!.map((x) => FraudAnalysisTransaction.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "type": type,
    "dg_bdtin_code": dgBdtinCode,
    "result": result,
    "transactions": transactions == null ? [] : List<dynamic>.from(transactions!.map((x) => x.toMap())),
  };
}

@HiveType(typeId: 10)
class FraudAnalysisTransaction {
  @HiveField(1)
  final double? amount;
  @HiveField(2)
  final double? balance;
  @HiveField(3)
  final String? chequeNum;
  @HiveField(4)
  final DateTime? transactionDate;
  @HiveField(5)
  final String? narration;
  @HiveField(6)
  final String? category;
  @HiveField(7)
  final int? groupNo;

  FraudAnalysisTransaction({
    this.amount,
    this.balance,
    this.chequeNum,
    this.transactionDate,
    this.narration,
    this.category,
    this.groupNo,
  });

  FraudAnalysisTransaction copyWith({
    double? amount,
    double? balance,
    String? chequeNum,
    DateTime? transactionDate,
    String? narration,
    String? category,
    int? groupNo,
  }) =>
      FraudAnalysisTransaction(
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        chequeNum: chequeNum ?? this.chequeNum,
        transactionDate: transactionDate ?? this.transactionDate,
        narration: narration ?? this.narration,
        category: category ?? this.category,
        groupNo: groupNo ?? this.groupNo,
      );

  factory FraudAnalysisTransaction.fromJson(String str) => FraudAnalysisTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FraudAnalysisTransaction.fromMap(Map<String, dynamic> json) => FraudAnalysisTransaction(
    amount: json["amount"]?.toDouble(),
    balance: json["balance"]?.toDouble(),
    chequeNum: json["cheque_num"],
    transactionDate: json["transaction_date"] == null ? null : DateTime.parse(json["transaction_date"]),
    narration: json["narration"],
    category: json["category"],
    groupNo: json["group_no"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "balance": balance,
    "cheque_num": chequeNum,
    "transaction_date": "${transactionDate!.year.toString().padLeft(4, '0')}-${transactionDate!.month.toString().padLeft(2, '0')}-${transactionDate!.day.toString().padLeft(2, '0')}",
    "narration": narration,
    "category": category,
    "group_no": groupNo,
  };
}

@HiveType(typeId: 11)
class LoanAnalysis {
  @HiveField(1)
  final double? amount;
  @HiveField(2)
  final String? balance;
  @HiveField(3)
  final DateTime? date;
  @HiveField(4)
  final String? narration;
  @HiveField(5)
  final String? category;

  LoanAnalysis({
    this.amount,
    this.balance,
    this.date,
    this.narration,
    this.category,
  });

  LoanAnalysis copyWith({
    double? amount,
    String? balance,
    DateTime? date,
    String? narration,
    String? category,
  }) =>
      LoanAnalysis(
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        date: date ?? this.date,
        narration: narration ?? this.narration,
        category: category ?? this.category,
      );

  factory LoanAnalysis.fromJson(String str) => LoanAnalysis.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoanAnalysis.fromMap(Map<String, dynamic> json) => LoanAnalysis(
    amount: json["amount"]?.toDouble(),
    balance: json["balance"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    narration: json["narration"],
    category: json["category"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "balance": balance,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "narration": narration,
    "category": category,
  };
}

@HiveType(typeId: 12)
class Pending {
  @HiveField(1)
  final String? amount;
  @HiveField(2)
  final String? transactionType;

  Pending({
    this.amount,
    this.transactionType,
  });

  Pending copyWith({
    String? amount,
    String? transactionType,
  }) =>
      Pending(
        amount: amount ?? this.amount,
        transactionType: transactionType ?? this.transactionType,
      );

  factory Pending.fromJson(String str) => Pending.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pending.fromMap(Map<String, dynamic> json) => Pending(
    amount: json["amount"],
    transactionType: json["transaction_type"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "transaction_type": transactionType,
  };
}

@HiveType(typeId: 13)
class RawDatum {
  @HiveField(1)
  final int? sn;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? category;
  @HiveField(5)
  final dynamic debit;
  @HiveField(6)
  final dynamic credit;
  @HiveField(7)
  final double? balance;

  RawDatum({
    this.sn,
    this.date,
    this.description,
    this.category,
    this.debit,
    this.credit,
    this.balance,
  });

  RawDatum copyWith({
    int? sn,
    String? date,
    String? description,
    String? category,
    dynamic debit,
    dynamic credit,
    double? balance,
  }) =>
      RawDatum(
        sn: sn ?? this.sn,
        date: date ?? this.date,
        description: description ?? this.description,
        category: category ?? this.category,
        debit: debit ?? this.debit,
        credit: credit ?? this.credit,
        balance: balance ?? this.balance,
      );

  factory RawDatum.fromJson(String str) => RawDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RawDatum.fromMap(Map<String, dynamic> json) => RawDatum(
    sn: json["SN"],
    date: json["Date"],
    description: json["Description"],
    category: json["Category"],
    debit: json["Debit"],
    credit: json["Credit"],
    balance: json["Balance"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "SN": sn,
    "Date": date,
    "Description": description,
    "Category": category,
    "Debit": debit,
    "Credit": credit,
    "Balance": balance,
  };
}

@HiveType(typeId: 14)
class RecurrentCrRecurrentTransaction {
  @HiveField(1)
  final DateTime? date;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  final double? amount;

  RecurrentCrRecurrentTransaction({
    this.date,
    this.description,
    this.category,
    this.amount,
  });

  RecurrentCrRecurrentTransaction copyWith({
    DateTime? date,
    String? description,
    String? category,
    double? amount,
  }) =>
      RecurrentCrRecurrentTransaction(
        date: date ?? this.date,
        description: description ?? this.description,
        category: category ?? this.category,
        amount: amount ?? this.amount,
      );

  factory RecurrentCrRecurrentTransaction.fromJson(String str) => RecurrentCrRecurrentTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecurrentCrRecurrentTransaction.fromMap(Map<String, dynamic> json) => RecurrentCrRecurrentTransaction(
    date: json["Date"] == null ? null : DateTime.parse(json["Date"]),
    description: json["Description"],
    category: json["Category"],
    amount: json["Amount"]?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "Date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "Description": description,
    "Category": category,
    "Amount": amount,
  };
}


@HiveType(typeId: 15)
class AccountTransaction {
  @HiveField(1)
  final dynamic amount;
  @HiveField(2)
  final String? balance;
  @HiveField(3)
  final String? chequeNum;
  @HiveField(4)
  final DateTime? date;
  @HiveField(5)
  final String? modeFromSource;
  @HiveField(6)
  final String? narration;
  @HiveField(7)
  final String? reference;
  @HiveField(8)
  final String? transactionId;
  @HiveField(9)
  final DateTime? transactionTimestamp;
  @HiveField(10)
  final String? category;
  @HiveField(11)
  final String? subCategory;

  AccountTransaction({
    this.amount,
    this.balance,
    this.chequeNum,
    this.date,
    this.modeFromSource,
    this.narration,
    this.reference,
    this.transactionId,
    this.transactionTimestamp,
    this.category,
    this.subCategory,
  });

  AccountTransaction copyWith({
    dynamic amount,
    String? balance,
    String? chequeNum,
    DateTime? date,
    String? modeFromSource,
    String? narration,
    String? reference,
    String? transactionId,
    DateTime? transactionTimestamp,
    String? category,
    String? subCategory,
  }) =>
      AccountTransaction(
        amount: amount ?? this.amount,
        balance: balance ?? this.balance,
        chequeNum: chequeNum ?? this.chequeNum,
        date: date ?? this.date,
        modeFromSource: modeFromSource ?? this.modeFromSource,
        narration: narration ?? this.narration,
        reference: reference ?? this.reference,
        transactionId: transactionId ?? this.transactionId,
        transactionTimestamp: transactionTimestamp ?? this.transactionTimestamp,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
      );

  factory AccountTransaction.fromJson(String str) => AccountTransaction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccountTransaction.fromMap(Map<String, dynamic> json) => AccountTransaction(
    amount: json["amount"]?.toDouble(),
    balance: json["balance"],
    chequeNum: json["cheque_num"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    modeFromSource: json["mode_from_source"],
    narration: json["narration"],
    reference: json["reference"],
    transactionId: json["transaction_id"],
    transactionTimestamp: json["transaction_timestamp"] == null ? null : DateTime.parse(json["transaction_timestamp"]),
    category: json["category"],
    subCategory: json["sub_category"],
  );

  Map<String, dynamic> toMap() => {
    "amount": amount,
    "balance": balance,
    "cheque_num": chequeNum,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "mode_from_source": modeFromSource,
    "narration": narration,
    "reference": reference,
    "transaction_id": transactionId,
    "transaction_timestamp": transactionTimestamp?.toIso8601String(),
    "category": category,
    "sub_category": subCategory,
  };
}

@HiveType(typeId: 16)
class LevelSummaryVar {
  @HiveField(1)
  final double? averageEodBalance;
  @HiveField(2)
  final int? loanDisbursal;
  @HiveField(3)
  final double? maxBalance;
  @HiveField(4)
  final double? maxEodBalance;
  @HiveField(5)
  final int? medianEodBalance;
  @HiveField(6)
  final double? minBalance;
  @HiveField(7)
  final double? minEodBalance;
  @HiveField(8)
  final int? noOfEmiLoanPayments;
  @HiveField(9)
  final int? sumOfIWBounced;
  @HiveField(10)
  final int? totalAmountOfCashDeposits;
  @HiveField(11)
  final double? totalAmountOfCashWithdrawals;
  @HiveField(12)
  final double? totalAmountOfCreditTransactions;
  @HiveField(13)
  final double? totalAmountOfDebitTransactions;
  @HiveField(14)
  final double? totalAmountOfEmiLoanPayments;
  @HiveField(15)
  final int? totalNoOfCashDeposits;
  @HiveField(16)
  final int? totalNoOfCashWithdrawals;
  @HiveField(17)
  final int? totalNoOfCreditTransactions;
  @HiveField(18)
  final int? totalNoOfDebitTransactions;
  @HiveField(19)
  final int? totalNoOfIWBounced;
  @HiveField(20)
  final int? totalNoOfIWChqBounced;
  @HiveField(21)
  final int? levelSummaryVarTotalNoOfIWBounced;
  @HiveField(22)
  final int? totalNumberOfOutwardChequeBounces;
  @HiveField(23)
  final int? chqDeposits;
  @HiveField(24)
  final int? chqIssues;
  @HiveField(25)
  final int? inwChqBounceNonTechnical;
  @HiveField(26)
  final int? levelSummaryVarLoanDisbursal;
  @HiveField(27)
  final int? totalChqDeposits;
  @HiveField(28)
  final int? totalChqIssues;
  @HiveField(29)
  final double? totalLoanDisbursal;
  @HiveField(30)
  final int? totalInwChqBounceNonTechnical;

  LevelSummaryVar({
    this.averageEodBalance,
    this.loanDisbursal,
    this.maxBalance,
    this.maxEodBalance,
    this.medianEodBalance,
    this.minBalance,
    this.minEodBalance,
    this.noOfEmiLoanPayments,
    this.sumOfIWBounced,
    this.totalAmountOfCashDeposits,
    this.totalAmountOfCashWithdrawals,
    this.totalAmountOfCreditTransactions,
    this.totalAmountOfDebitTransactions,
    this.totalAmountOfEmiLoanPayments,
    this.totalNoOfCashDeposits,
    this.totalNoOfCashWithdrawals,
    this.totalNoOfCreditTransactions,
    this.totalNoOfDebitTransactions,
    this.totalNoOfIWBounced,
    this.totalNoOfIWChqBounced,
    this.levelSummaryVarTotalNoOfIWBounced,
    this.totalNumberOfOutwardChequeBounces,
    this.chqDeposits,
    this.chqIssues,
    this.inwChqBounceNonTechnical,
    this.levelSummaryVarLoanDisbursal,
    this.totalChqDeposits,
    this.totalChqIssues,
    this.totalLoanDisbursal,
    this.totalInwChqBounceNonTechnical,
  });

  LevelSummaryVar copyWith({
    double? averageEodBalance,
    int? loanDisbursal,
    double? maxBalance,
    double? maxEodBalance,
    int? medianEodBalance,
    double? minBalance,
    double? minEodBalance,
    int? noOfEmiLoanPayments,
    int? sumOfIWBounced,
    int? totalAmountOfCashDeposits,
    double? totalAmountOfCashWithdrawals,
    double? totalAmountOfCreditTransactions,
    double? totalAmountOfDebitTransactions,
    double? totalAmountOfEmiLoanPayments,
    int? totalNoOfCashDeposits,
    int? totalNoOfCashWithdrawals,
    int? totalNoOfCreditTransactions,
    int? totalNoOfDebitTransactions,
    int? totalNoOfIWBounced,
    int? totalNoOfIWChqBounced,
    int? levelSummaryVarTotalNoOfIWBounced,
    int? totalNumberOfOutwardChequeBounces,
    int? chqDeposits,
    int? chqIssues,
    int? inwChqBounceNonTechnical,
    int? levelSummaryVarLoanDisbursal,
    int? totalChqDeposits,
    int? totalChqIssues,
    double? totalLoanDisbursal,
    int? totalInwChqBounceNonTechnical,
  }) =>
      LevelSummaryVar(
        averageEodBalance: averageEodBalance ?? this.averageEodBalance,
        loanDisbursal: loanDisbursal ?? this.loanDisbursal,
        maxBalance: maxBalance ?? this.maxBalance,
        maxEodBalance: maxEodBalance ?? this.maxEodBalance,
        medianEodBalance: medianEodBalance ?? this.medianEodBalance,
        minBalance: minBalance ?? this.minBalance,
        minEodBalance: minEodBalance ?? this.minEodBalance,
        noOfEmiLoanPayments: noOfEmiLoanPayments ?? this.noOfEmiLoanPayments,
        sumOfIWBounced: sumOfIWBounced ?? this.sumOfIWBounced,
        totalAmountOfCashDeposits: totalAmountOfCashDeposits ?? this.totalAmountOfCashDeposits,
        totalAmountOfCashWithdrawals: totalAmountOfCashWithdrawals ?? this.totalAmountOfCashWithdrawals,
        totalAmountOfCreditTransactions: totalAmountOfCreditTransactions ?? this.totalAmountOfCreditTransactions,
        totalAmountOfDebitTransactions: totalAmountOfDebitTransactions ?? this.totalAmountOfDebitTransactions,
        totalAmountOfEmiLoanPayments: totalAmountOfEmiLoanPayments ?? this.totalAmountOfEmiLoanPayments,
        totalNoOfCashDeposits: totalNoOfCashDeposits ?? this.totalNoOfCashDeposits,
        totalNoOfCashWithdrawals: totalNoOfCashWithdrawals ?? this.totalNoOfCashWithdrawals,
        totalNoOfCreditTransactions: totalNoOfCreditTransactions ?? this.totalNoOfCreditTransactions,
        totalNoOfDebitTransactions: totalNoOfDebitTransactions ?? this.totalNoOfDebitTransactions,
        totalNoOfIWBounced: totalNoOfIWBounced ?? this.totalNoOfIWBounced,
        totalNoOfIWChqBounced: totalNoOfIWChqBounced ?? this.totalNoOfIWChqBounced,
        levelSummaryVarTotalNoOfIWBounced: levelSummaryVarTotalNoOfIWBounced ?? this.levelSummaryVarTotalNoOfIWBounced,
        totalNumberOfOutwardChequeBounces: totalNumberOfOutwardChequeBounces ?? this.totalNumberOfOutwardChequeBounces,
        chqDeposits: chqDeposits ?? this.chqDeposits,
        chqIssues: chqIssues ?? this.chqIssues,
        inwChqBounceNonTechnical: inwChqBounceNonTechnical ?? this.inwChqBounceNonTechnical,
        levelSummaryVarLoanDisbursal: levelSummaryVarLoanDisbursal ?? this.levelSummaryVarLoanDisbursal,
        totalChqDeposits: totalChqDeposits ?? this.totalChqDeposits,
        totalChqIssues: totalChqIssues ?? this.totalChqIssues,
        totalLoanDisbursal: totalLoanDisbursal ?? this.totalLoanDisbursal,
        totalInwChqBounceNonTechnical: totalInwChqBounceNonTechnical ?? this.totalInwChqBounceNonTechnical,
      );

  factory LevelSummaryVar.fromJson(String str) => LevelSummaryVar.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LevelSummaryVar.fromMap(Map<String, dynamic> json) => LevelSummaryVar(
    averageEodBalance: json["Average EOD Balance"]?.toDouble(),
    loanDisbursal: json["LoanDisbursal"],
    maxBalance: json["Max Balance"]?.toDouble(),
    maxEodBalance: json["Max EOD Balance"]?.toDouble(),
    medianEodBalance: json["Median EOD Balance"],
    minBalance: json["Min Balance"]?.toDouble(),
    minEodBalance: json["Min EOD Balance"]?.toDouble(),
    noOfEmiLoanPayments: json["No. of EMI / loan payments"],
    sumOfIWBounced: json["Sum of I/W Bounced"],
    totalAmountOfCashDeposits: json["Total Amount of Cash Deposits"],
    totalAmountOfCashWithdrawals: json["Total Amount of Cash Withdrawals"]?.toDouble(),
    totalAmountOfCreditTransactions: json["Total Amount of Credit Transactions"]?.toDouble(),
    totalAmountOfDebitTransactions: json["Total Amount of Debit Transactions"]?.toDouble(),
    totalAmountOfEmiLoanPayments: json["Total Amount of EMI / loan Payments"]?.toDouble(),
    totalNoOfCashDeposits: json["Total No. of Cash Deposits"],
    totalNoOfCashWithdrawals: json["Total No. of Cash Withdrawals"],
    totalNoOfCreditTransactions: json["Total No. of Credit Transactions"],
    totalNoOfDebitTransactions: json["Total No. of Debit Transactions"],
    totalNoOfIWBounced: json["Total No. of I/W Bounced"],
    totalNoOfIWChqBounced: json["Total No. of I/W Chq Bounced"],
    levelSummaryVarTotalNoOfIWBounced: json["Total No.of I / W Bounced"],
    totalNumberOfOutwardChequeBounces: json["Total Number of Outward Cheque Bounces"],
    chqDeposits: json["chqDeposits"],
    chqIssues: json["chqIssues"],
    inwChqBounceNonTechnical: json["inw_chq_bounce_nonTechnical"],
    levelSummaryVarLoanDisbursal: json["loanDisbursal"],
    totalChqDeposits: json["totalChqDeposits"],
    totalChqIssues: json["totalChqIssues"],
    totalLoanDisbursal: json["totalLoanDisbursal"]?.toDouble(),
    totalInwChqBounceNonTechnical: json["total_inw_chq_bounce_nonTechnical"],
  );

  Map<String, dynamic> toMap() => {
    "Average EOD Balance": averageEodBalance,
    "LoanDisbursal": loanDisbursal,
    "Max Balance": maxBalance,
    "Max EOD Balance": maxEodBalance,
    "Median EOD Balance": medianEodBalance,
    "Min Balance": minBalance,
    "Min EOD Balance": minEodBalance,
    "No. of EMI / loan payments": noOfEmiLoanPayments,
    "Sum of I/W Bounced": sumOfIWBounced,
    "Total Amount of Cash Deposits": totalAmountOfCashDeposits,
    "Total Amount of Cash Withdrawals": totalAmountOfCashWithdrawals,
    "Total Amount of Credit Transactions": totalAmountOfCreditTransactions,
    "Total Amount of Debit Transactions": totalAmountOfDebitTransactions,
    "Total Amount of EMI / loan Payments": totalAmountOfEmiLoanPayments,
    "Total No. of Cash Deposits": totalNoOfCashDeposits,
    "Total No. of Cash Withdrawals": totalNoOfCashWithdrawals,
    "Total No. of Credit Transactions": totalNoOfCreditTransactions,
    "Total No. of Debit Transactions": totalNoOfDebitTransactions,
    "Total No. of I/W Bounced": totalNoOfIWBounced,
    "Total No. of I/W Chq Bounced": totalNoOfIWChqBounced,
    "Total No.of I / W Bounced": levelSummaryVarTotalNoOfIWBounced,
    "Total Number of Outward Cheque Bounces": totalNumberOfOutwardChequeBounces,
    "chqDeposits": chqDeposits,
    "chqIssues": chqIssues,
    "inw_chq_bounce_nonTechnical": inwChqBounceNonTechnical,
    "loanDisbursal": levelSummaryVarLoanDisbursal,
    "totalChqDeposits": totalChqDeposits,
    "totalChqIssues": totalChqIssues,
    "totalLoanDisbursal": totalLoanDisbursal,
    "total_inw_chq_bounce_nonTechnical": totalInwChqBounceNonTechnical,
  };
}
