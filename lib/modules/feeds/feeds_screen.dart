import 'package:flutter/material.dart';
import 'package:social_app/shared/styles/colors.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              alignment: AlignmentDirectional.bottomStart,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Image(
                  image: NetworkImage(
                    'https://th.bing.com/th/id/R.65357ad39ab2da7992165f99a7460be7?rik=pM0CUbyeDeQg9Q&pid=ImgRaw&r=0',
                  ),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Communicate With friends',
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
            itemBuilder: (context, index) => buildPostItem(context),
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemCount: 10,
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }

  Widget buildPostItem(context) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'Mohamed Shehata',
                            style: TextStyle(
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
                        'October 4 , 2022 at 12:00 pm ',
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
              'Learning a little each day adds up. Research shows that students who make learning a habit are more likely to reach their goals. Set time aside to learn and get reminders using your learning scheduler.',
              style: Theme.of(context).textTheme.subtitle1,
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
            Container(
              height: 140,
              width: double.infinity,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // ignore: prefer_const_constructors
                image: DecorationImage(
                  image: const NetworkImage(
                    'https://wallpaper-mania.com/wp-content/uploads/2018/09/High_resolution_wallpaper_background_ID_77701978641.jpg',
                  ),
                  fit: BoxFit.cover,
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
                              '120',
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
                              '120',
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
                        const CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://image.freepik.com/free-photo/skeptical-woman-has-unsure-questioned-expression-points-fingers-sideways_273609-40770.jpg',
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
                    onTap: () {},
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
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ));
}
