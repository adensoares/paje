import 'package:paje/src/modules/ato/data/model/ato_model.dart';

class AtoRepository {
  List<AtoModel> atos = [
    AtoModel(
        tipo: 'sentenca',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Sentença 1',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'sentenca',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Sentença 2',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'sentenca',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Sentença 3',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'despacho',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Despacho 1',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'despacho',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Despacho 2',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'decisao',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Decisão 1',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'decisao',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Decisão 2',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'decisao',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Decisão 3',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'decisao',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Decisão 4',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
    AtoModel(
        tipo: 'decisao',
        processo: '0003270-51.2015.4.05.8400',
        magistrado: 'Marco Bruno Miranda Clementino',
        vara: '6ª Vara Federal',
        classe: 'Execução Fiscal',
        titulo: 'Decisão 5',
        data: '10/01/2018 - 16:19',
        texto: '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi.

Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.
'''),
  ];
}
