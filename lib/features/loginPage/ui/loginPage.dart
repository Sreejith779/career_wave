import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portel/features/loginPage/googleAuth.dart';
import 'package:job_portel/features/tabs/tabs.dart';

import '../../utils/texts.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = LoginBloc();
  @override
  void initState() {
    loginBloc.add(LoginInitialLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case LoginLoadedState:
            return Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: Column(
                        children: [
                          Text(
                            "CareerWave",
                            style: Texts().Htext.copyWith(fontSize: 28),
                          ),
                          Text(
                            " Ride the Wave to Your Next Opportunity",
                            style: Texts().Htext,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              bool isSignedIn = await FirebaseService().signInWithGoogle();
                              if (isSignedIn) {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Tabs()));
                              } else {
                                return;
                              }
                            },
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/google.png",
                                      width: 30,
                                      height: 25,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Sign in with Google",
                                      style: Texts()
                                          .Stext
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () async {},
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: 150),
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.redAccent.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(child: Text("Login with Google")),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
