import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/application/similarity/similarity_bloc/similarity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';

class RefineButton extends StatelessWidget {
  final _simBloc = locator.get<SimilarityBloc>();
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      onPressed: () {
        _simBloc.add(
            GetSimilarityScoreEvent(original: "null", myDefinition: "null"));
      },
      child: Text(
        "refine",
      ),
    );
  }
}

// Similarity  Wrapper
class SimilarityWrapper extends StatelessWidget {
  final _simBloc = locator.get<SimilarityBloc>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[50],
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RefineButton(),
            BlocBuilder<SimilarityBloc, SimilarityState>(
                cubit: _simBloc,
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
                })
          ]),
    );
  }
}
