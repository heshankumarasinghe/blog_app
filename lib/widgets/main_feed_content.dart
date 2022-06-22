import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../mixins/responsive_layout_mixin.dart';
import '../widgets/no_preview_available_container.dart';

class MainFeedContent extends StatelessWidget with ResponsiveLayoutMixin {
  final String? feedImageUrl;
  final String feedDescription;
  final int likesCount;

  const MainFeedContent({
    Key? key,
    required this.feedImageUrl,
    required this.feedDescription,
    required this.likesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = getContentWidth(context);

    return Column(
      children: [
        SizedBox(
          width: contentWidth,
          height: 300,
          child: feedImageUrl != null
              ? Image.network(
                  feedImageUrl!,
                  fit: BoxFit.fill,
                )
              : const NoPreviewAvailableContainer(),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: contentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.thumbsUp,
                ),
                iconSize: 32.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          width: contentWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$likesCount Likes',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: contentWidth,
          child: Text(
            feedDescription,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: contentWidth,
          child: const Divider(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
