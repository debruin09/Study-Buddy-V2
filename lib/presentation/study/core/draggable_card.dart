import 'package:flutter/material.dart';
import 'package:study_buddy/presentation/core/theme_colors.dart';
import 'package:study_buddy/presentation/core/theme_styles.dart';

class DraggableCard extends StatelessWidget {
  final String text;

  final double initialSize, minSize;

  const DraggableCard({
    Key key,
    @required this.text,
    this.minSize = 0.1,
    @required this.initialSize,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: true,
        initialChildSize: initialSize,
        maxChildSize: 0.9,
        minChildSize: minSize,
        builder: (context, scrollController) {
          return Card(
            color: primaryColor.withOpacity(0.3),
            child: Container(
              margin: const EdgeInsets.only(top: 3.0),
              padding:
                  const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              color: Colors.white,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: studyTextTheme,
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// style: Theme.of(context).textTheme.bodyText1,
