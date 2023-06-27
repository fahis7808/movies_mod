import 'package:flutter/material.dart';
import 'package:movies_mod/provider/login_provider.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => LoginPageProvider(),
      child: Consumer<LoginPageProvider>(builder: (context, provider, _) {
        return Scaffold(
            body: Center(
              child: ElevatedButton(
                  onPressed: () async{
                    print(provider.isSignedIn);
                    if(provider.isSignedIn == true){
                      await provider.getDataFromSP().whenComplete(() =>Navigator.pushNamed(context, 'homePage') );
                    }else{
                      Navigator.pushNamed(context, 'loginPage');
                    }
                  },
                  child: const Text('Get Started')),
            ),
          );
        }
      ),
    );
  }
}
