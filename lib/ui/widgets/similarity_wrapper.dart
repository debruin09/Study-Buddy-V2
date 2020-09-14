import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_buddy/blocs/similarity_bloc/similarity_bloc.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/widgets/shared.dart';

class RefineButton extends StatelessWidget {
  final SimilarityBloc similarityBloc;

  const RefineButton({Key key, @required this.similarityBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      onPressed: () {
        similarityBloc.add(
            GetSimilarityScoreEvent(original: "null", myDefinition: "null"));
      },
      child: Text(
        "refine",
        style: TextStyle(color: appBarTextColor),
      ),
    );
  }
}

// Similarity  Wrapper
class SimilarityWrapper extends StatelessWidget {
  final SimilarityBloc similarityBloc;

  const SimilarityWrapper({Key key, this.similarityBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RefineButton(
            similarityBloc: similarityBloc,
          ),
          BlocBuilder<SimilarityBloc, SimilarityState>(
              cubit: similarityBloc,
              builder: (context, state) {
                if (state is InitialSimilarityState) {
                  return Container();
                }
                if (state is SimilarityStateLoadSuccess) {
                  return state.similarityScore.fold(
                    (f) => Text("${f.message}"),
                    (s) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "${s.similarityScore * 100}%",
                        style: GoogleFonts.laila(
                            color: Colors.black45,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }
                if (state is SimilarityStateLoadInProgress) {
                  return Loading();
                }
                return Container();
              })
        ],
      ),
    );
  }
}
