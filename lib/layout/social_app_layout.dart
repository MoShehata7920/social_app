import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/styles/colors.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News Feed'),
          ),
          body: ConditionalBuilder(
            condition: SocialCubit.get(context).model != null,
            builder: (context) {
              var model = SocialCubit.get(context).model;

              return Column(
                children: [
                  if (!model!.isEmailVerified!)
                    Container(
                      color: Colors.amber.withOpacity(0.6),
                      height: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              Icons.warning_amber_outlined,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Expanded(
                                child: Text('Please verify your email')),
                            const SizedBox(
                              width: 20,
                            ),
                            defaultTextButton(
                              function: () {
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification()
                                    .then((value) {
                                  showToast(
                                      text: 'Check Your Mail',
                                      state: ToastStates.SUCCESS);
                                }).catchError((error) {});
                              },
                              text: 'Send',
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              );
            },
            fallback: (context) => const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
