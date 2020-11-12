import 'package:flutter/material.dart';
import 'package:study_buddy/application/card/card_bloc.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';

class DraggableCard extends StatelessWidget {
  final String text;
  final MyCard card;
  final double initialSize, minSize;
  final CardBloc cardBloc;

  const DraggableCard({
    Key key,
    @required this.text,
    @required this.card,
    this.minSize = 0.1,
    this.initialSize,
    this.cardBloc,
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0)),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
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
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    // card.imagesUrl != null
                    //     ? Wrap(
                    //         direction: Axis.horizontal,
                    //         spacing: 5.0,
                    //         runSpacing: 5.0,
                    //         children: card.imagesUrl
                    //             .map(
                    //               (url) => ImageViewer(
                    //                 onPressed: () {
                    //                   print("Long pressed");
                    //                   // cardBloc.add(CardState.)
                    //                 },
                    //                 imageUrl: url,
                    //                 height: 100.0,
                    //                 width: 100.0,
                    //               ),
                    //             )
                    //             .toList())
                    //     : Container(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
