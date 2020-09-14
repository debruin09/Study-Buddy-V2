import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:study_buddy/blocs/card_bloc/card_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/blocs/deckCubit/status_cubit.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/models/models.dart';
import 'package:study_buddy/services/helper_service.dart';
import 'package:study_buddy/ui/theme/theme_colors.dart';
import 'package:study_buddy/ui/widgets/shared.dart';
import 'package:uuid/uuid.dart';

class CreateNewCardPage extends StatefulWidget {
  final MyCard card;

  CreateNewCardPage({
    Key key,
    this.card,
  }) : super(key: key);

  @override
  _CreateNewCardPageState createState() => _CreateNewCardPageState();
}

class _CreateNewCardPageState extends State<CreateNewCardPage> {
  // TODO: DISPLAY TAGS WHEN THEY LOAD FROM THE DATABASE, ADD MORE TAGS TO PREVIOUS TAGS
  final TextEditingController _frontController = TextEditingController();
  final TextEditingController _backController = TextEditingController();
  final cardBloc = locator.get<CardBloc>();
  final globalId = locator.get<GlobalId>();
  final deckStatusCubit = locator.get<DeckStatusCubit>();
  final cardStatusCubit = locator.get<CardStatusCubit>();
  List<String> tags = [];
  String val = "";

  void updateCard() {
    cardBloc.add(
      UpdateCard(
        widget.card,
        MyCard(
          back: _backController.text.isEmpty
              ? widget.card.back
              : _backController.text,
          front: _frontController.text.isEmpty
              ? widget.card.front
              : _frontController.text,
          dateCreated: DateTime.now().toIso8601String().toString(),
          difficulty: "easy",
          id: widget.card.id,
          tags: tags.length == 0 ? widget.card.tags : tags,
        ),
      ),
    );
  }

  void addNewCard() {
    cardBloc.add(
      AddCard(
        MyCard(
          id: globalId.cardId,
          front: _frontController.text,
          difficulty: "easy",
          back: _backController.text,
          dateCreated: DateTime.now().toIso8601String().toString(),
          tags: tags,
          isLocal: true,
        ),
      ),
    );
  }

  @override
  void initState() {
    if (cardStatusCubit.state == "new") {
      final newCardID = Uuid().v4();
      globalId.setCardId(newCardID);
    }
    super.initState();
    cardBloc.dispose();
  }

  @override
  void dispose() {
    _frontController.dispose();
    _backController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: BlocBuilder<CardStatusCubit, String>(
            cubit: cardStatusCubit,
            buildWhen: (p, c) => p != c,
            builder: (context, state) {
              return Text(state == "new" ? 'Create New Card' : 'Edit Card');
            },
          ),
          backgroundColor: cardColor,
          actions: [
            FlatButton.icon(
              onPressed: () {
                cardStatusCubit.state == "new" ? addNewCard() : updateCard();
                _frontController.clear();
                _backController.clear();
                deckStatusCubit.changeDeckStatus("edit");
                ExtendedNavigator.rootNavigator.pop();
              },
              icon: Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text(
                "save",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 30.0, left: 20.0, right: 20.0, top: 10.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: 30.0,
          ),
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: _frontController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      labelText: "Front",
                    ),
                    keyboardType: TextInputType.multiline,
                    autovalidateMode: AutovalidateMode.disabled,
                    autocorrect: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0),
                  color: Colors.white,
                  child: TextFormField(
                    controller: _backController,
                    maxLines: 9,
                    decoration: InputDecoration(
                      labelText: "Back",
                    ),
                    keyboardType: TextInputType.multiline,
                    autovalidateMode: AutovalidateMode.disabled,
                    autocorrect: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TagWidget(
                  onChanged: () {
                    tags.add(val);
                  },
                  additionalCallback: (String value) {
                    val = value;
                    return TagEntity(
                      tag: value,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
