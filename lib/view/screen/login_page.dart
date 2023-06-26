import 'package:auto_binding_field/auto_binding_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_mod/provider/login_provider.dart';
import 'package:movies_mod/view/widget/sized_box.dar.dart';
import 'package:provider/provider.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      child: Consumer<LoginPageProvider>(builder: (context, data, _) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Image/movies_mod.png'),
                      fit:BoxFit.fill
                    )
                  ),
                  // color: context.theme.colorScheme.onPrimary,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textTheme.headlineMedium,
                      ),
                      const Height(25),
                      AutoBindingTextField(
                        value: '',
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                            hintText: "E-mail address",
                            hintStyle: context.textTheme.bodyLarge),
                        onChanged: (val) {},
                      ),
                      const Height(15),
                      AutoBindingTextField(
                        value: '',
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: context.textTheme.bodyLarge,
                            contentPadding: const EdgeInsets.only(left: 15),
                            suffixIcon: const Icon(CupertinoIcons.eye_slash),
                            suffixIconColor: context.theme.colorScheme.outline),
                        onChanged: (val) {},
                      ),
                      const Height(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: data.remember,
                                  onChanged: (val) {
                                    data.onRemember();
                                  }),
                              Text(
                                'Remember me',
                                style: context.textTheme.bodyLarge,
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget password?',
                                style: context.textTheme.bodyLarge,
                              ))
                        ],
                      ),
                      const Height(15),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {}, child: const Text('Login in'))),
                        ],
                      ),
                      const Height(15),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.s,
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.theme.colorScheme.outline,
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                          const Width(15),
                          Text(
                            'OR',
                            style: context.textTheme.bodyLarge,
                          ),
                          const Width(15),
                          Expanded(
                            child: Divider(
                              color: context.theme.colorScheme.outline,
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      const Height(15),
                      InkWell(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: context.theme.colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/Icon/google_icon.png',
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                              const Width(10),
                              Text(
                                'Log in with Google',
                                style: context.textTheme.displaySmall,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Height(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: context.textTheme.bodyLarge,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: context.theme.colorScheme.secondary),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
