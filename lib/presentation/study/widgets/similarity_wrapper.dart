import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/application/similarity/similarity_bloc/similarity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';

class RefineButton extends StatelessWidget {
  final SimilarityBloc simBloc;

  const RefineButton({Key key, @required this.simBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: FlatButton(
        shape: CircleBorder(),
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20.0),
        color: primaryColor.withOpacity(0.6),
        onPressed: () {
          simBloc.add(
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
            RefineButton(simBloc: simBloc),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: BlocBuilder<SimilarityBloc, SimilarityState>(
                  cubit: simBloc,
                  builder: (context, state) {
                    return state.map(
                        initial: (_) => Container(),
                        loading: (_) => Loader(
                              color: primaryColor,
                            ),
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
