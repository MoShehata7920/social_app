// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:social_app/layout/cubit/cubit.dart';
// import 'package:social_app/models/comment_model.dart';
// import 'package:social_app/shared/component/component.dart';
// import 'package:social_app/shared/styles/icon_broken.dart';

// import '../../models/post_model.dart';

// class CommentsScreen extends StatelessWidget {
//   CommentsScreen({Key? key}) : super(key: key);

//   String? postId;
//   String? receiverUid;
//   int? likesNumber;
//   int? index;

//   var commentControlle = TextEditingController();
//   var formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     SocialCubit cubit = SocialCubit.get(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         systemOverlayStyle: const SystemUiOverlayStyle(
//           statusBarColor: Colors.white,
//           statusBarBrightness: Brightness.dark,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//         elevation: 1,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             IconBroken.Arrow___Left,
//             size: 30,
//             color: Colors.black,
//           ),
//         ),
//         titleSpacing: 1,
//         title: const Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue, fontSize: 20),
//         ),
//       ),
//       body: ConditionalBuilder(
//           condition: cubit.comments.isNotEmpty,
//           builder: (context) => SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Expanded(
//                     //   child: ListView.separated(
//                     //     itemBuilder:(context, index) => buildComment(
//                     //       SocialCubit.get(context).posts[index], context , index) ,
//                     //     separatorBuilder: (context , index) => myDivider() ,
//                     //     itemCount: cubit.comments.length
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//           fallback: (context) =>
//               const Center(child: CircularProgressIndicator())),
//     );
//   }

//   // Widget buildComment(PostModel model, CommentModel comment, context) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(12.0),
//   //     child: Row(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         CircleAvatar(
//   //           radius: 25,
//   //           backgroundImage: NetworkImage('${comment.image}'),
//   //         ),
//   //         Expanded(
//   //             child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Container(
//   //               decoration: BoxDecoration(
//   //                   // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
//   //                   boxShadow: [
//   //                     const BoxShadow(
//   //                         color: Colors.grey,
//   //                         blurRadius: 9,
//   //                         spreadRadius: 4,
//   //                         offset: Offset(0, 4))
//   //                   ],
//   //                   borderRadius: const BorderRadius.only(
//   //                     bottomLeft: Radius.circular(20),
//   //                     bottomRight: Radius.circular(20),
//   //                     topRight: Radius.circular(20),
//   //                   ),
//   //                   color: Colors.grey.shade300),
//   //               child: Padding(
//   //                 padding: const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 12),
//   //                 child: Column(
//   //                   mainAxisAlignment: MainAxisAlignment.start,
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     Row(
//   //                       children: [
//   //                         Text(
//   //                           '${comment.name}',
//   //                           textAlign: TextAlign.start,
//   //                           maxLines: 1,
//   //                           overflow: TextOverflow.ellipsis,
//   //                           style: const TextStyle(color: Colors.blue),
//   //                         ),
//   //                         const Icon(
//   //                           Icons.check_circle,
//   //                           color: Colors.blue,
//   //                           size: 20,
//   //                         )
//   //                       ],
//   //                     ),
//   //                     Text(
//   //                       '${comment.comment}',
//   //                       style:
//   //                           const TextStyle(color: Colors.black, fontSize: 17),
//   //                     )
//   //                   ],
//   //                 ),
//   //               ),
//   //             ),
//   //             Text(
//   //               '${model.dateTime}',
//   //               style:
//   //                   Theme.of(context).textTheme.caption!.copyWith(height: 1.4),
//   //             ),
//   //           ],
//   //         ))
//   //       ],
//   //     ),
//   //   );
//   // }

// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/shared/component/component.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconBroken.Arrow___Left,
              size: 30,
              color: Colors.black,
            ),
          ),
          titleSpacing: 1,
          title: const Text(
            'comments',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildComment(context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: 10));
  }

  Widget buildComment(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/social-app-8e7d2.appspot.com/o/userProfileImage%2Fimage_picker1497821885160032962.jpg?alt=media&token=a8857b47-6734-448c-a6ac-7236fc66cdf3'),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 9,
                          spreadRadius: 4,
                          offset: const Offset(0, 4))
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.grey.shade300,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12, 5, 12, 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Mohamed Shehata',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.blue),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        const Text(
                          'Here are some popular examples, which you can copy directly into Excel to experiment with on',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '2022-10-09 22:29:22.528415',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        height: 1.3,
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
