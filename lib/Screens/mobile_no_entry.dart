import 'dart:ui';
import 'package:aggregator/Helpers/spacing.dart';
import 'package:aggregator/helpers/snackBar.dart';
import 'package:aggregator/Screens/provider_class.dart';

import 'package:aggregator/Screens/web_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Helpers/colors.dart';


class MobileNumberEntry extends StatefulWidget {
  const MobileNumberEntry({super.key});

  @override
  State<MobileNumberEntry> createState() => _MobileNumberEntryState();
}

class _MobileNumberEntryState extends State<MobileNumberEntry> {
  final TextEditingController out = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendSms() async {
    final mobileNumberProvider =
    Provider.of<TransactionProvider>(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    final String phoneNumber = out.text;
    final String? url = await mobileNumberProvider.generateUrl(phoneNumber);

    setState(() {
      _isLoading = false;
    });

    if (url != null) {
      showSnackBar('You will need to complete Digitap Verification');

      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WebViewExample(url: url)),
      );
    } else {
      showSnackBar("Failed to Digitap Verification");
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/d.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                color:black.withOpacity(0.1),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromRGBO(53, 120, 170, 1),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: out,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: white,
                                    focusColor: white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:  BorderSide(
                                          color: black, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:  BorderSide(
                                          color: black, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:  BorderSide(
                                          color: black, width: 2.0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    hintText: 'Phone Number',
                                    hintStyle:
                                         TextStyle(color: grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          spacing(context),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(53, 120, 170, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: _isLoading ? null : _sendSms,
                              child: _isLoading
                                  ?  SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  :  Text(
                                      "SEND SMS",
                                      style: TextStyle(
                                          color: white, fontSize: 17),
                                    ),
                            ),
                          ),
                          spacing(context),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromRGBO(53, 120, 170, 1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Edit mobile number",
                                style: TextStyle(
                                  color: Color.fromRGBO(53, 120, 170, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
