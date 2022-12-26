import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/helper.dart';

import '../Widgets/avatar.dart';
import '../models/story_data.dart';

class MessagesPages extends StatefulWidget {
  const MessagesPages({Key? key}) : super(key: key);

  @override
  State<MessagesPages> createState() => _MessagesPagesState();
}

class _MessagesPagesState extends State<MessagesPages> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _Stories(),
        ),
      ],
    );
  }
}


class _Stories extends StatelessWidget {
  const _Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 125,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const
              Padding(
                padding: EdgeInsets.only(left: 12,top: 8),
                child: Text('Stories',style: TextStyle(
                   fontFamily: 'AppleFont',
                   fontSize: 18,
                  fontWeight: FontWeight.w700
             ),
             ),
              ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 68,
                    child: _StoryCard(
                        storyData: StoryData(
                            name: faker.person.name(),
                            url: Helpers.randomPictureUrl())
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({
    Key? key,
    required this.storyData,
  }) : super(key: key);

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Avatar.medium(url: storyData.url),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              storyData.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'AppleFont',
                fontSize: 11,
                letterSpacing: 0.3,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
