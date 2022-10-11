// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social_app/layout/cubit/cubit.dart';
// import 'package:social_app/layout/cubit/states.dart';
// import 'package:social_app/models/user_model.dart';
// import 'package:social_app/shared/component/component.dart';

// import '../../shared/styles/colors.dart';

// class ChatsScreen extends StatelessWidget {
//   const ChatsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return ConditionalBuilder(
//           condition: SocialCubit.get(context).users.isNotEmpty,
//           builder: (context) => ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: (context, index) =>
//                 buildChatItem(SocialCubit.get(context).users[index]),
//             separatorBuilder: (context, index) => myDivider(),
//             itemCount: SocialCubit.get(context).users.length,
//           ),
//           fallback: (context) =>
//               const Center(child: CircularProgressIndicator()),
//         );
//       },
//     );
//   }

//   Widget buildChatItem(SocialUserModel model) => InkWell(
//         onTap: () {},
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Row(
//               // ignore: prefer_const_literals_to_create_immutables
//               children: [
//                 CircleAvatar(
//                   radius: 25,
//                   backgroundImage: NetworkImage('${model.image}'),
//                 ),
//                 const SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   '${model.name}',
//                   style: const TextStyle(
//                     height: 1.4,
//                   ),
//                 )
//               ]),
//         ),
//       );
// }

import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('comments'),
      ),
    );
  }
}
