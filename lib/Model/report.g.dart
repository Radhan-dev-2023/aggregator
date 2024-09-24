// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportDataHiveModelAdapter extends TypeAdapter<ReportDataHiveModel> {
  @override
  final int typeId = 1;

  @override
  ReportDataHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportDataHiveModel(
      success: fields[1] as bool?,
      reportData: fields[2] as ReportData?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportDataHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.success)
      ..writeByte(2)
      ..write(obj.reportData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDataHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReportDataAdapter extends TypeAdapter<ReportData> {
  @override
  final int typeId = 2;

  @override
  ReportData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportData(
      clientRefNum: fields[1] as String?,
      requestId: fields[2] as int?,
      txnId: fields[3] as String?,
      startDate: fields[4] as DateTime?,
      endDate: fields[5] as DateTime?,
      durationInMonth: fields[6] as int?,
      dgReportVersion: fields[7] as String?,
      reportNum: fields[8] as int?,
      reportFetchTime: fields[9] as DateTime?,
      reportFetchType: fields[10] as String?,
      sourceOfData: fields[11] as String?,
      statementStartDate: fields[12] as DateTime?,
      statementEndDate: fields[13] as DateTime?,
      multipleAccountsFound: fields[14] as String?,
      sourceReport: fields[15] as String?,
      banks: (fields[16] as List?)?.cast<Bank>(),
      requestLevelSummaryVar: fields[17] as LevelSummaryVar?,
    );
  }

  @override
  void write(BinaryWriter writer, ReportData obj) {
    writer
      ..writeByte(17)
      ..writeByte(1)
      ..write(obj.clientRefNum)
      ..writeByte(2)
      ..write(obj.requestId)
      ..writeByte(3)
      ..write(obj.txnId)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.endDate)
      ..writeByte(6)
      ..write(obj.durationInMonth)
      ..writeByte(7)
      ..write(obj.dgReportVersion)
      ..writeByte(8)
      ..write(obj.reportNum)
      ..writeByte(9)
      ..write(obj.reportFetchTime)
      ..writeByte(10)
      ..write(obj.reportFetchType)
      ..writeByte(11)
      ..write(obj.sourceOfData)
      ..writeByte(12)
      ..write(obj.statementStartDate)
      ..writeByte(13)
      ..write(obj.statementEndDate)
      ..writeByte(14)
      ..write(obj.multipleAccountsFound)
      ..writeByte(15)
      ..write(obj.sourceReport)
      ..writeByte(16)
      ..write(obj.banks)
      ..writeByte(17)
      ..write(obj.requestLevelSummaryVar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReportDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BankAdapter extends TypeAdapter<Bank> {
  @override
  final int typeId = 3;

  @override
  Bank read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bank(
      bank: fields[1] as String?,
      digitapInstitutionId: fields[2] as int?,
      sourceBankId: fields[3] as String?,
      multipleAccountsFound: fields[4] as String?,
      accounts: (fields[5] as List?)?.cast<Account>(),
      bankLevelSummaryVar: fields[6] as LevelSummaryVar?,
    );
  }

  @override
  void write(BinaryWriter writer, Bank obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.bank)
      ..writeByte(2)
      ..write(obj.digitapInstitutionId)
      ..writeByte(3)
      ..write(obj.sourceBankId)
      ..writeByte(4)
      ..write(obj.multipleAccountsFound)
      ..writeByte(5)
      ..write(obj.accounts)
      ..writeByte(6)
      ..write(obj.bankLevelSummaryVar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountAdapter extends TypeAdapter<Account> {
  @override
  final int typeId = 4;

  @override
  Account read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Account(
      customerInfo: fields[1] as CustomerInfo?,
      location: fields[2] as String?,
      openingDate: fields[3] as DateTime?,
      currentBalance: fields[4] as String?,
      pending: fields[5] as Pending?,
      balanceDateTime: fields[6] as DateTime?,
      currentOdLimit: fields[7] as String?,
      drawingLimit: fields[8] as String?,
      currency: fields[9] as String?,
      exchgeRate: fields[10] as String?,
      accountStatus: fields[11] as String?,
      facility: fields[12] as String?,
      accountIfscCode: fields[13] as String?,
      micrCode: fields[14] as String?,
      accountNumber: fields[15] as String?,
      accountType: fields[16] as String?,
      accountDescription: fields[17] as String?,
      transactionStartDate: fields[18] as DateTime?,
      transactionEndDate: fields[19] as DateTime?,
      transactions: (fields[20] as List?)?.cast<AccountTransaction>(),
      tamperDetectionDetails: (fields[21] as List?)?.cast<dynamic>(),
      ifscCode: fields[22] as String?,
      rawData: (fields[23] as List?)?.cast<RawDatum>(),
      dailyOpenCloseBalances:
          (fields[24] as List?)?.cast<DailyOpenCloseBalance>(),
      loanAnalysis: (fields[25] as List?)?.cast<LoanAnalysis>(),
      fraudAnalysis: (fields[26] as List?)?.cast<FraudAnalysis>(),
    );
  }

  @override
  void write(BinaryWriter writer, Account obj) {
    writer
      ..writeByte(26)
      ..writeByte(1)
      ..write(obj.customerInfo)
      ..writeByte(2)
      ..write(obj.location)
      ..writeByte(3)
      ..write(obj.openingDate)
      ..writeByte(4)
      ..write(obj.currentBalance)
      ..writeByte(5)
      ..write(obj.pending)
      ..writeByte(6)
      ..write(obj.balanceDateTime)
      ..writeByte(7)
      ..write(obj.currentOdLimit)
      ..writeByte(8)
      ..write(obj.drawingLimit)
      ..writeByte(9)
      ..write(obj.currency)
      ..writeByte(10)
      ..write(obj.exchgeRate)
      ..writeByte(11)
      ..write(obj.accountStatus)
      ..writeByte(12)
      ..write(obj.facility)
      ..writeByte(13)
      ..write(obj.accountIfscCode)
      ..writeByte(14)
      ..write(obj.micrCode)
      ..writeByte(15)
      ..write(obj.accountNumber)
      ..writeByte(16)
      ..write(obj.accountType)
      ..writeByte(17)
      ..write(obj.accountDescription)
      ..writeByte(18)
      ..write(obj.transactionStartDate)
      ..writeByte(19)
      ..write(obj.transactionEndDate)
      ..writeByte(20)
      ..write(obj.transactions)
      ..writeByte(21)
      ..write(obj.tamperDetectionDetails)
      ..writeByte(22)
      ..write(obj.ifscCode)
      ..writeByte(23)
      ..write(obj.rawData)
      ..writeByte(24)
      ..write(obj.dailyOpenCloseBalances)
      ..writeByte(25)
      ..write(obj.loanAnalysis)
      ..writeByte(26)
      ..write(obj.fraudAnalysis);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CustomerInfoAdapter extends TypeAdapter<CustomerInfo> {
  @override
  final int typeId = 5;

  @override
  CustomerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerInfo(
      holdingType: fields[1] as String?,
      holders: (fields[2] as List?)?.cast<Holder>(),
    );
  }

  @override
  void write(BinaryWriter writer, CustomerInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.holdingType)
      ..writeByte(2)
      ..write(obj.holders);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HolderAdapter extends TypeAdapter<Holder> {
  @override
  final int typeId = 6;

  @override
  Holder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Holder(
      name: fields[1] as String?,
      email: fields[2] as String?,
      contactNumber: fields[3] as String?,
      address: fields[4] as String?,
      pan: fields[5] as String?,
      ckycCompliance: fields[6] as String?,
      dob: fields[7] as DateTime?,
      landline: fields[8] as String?,
      nominee: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Holder obj) {
    writer
      ..writeByte(9)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.contactNumber)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.pan)
      ..writeByte(6)
      ..write(obj.ckycCompliance)
      ..writeByte(7)
      ..write(obj.dob)
      ..writeByte(8)
      ..write(obj.landline)
      ..writeByte(9)
      ..write(obj.nominee);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HolderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyOpenCloseBalanceAdapter extends TypeAdapter<DailyOpenCloseBalance> {
  @override
  final int typeId = 7;

  @override
  DailyOpenCloseBalance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyOpenCloseBalance(
      month: fields[1] as String?,
      dailyBalance: (fields[2] as List?)?.cast<DailyBalance>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyOpenCloseBalance obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.month)
      ..writeByte(2)
      ..write(obj.dailyBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyOpenCloseBalanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DailyBalanceAdapter extends TypeAdapter<DailyBalance> {
  @override
  final int typeId = 8;

  @override
  DailyBalance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyBalance(
      timestamp: fields[1] as int?,
      transactionDate: fields[2] as DateTime?,
      openingBalance: fields[3] as double?,
      closingBalance: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, DailyBalance obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.timestamp)
      ..writeByte(2)
      ..write(obj.transactionDate)
      ..writeByte(3)
      ..write(obj.openingBalance)
      ..writeByte(4)
      ..write(obj.closingBalance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyBalanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FraudAnalysisAdapter extends TypeAdapter<FraudAnalysis> {
  @override
  final int typeId = 9;

  @override
  FraudAnalysis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FraudAnalysis(
      type: fields[1] as String?,
      dgBdtinCode: fields[2] as String?,
      result: fields[3] as String?,
      transactions: (fields[4] as List?)?.cast<FraudAnalysisTransaction>(),
    );
  }

  @override
  void write(BinaryWriter writer, FraudAnalysis obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.dgBdtinCode)
      ..writeByte(3)
      ..write(obj.result)
      ..writeByte(4)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FraudAnalysisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FraudAnalysisTransactionAdapter
    extends TypeAdapter<FraudAnalysisTransaction> {
  @override
  final int typeId = 10;

  @override
  FraudAnalysisTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FraudAnalysisTransaction(
      amount: fields[1] as double?,
      balance: fields[2] as double?,
      chequeNum: fields[3] as String?,
      transactionDate: fields[4] as DateTime?,
      narration: fields[5] as String?,
      category: fields[6] as String?,
      groupNo: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, FraudAnalysisTransaction obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.chequeNum)
      ..writeByte(4)
      ..write(obj.transactionDate)
      ..writeByte(5)
      ..write(obj.narration)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.groupNo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FraudAnalysisTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LoanAnalysisAdapter extends TypeAdapter<LoanAnalysis> {
  @override
  final int typeId = 11;

  @override
  LoanAnalysis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoanAnalysis(
      amount: fields[1] as double?,
      balance: fields[2] as String?,
      date: fields[3] as DateTime?,
      narration: fields[4] as String?,
      category: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LoanAnalysis obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.narration)
      ..writeByte(5)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoanAnalysisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PendingAdapter extends TypeAdapter<Pending> {
  @override
  final int typeId = 12;

  @override
  Pending read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pending(
      amount: fields[1] as String?,
      transactionType: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Pending obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.transactionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PendingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RawDatumAdapter extends TypeAdapter<RawDatum> {
  @override
  final int typeId = 13;

  @override
  RawDatum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RawDatum(
      sn: fields[1] as int?,
      date: fields[2] as String?,
      description: fields[3] as String?,
      category: fields[4] as String?,
      debit: fields[5] as dynamic,
      credit: fields[6] as dynamic,
      balance: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RawDatum obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.sn)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.debit)
      ..writeByte(6)
      ..write(obj.credit)
      ..writeByte(7)
      ..write(obj.balance);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RawDatumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecurrentCrRecurrentTransactionAdapter
    extends TypeAdapter<RecurrentCrRecurrentTransaction> {
  @override
  final int typeId = 14;

  @override
  RecurrentCrRecurrentTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurrentCrRecurrentTransaction(
      date: fields[1] as DateTime?,
      description: fields[2] as String?,
      category: fields[3] as String?,
      amount: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, RecurrentCrRecurrentTransaction obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurrentCrRecurrentTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AccountTransactionAdapter extends TypeAdapter<AccountTransaction> {
  @override
  final int typeId = 15;

  @override
  AccountTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccountTransaction(
      amount: fields[1] as dynamic,
      balance: fields[2] as String?,
      chequeNum: fields[3] as String?,
      date: fields[4] as DateTime?,
      modeFromSource: fields[5] as String?,
      narration: fields[6] as String?,
      reference: fields[7] as String?,
      transactionId: fields[8] as String?,
      transactionTimestamp: fields[9] as DateTime?,
      category: fields[10] as String?,
      subCategory: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AccountTransaction obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.balance)
      ..writeByte(3)
      ..write(obj.chequeNum)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.modeFromSource)
      ..writeByte(6)
      ..write(obj.narration)
      ..writeByte(7)
      ..write(obj.reference)
      ..writeByte(8)
      ..write(obj.transactionId)
      ..writeByte(9)
      ..write(obj.transactionTimestamp)
      ..writeByte(10)
      ..write(obj.category)
      ..writeByte(11)
      ..write(obj.subCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LevelSummaryVarAdapter extends TypeAdapter<LevelSummaryVar> {
  @override
  final int typeId = 16;

  @override
  LevelSummaryVar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LevelSummaryVar(
      averageEodBalance: fields[1] as double?,
      loanDisbursal: fields[2] as int?,
      maxBalance: fields[3] as double?,
      maxEodBalance: fields[4] as double?,
      medianEodBalance: fields[5] as int?,
      minBalance: fields[6] as double?,
      minEodBalance: fields[7] as double?,
      noOfEmiLoanPayments: fields[8] as int?,
      sumOfIWBounced: fields[9] as int?,
      totalAmountOfCashDeposits: fields[10] as int?,
      totalAmountOfCashWithdrawals: fields[11] as double?,
      totalAmountOfCreditTransactions: fields[12] as double?,
      totalAmountOfDebitTransactions: fields[13] as double?,
      totalAmountOfEmiLoanPayments: fields[14] as double?,
      totalNoOfCashDeposits: fields[15] as int?,
      totalNoOfCashWithdrawals: fields[16] as int?,
      totalNoOfCreditTransactions: fields[17] as int?,
      totalNoOfDebitTransactions: fields[18] as int?,
      totalNoOfIWBounced: fields[19] as int?,
      totalNoOfIWChqBounced: fields[20] as int?,
      levelSummaryVarTotalNoOfIWBounced: fields[21] as int?,
      totalNumberOfOutwardChequeBounces: fields[22] as int?,
      chqDeposits: fields[23] as int?,
      chqIssues: fields[24] as int?,
      inwChqBounceNonTechnical: fields[25] as int?,
      levelSummaryVarLoanDisbursal: fields[26] as int?,
      totalChqDeposits: fields[27] as int?,
      totalChqIssues: fields[28] as int?,
      totalLoanDisbursal: fields[29] as double?,
      totalInwChqBounceNonTechnical: fields[30] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LevelSummaryVar obj) {
    writer
      ..writeByte(30)
      ..writeByte(1)
      ..write(obj.averageEodBalance)
      ..writeByte(2)
      ..write(obj.loanDisbursal)
      ..writeByte(3)
      ..write(obj.maxBalance)
      ..writeByte(4)
      ..write(obj.maxEodBalance)
      ..writeByte(5)
      ..write(obj.medianEodBalance)
      ..writeByte(6)
      ..write(obj.minBalance)
      ..writeByte(7)
      ..write(obj.minEodBalance)
      ..writeByte(8)
      ..write(obj.noOfEmiLoanPayments)
      ..writeByte(9)
      ..write(obj.sumOfIWBounced)
      ..writeByte(10)
      ..write(obj.totalAmountOfCashDeposits)
      ..writeByte(11)
      ..write(obj.totalAmountOfCashWithdrawals)
      ..writeByte(12)
      ..write(obj.totalAmountOfCreditTransactions)
      ..writeByte(13)
      ..write(obj.totalAmountOfDebitTransactions)
      ..writeByte(14)
      ..write(obj.totalAmountOfEmiLoanPayments)
      ..writeByte(15)
      ..write(obj.totalNoOfCashDeposits)
      ..writeByte(16)
      ..write(obj.totalNoOfCashWithdrawals)
      ..writeByte(17)
      ..write(obj.totalNoOfCreditTransactions)
      ..writeByte(18)
      ..write(obj.totalNoOfDebitTransactions)
      ..writeByte(19)
      ..write(obj.totalNoOfIWBounced)
      ..writeByte(20)
      ..write(obj.totalNoOfIWChqBounced)
      ..writeByte(21)
      ..write(obj.levelSummaryVarTotalNoOfIWBounced)
      ..writeByte(22)
      ..write(obj.totalNumberOfOutwardChequeBounces)
      ..writeByte(23)
      ..write(obj.chqDeposits)
      ..writeByte(24)
      ..write(obj.chqIssues)
      ..writeByte(25)
      ..write(obj.inwChqBounceNonTechnical)
      ..writeByte(26)
      ..write(obj.levelSummaryVarLoanDisbursal)
      ..writeByte(27)
      ..write(obj.totalChqDeposits)
      ..writeByte(28)
      ..write(obj.totalChqIssues)
      ..writeByte(29)
      ..write(obj.totalLoanDisbursal)
      ..writeByte(30)
      ..write(obj.totalInwChqBounceNonTechnical);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LevelSummaryVarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
