import 'package:flutter/material.dart';
import 'package:study_buddy/application/card/card_bloc.dart';
import 'package:study_buddy/application/core/status/status_cubit.dart';
import 'package:study_buddy/domain/card/mycard.dart';
import 'package:study_buddy/domain/core/tag_entity.dart';
// import 'package:study_buddy/infrastructure/core/image_service.dart';
// import 'package:study_buddy/infrastructure/core/storage_service.dart';
import 'package:study_buddy/infrastructure/core/tag_service.dart';
import 'package:study_buddy/injection.dart';
import 'package:study_buddy/presentation/core/widgets/shared_widgets.dart';
import 'package:study_buddy/infrastructure/core/helper_service.dart';
import 'package:study_buddy/presentation/core/theme/theme_colors.dart';
import 'package:study_buddy/presentation/create/core/card_textfield.dart';
import 'package:study_buddy/presentation/create/core/create_card_appbar.dart';
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
  // final _imageFileDetails = locator.get<ImageFileDetails>();
  final cardStatusCubit = locator.get<CardStatusCubit>();
  final _tagService = locator.get<TagService>();
  // final _imageService = locator.get<ImageService>();
  // final _storageService = locator.get<StorageService>();
  List<String> tags = [];
  List<String> imagesUrl = [];
  String val = "";

  @override
  void initState() {
    cardStatusCubit.state.map(newCard: (_) {
      final newCardID = Uuid().v4();
      globalId.setCardId(newCardID);
    }, editCard: (_) {
      _frontController.text = widget.card.front;
      _backController.text = widget.card.back;
      widget.card.tags.addAll(tags);
      // widget.card.imagesUrl.addAll(imagesUrl);
    });

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
      appBar: buildAppBar(
          gKey: _gKey,
          context: context,
          controllers: [_frontController, _backController],
          cardStatusCubit: cardStatusCubit,
          methods: [addNewCard, updateCard]),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                cardTextField(_frontController, 'Front', 8),
                const SizedBox(
                  height: 10,
                ),
                cardTextField(_backController, 'Back', 8),
                const SizedBox(
                  height: 10,
                ),
                TagWidget(
                  tagService: _tagService,
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
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                    height: 30.0,
                    minWidth: 50.0,
                    padding: EdgeInsets.all(10.0),
                    child: Row(children: [
                      Icon(Icons.image),
                      Text("choose an image"),
                    ]),
                    onPressed: () async {
                      // _imageFileDetails
                      //     .setImageFile(await _imageService.getImage());
                      // final imageUrl = _storageService.uploadImage(
                      //     image: _imageFileDetails.imageFile);
                      // _imageFileDetails.setImageUrl(await imageUrl);

                      // imagesUrl.add(_imageFileDetails.imageUrl);
                      // updateCard();
                    }),
                SizedBox(height: 5.0),
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
        updatedCard: widget.card.copyWith(
          back: _backController.text,
          front: _frontController.text,
          dateCreated: DateTime.now().toIso8601String().toString(),
          difficulty: "easy",
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
        ),
      ),
    );
  }
}
