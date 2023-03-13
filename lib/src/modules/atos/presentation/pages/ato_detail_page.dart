import 'package:flutter/material.dart';

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
        title: Text("Detalhes"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Column(
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
                                          padding: const EdgeInsets.symmetric(
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
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Text(widget.atoModel.classe),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Center(
                              child: widget.atoModel.tipo == "despacho"
                                  ? Icon(
                                      Icons.approval,
                                      color: PajeColors.watermark,
                                      size: 150,
                                    )
                                  : widget.atoModel.tipo == "sentenca"
                                      ? Icon(
                                          Icons.gavel,
                                          color: PajeColors.watermark,
                                          size: 150,
                                        )
                                      : Icon(
                                          Icons.balance,
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
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          widget.atoModel.texto,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
