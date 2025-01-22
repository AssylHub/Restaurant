import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/screen2_back.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(
                tag: "logo",
                child: SizedBox(
                  width: 250,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              Container(
                width: 350,
                // height: 100,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  // borderRadius: BorderRadius.circular()
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Column(
                        children: [
                          VerificationField(
                            hintText: "Please enter your account",
                            iconPath: "assets/user.png",
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          VerificationField(
                            hintText: "Please enter your password",
                            iconPath: "assets/view.png",
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            splashRadius: 0,
                            value: isChecked,
                            activeColor: Colors.transparent,
                            // overlayColor: Colors.grey,
                            // focusNode: ,
                            checkColor: Colors.grey,
                            shape: CircleBorder(),
                            side: MaterialStateBorderSide.resolveWith((states) {
                              return const BorderSide(
                                  color: Colors.grey, width: 2, strokeAlign: 2);
                            }),
                            // fillColor: MaterialStateProperty.all(Colors.grey),
                            tristate: true,
                            onChanged: (newBool) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text:
                                    "I have read and agreed User privacy policy",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        width: 200,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.yellow.shade700,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            Navigator.pushNamed(context, "/home");
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Forgot your password?",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VerificationField extends StatelessWidget {
  const VerificationField({
    super.key,
    required this.hintText,
    required this.iconPath,
  });

  final String hintText;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
        prefixIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            width: 20,
            child: ImageIcon(
              AssetImage(
                iconPath,
              ),
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
