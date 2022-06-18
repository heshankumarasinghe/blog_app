import 'package:flutter/material.dart';

import '../constants/constraints.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/admin_group_tile.dart';

class MyGroupsScreen extends StatelessWidget with ResponsiveLayoutMixin {
  const MyGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Groups'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            width: contentWidth,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: const [
                      AdminGroupTile(
                        userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/70.jpg',
                        groupTitle: 'Social Studies Group',
                      ),
                      SizedBox(
                        height: Constraints.gapBetweenTextFields,
                      ),
                      AdminGroupTile(
                        userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/male/70.jpg',
                        groupTitle: 'Mathematics Group',
                      ),
                      SizedBox(
                        height: Constraints.gapBetweenTextFields,
                      ),
                      AdminGroupTile(
                        userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/50.jpg',
                        groupTitle: 'Environmental Studies Group',
                      ),
                      SizedBox(
                        height: Constraints.gapBetweenTextFields,
                      ),
                      AdminGroupTile(
                        userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/male/60.jpg',
                        groupTitle: 'English Literature Group',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
