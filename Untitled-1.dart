import 'dart:convert';

import 'package:codepie/provider/internet_provider.dart';
import 'package:codepie/provider/sign_in_provider.dart';
import 'package:codepie/screens/home_screen.dart';
import 'package:codepie/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:codepie/utils/config.dart';
import 'package:codepie/utils/next_screen.dart';
import 'package:codepie/utils/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  Map<String, dynamic>? userData; // Variable to store user data

  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneController1 = TextEditingController();
  TextEditingController OnlyphoneController = TextEditingController();
  final RoundedLoadingButtonController OtpController =
  RoundedLoadingButtonController();
  final RoundedLoadingButtonController ConfirmButtonConroller =
  RoundedLoadingButtonController();
  TextEditingController otpCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            nextScreenReplace(context, const Login());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('images/logo.png'),
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Phone Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  controller: phoneController,
                  onChanged: (phone) {
                    phoneController1.text = phone.completeNumber.toString();
                    OnlyphoneController.text = phone.number.toString();
                    print(phone.number);
                  },
                ),
                const SizedBox(height: 10),
                RoundedLoadingButton(
                  onPressed: () {
                    checkUserExists(OnlyphoneController.text);
                  },
                  controller: OtpController,
                  child: const Text("Get Otp"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkUserExists(String phoneNumber) async {
    final phoneNumber = phoneController.text;
    if (phoneNumber.isEmpty) {

      openSnackbar(context, "Phone number cannot be empty", Colors.red);
      OtpController.reset();
    } else {
      final apiUrl =
          'http://192.168.0.177/api-master/public/api/users/phone/$phoneNumber';

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        setState(() {
          userData = responseData['user'];
        });
        print(responseData['user'].toString());

        if (responseData.containsKey('user') &&
            responseData['user'].containsKey('phone')) {
          openSnackbar(context, "User exist", Colors.red);
          // User exists, execute login block
          login(context, phoneController1.text);
        } else {
          OtpController.reset();
          ConfirmButtonConroller.reset();
          // User does not exist, show error message
          openSnackbar(context, "User does not exist", Colors.red);
        }
      } else {
        OtpController.reset();
        ConfirmButtonConroller.reset();
        openSnackbar(
            context, "Failed to retrieve user information", Colors.red);
        print('Failed to retrieve user information');
      }
    }
  }

  Future<void> login(BuildContext context, String mobile) async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your internet connection", Colors.red);
    } else {
      if (formKey.currentState!.validate()) {
        FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: mobile,
          verificationCompleted: (AuthCredential credential) async {
            await FirebaseAuth.instance.signInWithCredential(credential);

          },
          verificationFailed: (FirebaseAuthException e) {
            OtpController.reset();
            ConfirmButtonConroller.reset();
            openSnackbar(context, e.toString(), Colors.red);
            print(e.toString());
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Enter Code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: otpCodeController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.code),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RoundedLoadingButton(
                        onPressed: () async {
                          final code = otpCodeController.text.trim();
                          AuthCredential authCredential =
                          PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: code,
                          );
                          User user = (await FirebaseAuth.instance
                              .signInWithCredential(authCredential))
                              .user!;
                          // save the values
                          sp.phoneNumberUser(
                            user,
                            emailController.text,
                            nameController.text,
                          );
                          // checking whether user exists
                          sp.checkUserExists().then((value) async {
                            if (value == true) {
                              // Store the responseData in SharedPreferences
                              await storeUserDataInSharedPreferences();
                              // user exists
                              await sp
                                  .getUserDataFromFirestore(sp.uid)
                                  .then((value) => sp
                                  .saveDataToSharedPreferences()
                                  .then((value) => sp.setSignIn()));
                            } else {
                              // Store the responseData in SharedPreferences
                              await storeUserDataInSharedPreferences();
                              // user does not exist
                              await sp.saveDataToFirestore().then((value) =>
                                  sp.saveDataToSharedPreferences().then(
                                        (value) => sp.setSignIn()
                                  ));
                            }
                          });
                        },
                        controller: ConfirmButtonConroller,
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          codeAutoRetrievalTimeout: (String verification) {},
        );
      }
    }
  }
  Future<void> storeUserDataInSharedPreferences() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('user_id', userData!['id']);
    await preferences.setString('name', userData!['name']);
    await preferences.setString('email', userData!['email']);
    await preferences.setString('phone', userData!['phone']);
    await preferences.setString('token', userData!['token']);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );

  }
}
