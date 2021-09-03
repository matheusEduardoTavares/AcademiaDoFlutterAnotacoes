import 'package:composite_pattern/pages/feed_page/feed_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Composite Pattern',
    home: FeedPage(),
  ),
);

///Trata-se de outro pattern de estrutura, em que basicamente é feito 
///composição de elementos formando uma árvore e assim reaproveitando os 
///componentes comuns. Basicamente, a primeira abstração implementar uma 
///interface que conterá os contratos necessários comuns para todos descendentes
///da primeira abstração, e essa primeira abstração já implementa a interface. 
///Em seguida, é possível criar abstrações menores que vão extendendo essa 
///primeira abstração e assim reaproveitando o que for possível de suas 
///implementações do contrato. Pode haver na raíz várias abstrações do mesmo 
///nível, mas nesse caso elas vão implementando a interface, apenas classes que 
///reaproveitam componentes de outras abstrações é que vão as extendendo.