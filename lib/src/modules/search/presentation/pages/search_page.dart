import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:paje/src/core/widgets/paje_filterIcon_widget.dart';

import 'package:paje/src/core/widgets/paje_elevatedButton_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paje/src/core/const/paje_colors.dart';
import 'package:paje/src/core/widgets/paje_searchbar_widget.dart';

import 'package:paje/src/modules/atos/data/model/ato_model.dart';
import 'package:paje/src/modules/atos/data/repository/ato_repository.dart';
import 'package:paje/src/modules/atos/presentation/pages/ato_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  AtoRepository repository = AtoRepository();
  final _searchController = TextEditingController();

  final atoRepository = AtoRepository();

  List<AtoModel> _favorites = [];
  List<AtoModel> _atosFound = [];
  List<String> _tipos = [];

  String _keyWord = '';

  String? _magistradoSelected;
  List<String> _magistrados = ['Magistrado 1', 'Magistrado 2', 'Magistrado 3'];

  String? _classeSelected;
  List<String> _classes = ['Classe 1', 'Classe 2', 'Classe 3'];

  String? _varaSelected;
  List<String> _varas = ['Vara 1', 'Vara 2', 'Vara 3'];

  final TextEditingController _processoController = TextEditingController();
  final RegExp _regExp =
      RegExp(r'(\d{7})(\d{2})\.(\d{4})\.([A-Z])\.(TR|ZZ|JT|JF|JE)\.(\d{4})');

