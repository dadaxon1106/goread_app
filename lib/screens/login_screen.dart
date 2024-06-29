import 'package:flutter/material.dart';
import 'package:goread/services/hive_service.dart';
import 'package:goread/services/log_service.dart';
import 'package:goread/utils/colors.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<String> hintTexts = ["UserName", "Email", "PhoneNumber", "Password"];

  @override
  void initState() {
    super.initState();
    HiveService.setUser("Dadaxon");
    String name = HiveService.getName();
    LogService.i(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: MediaQuery.of(context).size.width,
                  height: 30,
                ),
                const SizedBox(height: 34),
                Column(
                  children: List.generate(
                    hintTexts.length,
                    (index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 20, top: 30),
                          child: TextField(
                            controller: controllers[index],
                            decoration: InputDecoration(
                                hintText: hintTexts[index],
                                hintStyle: const TextStyle(color: Colors.grey)),
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 18),

               ElevatedButton(onPressed: (){}, child: const Text("Sign Up",style: TextStyle(color: ColorsOwn.subColor,fontSize: 20),))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
