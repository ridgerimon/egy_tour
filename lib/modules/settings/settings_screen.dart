import 'package:buildcondition/buildcondition.dart';
import 'package:egy_tour/layout/cubit/cubit.dart';
import 'package:egy_tour/layout/cubit/states.dart';
import 'package:egy_tour/modules/auth/login/login_screen.dart';
import 'package:egy_tour/modules/splash/splash_screen.dart';
import 'package:egy_tour/shared/components/components.dart';
import 'package:egy_tour/shared/components/constants.dart';
import 'package:egy_tour/shared/network/local/cache_helper.dart';
import 'package:egy_tour/shared/style/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutAppCubit, HomeLayoutStates>(
      listener: (context, states){},
      builder: (context, states)
      {
        return Scaffold(
          body: BuildCondition(
            condition: model != null,
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 300.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/logo_name.png"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).primaryColorDark,
                          backgroundImage: NetworkImage(
                            model!.userImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    model!.userName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(35)),
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Email Address: ${model!.userEmail}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Phone Number: ${model!.userNumber}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: Container(
                    width: 250,
                    height: 50,
                    child: defaultButton(
                      text: "Logout",
                      function: () {
                        CacheHelper.remove(key: "uId");
                        FirebaseAuth.instance.signOut();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Logout"),
                          duration: Duration(seconds: 4),
                          backgroundColor: Colors.green,
                        ));
                        navigateAndFinish(context, LoginScreen());
                      },
                    ),
                  ),
                ),
              ],
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
