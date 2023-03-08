import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paje/src/core/widgets/circle_icon_button_widget.dart';

import '../../../../core/const/paje_colors.dart';
import '../../data/model/ato_model.dart';

class AtoDetailPage extends StatefulWidget {
  final AtoModel atoModel;
  const AtoDetailPage({
    Key? key,
    required this.atoModel,
  }) : super(key: key);

  @override
  State<AtoDetailPage> createState() => _AtoDetailPageState();
}

class _AtoDetailPageState extends State<AtoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PajeColors.background,
      appBar: AppBar(
        title: Text("Ato Judicial"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 32,
            right: 32,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Paje.png',
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Processo',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: PajeColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(widget.atoModel.processo),
                                    ),
                                    Text(
                                      'Magistrado',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: PajeColors.primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(widget.atoModel.magistrado),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Vara',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: PajeColors.primary,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                              ),
                                              child: Text(widget.atoModel.vara),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Classe',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: PajeColors.primary,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                              ),
                                              child:
                                                  Text(widget.atoModel.classe),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Center(
                                child: Icon(
                                  FontAwesomeIcons.gavel,
                                  color: PajeColors.watermark,
                                  size: 150,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: Card(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 16.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.atoModel.titulo,
                                            style: TextStyle(
                                              color: PajeColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              widget.atoModel.data,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                            ),
                                            child: Text(
                                              widget.atoModel.texto,
                                              style: TextStyle(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 12.5,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleIconButton(
                                        solidIcon:
                                            Icon(FontAwesomeIcons.filePdf),
                                        outlineIcon:
                                            Icon(FontAwesomeIcons.filePdf),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleIconButton(
                                            solidIcon: Icon(
                                              FontAwesomeIcons.solidBookmark,
                                            ),
                                            outlineIcon:
                                                Icon(FontAwesomeIcons.bookmark),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          CircleIconButton(
                                            solidIcon: Icon(
                                              FontAwesomeIcons.solidBell,
                                            ),
                                            outlineIcon:
                                                Icon(FontAwesomeIcons.bell),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
