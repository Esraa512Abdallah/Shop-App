import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/presentation_layer/screens/register_screen.dart';
import 'package:shop_app/presentation_layer/shared/components.dart';

import '../shared/Components/custom_form_feild.dart';
import '../shared/sized_config.dart';

class LoginScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.screenHeight! * .03,
            right: SizeConfig.screenHeight! * .03,
            bottom: SizeConfig.screenHeight! * .03),
        child: SingleChildScrollView(
          child:
            Column(
              children: [
                Image.asset(
                  "assets/images/login.gif",
                  height: 220,
                  width: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "LOGIN",
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.black),
                      // TextStyle(
                      //     fontSize: 35, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                DefaultTextFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  //validate: (){},
                  // validate: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please enter your email address';
                  //   }
                  // },
                  label: "Email Address",
                  prefix: Icons.email_outlined,
                  onTap: () {},
                  onChange: () {},
                  onSubmit: () {},
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .02,
                ),
                DefaultTextFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  suffix: Icons.visibility,
                  suffixPressed: () {},
                  label: "PassWord",
                  prefix: Icons.lock_outline,
                  onTap: () {},
                  onChange: () {},
                  onSubmit: () {},
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * .05,
                ),
                defaultButton(
                    function: () {}, text: "login", isUpperCase: true),
                SizedBox(
                  height: SizeConfig.screenHeight! * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()));
                      },
                      child: Text(
                        "REGISTER",
                        style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.blue, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ],
            ),

        ),
      ),
    );
  }
}
