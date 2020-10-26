import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_buddy/application/card/card_bloc/card_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/tag_entity.dart';
import 'package:study_buddy/injection.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:study_buddy/presentation/core/theme/theme_styles.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/study/widgets/time_interval.dart';
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
  final TextEditingController _frontController = TextEditingController();
  final TextEditingController _backController = TextEditingController();
  final GlobalKey<ScaffoldState> _gKey = GlobalKey<ScaffoldState>();
  final cardBloc = locator.get<CardBloc>();
  final globalId = locator.get<GlobalId>();
  final cardStatusCubit = locator.get<CardStatusCubit>();
  List<String> tags = [];
  String val = "";

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
      key: _gKey,
      backgroundColor: bgColor,
      appBar: AppBar(
          elevation: 0.0,
          leading: Container(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            margin: EdgeInsets.only(
              top: 15.0,
            ),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => ExtendedNavigator.root.pop(),
            ),
          ),
          title: BlocBuilder<CardStatusCubit, String>(
            cubit: cardStatusCubit,
            buildWhen: (p, c) => p != c,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                child: Text(state == "new" ? 'Create New Card' : 'Edit Card'),
              );
            },
          ),
          backgroundColor: bgColor,
          actions: [
            Container(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              margin: EdgeInsets.only(
                top: 15.0,
              ),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              child: IconButton(
                onPressed: () {
                  if (_frontController.text.isEmpty ||
                      _backController.text.isEmpty) {
                    _gKey.currentState.showSnackBar(
                      SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Fields can't be empty.",
                              style: TextStyle(color: Colors.black),
                            ),
                            Icon(
                              Icons.info,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        backgroundColor: infoColor,
                      ),
                    );
                  } else {
                    cardStatusCubit.state == "new"
                        ? addNewCard()
                        : updateCard();
                    context.read(showAnswerProvider).state = false;
                    _frontController.clear();
                    _backController.clear();
                    context.bloc<DeckStatusCubit>().editDeck();
                    ExtendedNavigator.root.pop();
                  }
                },
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
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
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    controller: _frontController,
                    maxLines: 6,
                    decoration: inputStyle.copyWith(
                      labelText: "Front",
                    ),
                    keyboardType: TextInputType.multiline,
                    autocorrect: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    controller: _backController,
                    maxLines: 9,
                    decoration: inputStyle.copyWith(
                      labelText: "Back",
                    ),
                    keyboardType: TextInputType.multiline,
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

  void updateCard() {
    cardBloc.add(
      CardEvent.update(
        updatedCard: widget.card,
        newData: MyCard(
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
      CardEvent.add(
        card: MyCard(
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
}
