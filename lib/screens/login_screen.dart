import 'package:flutter/cupertino.dart';
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
                            obscureText: index == 4 ? false : true,
                            decoration: InputDecoration(
                                hintText: hintTexts[index],
                                hintStyle: const TextStyle(color: Colors.grey),

                            ),
                          ));
                    },
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsOwn.mainColor,
                        fixedSize: const Size(170, 50)),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: ColorsOwn.subColor, fontSize: 20),
                    ),
                  ),
                ),
                 SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: ColorsOwn.blackColor,
                      ),
                    ),
                   const SizedBox(width: 10),
                   const Text("or sign in with",style: TextStyle(color: ColorsOwn.blackColor,fontSize: 16,fontWeight: FontWeight.bold),),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: ColorsOwn.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Row(
                  children: [
                    Expanded(child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)
                      ),
                      child:const Icon(Icons.mail_outline_outlined,size: 40,),
                    ),
                    ),
                   const SizedBox(width: 12),
                    Expanded(child: Container(
                      padding: const EdgeInsets.all(10),

                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Image.asset('assets/icons/google_logo.png'),
                    ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child:Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                      child: const Icon(Icons.facebook,size: 40,),

                    ),),
                    const SizedBox(width: 12),
                    Expanded(child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Image.asset("assets/icons/twitter_logo.png"),

                    ),),
                    const SizedBox(width: 12),
                    Expanded(child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                      child: const Icon(Icons.apple,size: 40,),


                    ),),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