// Definindo o TextInputFormatter para aplicar a máscara
  final MaskTextInputFormatter _maskFormatter = MaskTextInputFormatter(
    mask: '#######-##.####.#.##.####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

  void _addTipoFiltro(String tipo) {
    if (!_tipos.contains(tipo)) {
      setState(() {
        _tipos.add(tipo);
      });
      _search(_searchController.text,
          tipos: _tipos); // Chama a função _search com a lista atualizada
    }
  }

  void _removeTipoFiltro(String tipo) {
    if (_tipos.contains(tipo)) {
      setState(() {
        _tipos.remove(tipo);
      });
      _search(_searchController.text,
          tipos: _tipos); // Chama a função _search com a lista atualizada
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        helpText: 'Selecione a data inicial');
    if (picked != null) {
      setState(() {
        _startDateController.text = DateFormat('dd/MM/yyyy').format(picked);
        _selectEndDate(context);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        helpText: 'Selecione a data final');
    if (picked != null) {
      setState(() {
        _endDateController.text = DateFormat('dd/MM/yyyy').format(picked);
        // Aqui você pode utilizar as datas selecionadas para filtrar o período
        String startDate = _startDateController.text;
        String endDate = _endDateController.text;
        // ...
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAtosJson = prefs.getStringList('favoriteAtos');
    if (favoriteAtosJson != null) {
      final List<AtoModel> favoriteAtos =
          favoriteAtosJson.map((json) => AtoModel.fromJson(json)).toList();
      setState(() {
        _favorites = favoriteAtos;
      });
    }
  }

  void _toggleFavorite(AtoModel ato) {
    setState(() {
      if (_favorites.contains(ato)) {
        _favorites.remove(ato);
      } else {
        _favorites.add(ato);
      }
    });
    _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAtosJson = _favorites.map((ato) => ato.toJson()).toList();
    await prefs.setStringList('favoriteAtos', favoriteAtosJson);
  }

  void _search(String value,
      {List<String>? tipos,
      String? processo,
      String? magistrado,
      String? classe,
      String? vara,
      DateTime? dataInicial,
      DateTime? dataFinal}) {
    List<AtoModel> _result = [];

    if (value.isEmpty) {
      _result = [];
    } else {
      // _result = repository.atos
      //     .where(
      //         (ato) => ato.titulo.toLowerCase().contains((value.toLowerCase())))
      //     .toList();
      _result = repository.atos.where((ato) {
        bool matchesValue =
            ato.titulo.toLowerCase().contains(value.toLowerCase()) ||
                ato.texto.toLowerCase().contains(value.toLowerCase());

        bool matchesTipo = true;
        if (tipos != null && tipos.isNotEmpty) {
          matchesTipo = tipos.any((tipo) => ato.tipo.contains(tipo));
        }

        bool matchesProcesso = true;
        if (processo != null && processo.isNotEmpty) {
          matchesProcesso = ato.processo.contains(processo);
        }

        bool matchesMagistrado = true;
        if (magistrado != null && magistrado.isNotEmpty) {
          matchesMagistrado = ato.magistrado.contains(magistrado);
        }

        bool matchesClasse = true;
        if (classe != null && classe.isNotEmpty) {
          matchesClasse = ato.classe.contains(classe);
        }

        bool matchesVara = true;
        if (vara != null && vara.isNotEmpty) {
          matchesVara = ato.vara.contains(vara);
        }

        bool matchesDataInicial = true;
        if (dataInicial != null) {
          DateTime atoDataInicial = DateFormat('dd/MM/yyyy').parse(ato.data);
          matchesDataInicial = atoDataInicial.compareTo(dataInicial) >= 0;
        }

        bool matchesDataFinal = true;
        if (dataFinal != null) {
          DateTime atoDataFinal = DateFormat('dd/MM/yyyy').parse(ato.data);
          matchesDataFinal = atoDataFinal.compareTo(dataFinal) <= 0;
        }

        return matchesValue &&
            matchesTipo &&
            matchesProcesso &&
            matchesMagistrado &&
            matchesClasse &&
            matchesVara &&
            matchesDataInicial &&
            matchesDataFinal;
      }).toList();
    }
    setState(() {
      _atosFound = _result;
    });
  }

  void _clearFilters(newSetState) {
    setState(() {
      _processoController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _magistradoSelected = null;
      _classeSelected = null;
      _varaSelected = null;
    });
    _updateDropdownValue(newSetState);
  }

  void _updateDropdownValue(newSetState) {
    newSetState(() {
      _magistradoSelected;
      _classeSelected;
      _varaSelected;
    });
  }

  void _openFilterModal(_keyWord) {
    showModalBottomSheet(
      enableDrag: false,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, newSetState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                      Text(
                        'Filtros',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _clearFilters(newSetState);
                        },
                        child: Text('Limpar Filtros'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Número do processo',
                    style: TextStyle(
                      color: PajeColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: _processoController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [_maskFormatter],
                    decoration: InputDecoration(
                      hintText: '9999999-99.9999.9.99.9999',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Período',
                    style: TextStyle(
                      color: PajeColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _startDateController,
                          onTap: () {
                            _selectStartDate(context);
                          },
                          decoration: InputDecoration(
                            hintText: 'De',
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _endDateController,
                          onTap: () {
                            _selectEndDate(context);
                          },
                          decoration: InputDecoration(
                            hintText: 'Até',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Magistrado',
                    style: TextStyle(
                      color: PajeColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _magistradoSelected,
                    items: atoRepository
                        .getMagistrados()
                        .map((magistrado) => DropdownMenuItem(
                              value: magistrado,
                              child: Text(magistrado),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _magistradoSelected = value!;
                      _updateDropdownValue(newSetState);
                    },
                    isExpanded: true,
                    hint: Text('Selecione um magistrado'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Classe',
                    style: TextStyle(
                      color: PajeColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _classeSelected,
                    items: atoRepository
                        .getClasses()
                        .map((classe) => DropdownMenuItem(
                              value: classe,
                              child: Text(classe),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _classeSelected = value!;
                      _updateDropdownValue(newSetState);
                    },
                    isExpanded: true,
                    hint: Text('Selecione uma classe'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Vara',
                    style: TextStyle(
                      color: PajeColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _varaSelected,
                    items: atoRepository
                        .getVaras()
                        .map((vara) => DropdownMenuItem(
                              value: vara,
                              child: Text(vara),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _varaSelected = value!;
                      _updateDropdownValue(newSetState);
                    },
                    isExpanded: true,
                    hint: Text('Selecione uma vara'),
                  ),
                  SizedBox(height: 32),
                  PajeElevatedButton(
                    onPressed: () {
                      _search(
                        _keyWord,
                        processo: _processoController.text,
                        magistrado: _magistradoSelected,
                        classe: _classeSelected,
                        vara: _varaSelected,
                        dataInicial: _startDateController.text.isNotEmpty
                            ? DateFormat('dd/MM/yyyy')
                                .parse(_startDateController.text)
                            : null,
                        dataFinal: _endDateController.text.isNotEmpty
                            ? DateFormat('dd/MM/yyyy')
                                .parse(_endDateController.text)
                            : null,
                      );
                      print(_keyWord);
                      print(_processoController.text);
                      print(_magistradoSelected);
                      print(_classeSelected);
                      print(_varaSelected);
                      Navigator.pop(context);
                    },
                    text: "Aplicar",
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca por Atos Judiciais"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: PajeSearchBar(
                controller: _searchController,
                onChanged: ((value) {
                  _search(value);
                  _keyWord = value;
                }),
                onPressed: () {
                  _openFilterModal(_keyWord);
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Text(
            //     "Ato Judicial",
            //     style: TextStyle(
            //       color: PajeColors.customMaterialPrimary,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PajeFilterButton(
                    title: 'Despacho',
                    icon: Icons.approval,
                    onSelect: (isSelected) {
                      if (isSelected) {
                        _addTipoFiltro('despacho');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      } else {
                        _removeTipoFiltro('despacho');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      }
                    },
                  ),
                  PajeFilterButton(
                    title: 'Sentença',
                    icon: Icons.gavel,
                    onSelect: (isSelected) {
                      if (isSelected) {
                        _addTipoFiltro('sentenca');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      } else {
                        _removeTipoFiltro('sentenca');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      }
                    },
                  ),
                  PajeFilterButton(
                    title: 'Decisão',
                    icon: Icons.balance,
                    onSelect: (isSelected) {
                      if (isSelected) {
                        _addTipoFiltro('decisao');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      } else {
                        _removeTipoFiltro('decisao');
                        _search(
                          _keyWord,
                          tipos: _tipos,
                          processo: _processoController.text,
                          magistrado: _magistradoSelected,
                          classe: _classeSelected,
                          vara: _varaSelected,
                          dataInicial: _startDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_startDateController.text)
                              : null,
                          dataFinal: _endDateController.text.isNotEmpty
                              ? DateFormat('dd/MM/yyyy')
                                  .parse(_endDateController.text)
                              : null,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: _atosFound.isNotEmpty
                    ? ListView.builder(
                        itemCount: _atosFound.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => AtoDetailPage(
                                          atoModel: _atosFound[index],
                                        ),
                                      ),
                                    );
                                  },
                                  trailing: IconButton(
                                    icon: Icon(
                                      _favorites.contains(_atosFound[index])
                                          ? Icons.star
                                          : Icons.star_border,
                                      // color:
                                      //     _favorites.contains(_atosFound[index])
                                      //         ? Colors.yellow
                                      //         : PajeColors.customMaterialPrimary,
                                      color: PajeColors.customMaterialPrimary,
                                      size: 32,
                                    ),
                                    onPressed: () =>
                                        _toggleFavorite(_atosFound[index]),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      _atosFound[index].titulo,
                                      style: TextStyle(
                                        color: PajeColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    _atosFound[index].texto,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  isThreeLine: true,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 65,
                                  ),
                                  child: Divider(),
                                )
                              ],
                            ),
                          );
                        })
                    : _keyWord != ''
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  color: PajeColors.primary,
                                  size: 150,
                                ),
                                Text(
                                  "Nenhum Ato Judicial Encontrado",
                                  style: TextStyle(
                                    color: PajeColors.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Center()),
          ],
        ),
      ),
    );
  }
}
