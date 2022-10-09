import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

import '../../shared/styles/colors.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            // iconTheme: IconBroken.Arrow___Left_2,
            leading: IconButton(
              icon: const Icon(IconBroken.Arrow___Left_2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Create Post'),
            actions: [
              defaultTextButton(
                  function: () {
                    var now = DateTime.now();
                    if (SocialCubit.get(context).postImage == null) {
                      SocialCubit.get(context).createPost(
                          dateTime: now.toString(), text: textController.text);
                    } else {
                      SocialCubit.get(context).uploadPostImage(
                          dateTime: now.toString(), text: textController.text);
                    }
                  },
                  text: 'Post'),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is SocialCreatePostLoadingState)
                  const SizedBox(
                    height: 10,
                  ),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.g-AmzU4RIkeTm904gJ3tjgHaFj?pid=ImgDet&rs=1',
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    // ignore: prefer_const_constructors
                    Expanded(
                      child: const Text(
                        'Mohamed Shehata',
                        style: TextStyle(
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        hintText: 'What is on your mind .... ',
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                if (SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 140,
                        width: double.infinity,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // ignore: prefer_const_constructors
                          image: DecorationImage(
                            image:
                                FileImage(SocialCubit.get(context).postImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                        icon: const CircleAvatar(
                          radius: 16,
                          child: Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(IconBroken.Image),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text('Add Photo'),
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {}, child: const Text('# Add')),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
