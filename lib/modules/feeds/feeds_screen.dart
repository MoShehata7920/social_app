import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/cubit/cubit.dart';
import 'package:social_app/layout/cubit/states.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/modules/comment/comment_screen.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.isNotEmpty &&
              SocialCubit.get(context).userModel != null,
          builder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors, sized_box_for_whitespace
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  margin: const EdgeInsets.all(8),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Image(
                        image: NetworkImage(
                          '${SocialCubit.get(context).userModel!.cover}',
                        ),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mo\'s Social App :) ',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem(
                      SocialCubit.get(context).posts[index], context, index),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildPostItem(PostModel model, context, index) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      '${SocialCubit.get(context).userModel!.image}'),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            '${model.name}',
                            style: const TextStyle(
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // ignore: prefer_const_constructors
                          Icon(
                            Icons.check_circle,
                            color: defaultColor,
                            size: 15,
                          )
                        ],
                      ),
                      Text(
                        '${model.dateTime}',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    size: 16,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Text(
              '${model.text}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(
              height: 15,
            ),
            // ignore: sized_box_for_whitespace
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 5),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: double.infinity,
                child: Wrap(
                  children: [
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6.0),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 20,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#Software',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: defaultColor),
                          ),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 6),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        height: 20,
                        child: MaterialButton(
                          onPressed: () {},
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          child: Text(
                            '#flutter',
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: defaultColor),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            if (model.postImages != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  top: 15,
                ),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  // ignore: prefer_const_constructors
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // ignore: prefer_const_constructors
                    image: DecorationImage(
                      image: NetworkImage(
                        '${model.postImages}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              IconBroken.Heart,
                              color: Colors.red,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${SocialCubit.get(context).likes[index]}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Icon(
                              IconBroken.Chat,
                              color: Colors.amber,
                              size: 14,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${SocialCubit.get(context).commentsNum[index]}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).userModel!.image}',
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Write a comment ...',
                          style:
                              Theme.of(context).textTheme.caption!.copyWith(),
                        ),
                      ],
                    ),
                    onTap: () {
                      navigateTo(context, CommentsScreen());
                    },
                  ),
                ),
                InkWell(
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: () {
                    SocialCubit.get(context)
                        .postLikes(SocialCubit.get(context).postId[index]);
                  },
                ),
              ],
            ),
          ],
        ),
      ));
}
