import 'package:blog_app/constants/api_endpoints.dart';
import 'package:flutter/material.dart';

import '../constants/constraints.dart';
import '../constants/app_constants.dart';
import '../mixins/responsive_layout_mixin.dart';
import '../widgets/center_widget.dart';
import '../widgets/admin_group_tile.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../models/admin_group.dart';
import '../services/api_service.dart';
import '../utils/alert_util.dart';

class MyGroupsScreen extends StatefulWidget {
  const MyGroupsScreen({Key? key}) : super(key: key);

  @override
  State<MyGroupsScreen> createState() => _MyGroupsScreenState();
}

class _MyGroupsScreenState extends State<MyGroupsScreen> with ResponsiveLayoutMixin {
  bool _isLoading = false;

  List<AdminGroup> _adminGroups = [];

  void _fetchAllGroups() => ApiService.callApi(
        ApiEndpoints.getGroupsForUser,
        RequestType.post,
        requestBody: {
          'user_id': AppConstants.authUser!.id.toString(),
        },
        onSuccess: (response) {
          _isLoading = false;

          final groups = response['data']['groups'];

          groups.forEach(
            (group) => _adminGroups.add(
              AdminGroup.fromJson(group),
            ),
          );

          setState(() {});
        },
        onFailed: () {},
      );

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _fetchAllGroups();
  }

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);
    final contentHeight = getContentHeight(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Groups'),
          centerTitle: true,
        ),
        body: CenterWidget(
          widget: SizedBox(
            width: contentWidth,
            height: contentHeight,
            child: _isLoading
                ? const Center(
                    child: CustomCircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ..._adminGroups
                                .map(
                                  (group) => Column(
                                    children: [
                                      AdminGroupTile(
                                        adminGroup: group,
                                      ),
                                      const SizedBox(
                                        height: Constraints.gapBetweenTextFields,
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                            // AdminGroupTile(
                            //   userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/70.jpg',
                            //   groupTitle: 'Social Studies Group',
                            // ),
                            // SizedBox(
                            //   height: Constraints.gapBetweenTextFields,
                            // ),
                            // AdminGroupTile(
                            //   userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/male/70.jpg',
                            //   groupTitle: 'Mathematics Group',
                            // ),
                            // SizedBox(
                            //   height: Constraints.gapBetweenTextFields,
                            // ),
                            // AdminGroupTile(
                            //   userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/female/50.jpg',
                            //   groupTitle: 'Environmental Studies Group',
                            // ),
                            // SizedBox(
                            //   height: Constraints.gapBetweenTextFields,
                            // ),
                            // AdminGroupTile(
                            //   userImageUrl: 'https://xsgames.co/randomusers/assets/avatars/male/60.jpg',
                            //   groupTitle: 'English Literature Group',
                            // ),
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
