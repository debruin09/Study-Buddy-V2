import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/application/similarity/similarity_bloc/similarity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';

class RefineButton extends StatelessWidget {
  final _simBloc = locator.get<SimilarityBloc>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 15.0),
      child: FlatButton(
        shape: CircleBorder(),
        child: Icon(
          Icons.check,
          color: primaryColor,
        ),
        padding: EdgeInsets.all(20.0),
        color: primaryColor.withOpacity(0.3),
        onPressed: () {
          _simBloc.add(
              GetSimilarityScoreEvent(original: "null", myDefinition: "null"));
        },
      ),
    );
  }
}

// Similarity  Wrapper
class SimilarityWrapper extends StatelessWidget {
  final SimilarityBloc simBloc;

  const SimilarityWrapper({Key key, @required this.simBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RefineButton(),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: BlocBuilder<SimilarityBloc, SimilarityState>(
                  cubit: simBloc,
                  builder: (context, state) {
                    return state.map(
                        initial: (_) => Container(),
                        loading: (_) => Loading(),
                        success: (data) {
                          return data.similarityScore.fold(
                            (f) => Text("${f.message}"),
                            (s) => Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                "${s.similarityScore}%",
                                style: GoogleFonts.laila(
                                    color: Colors.black45,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        });
                  }),
            )
          ]),
    );
  }
}
