import 'package:aggregator/Screens/mobile_no_entry.dart';
import 'package:aggregator/Screens/retrieve_report_screen.dart';
import 'package:aggregator/Screens/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'Model/report.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(ReportDataHiveModelAdapter());
  Hive.registerAdapter(ReportDataAdapter());
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(BankAdapter());
  Hive.registerAdapter(CustomerInfoAdapter());
  Hive.registerAdapter(HolderAdapter());
  Hive.registerAdapter(AccountTransactionAdapter());
  // Hive.registerAdapter(DailyOpenCloseBalanceAdapter());
  // Hive.registerAdapter(DailyBalanceAdapter());
  // Hive.registerAdapter(FraudAnalysisAdapter());
  // Hive.registerAdapter(RawDatumAdapter());
  // Hive.registerAdapter(PendingAdapter());
  // Hive.registerAdapter(FraudAnalysisTransactionAdapter());
  // Hive.registerAdapter(LoanAnalysisAdapter());
  // Hive.registerAdapter(LevelSummaryVarAdapter());
  // Hive.registerAdapter(RecurrentCrRecurrentTransactionAdapter());


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          if (provider.isReportLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (provider.phoneNumber?.isEmpty ?? true) {
            return const MobileNumberEntry();
          } else {
            return const RetrieveReportScreen();
          }
        },
      ),
    );
  }
}
