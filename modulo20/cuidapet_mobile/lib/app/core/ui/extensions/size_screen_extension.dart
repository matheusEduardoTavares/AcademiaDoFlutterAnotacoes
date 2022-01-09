import 'package:flutter_screenutil/flutter_screenutil.dart';

///Seguindo o clean code, usar essa questão de 
///abreviações não seria o ideal, porém, no 
///caso do flutter que para isso é muito verboso,
///é mais interessante fazer isso mesmo. O 
///ScreenUtil possui também extensions para isso,
///mas é interessante fazermos esse encapsulamento
///aqui para caso queiramos trocar o package que
///faz isso, no futuro
extension SizeScreenExtension on num {
  ///Largura. Aqui o tamanho que for colocado com
  ///o .w não será exatamente o mostrado, pois 
  ///ele trabalha com uma escala que depende 
  ///da resolução do device
  double get w => ScreenUtil().setWidth(this);

  ///Altura
  double get h => ScreenUtil().setHeight(this);

  ///Radius
  double get r => ScreenUtil().radius(this);
  
  ///Tamanho da fonte
  double get sp => ScreenUtil().setSp(this);
  
  ///Largura da tela. Se quisermos por exemplo 
  ///50% da tela, usamos 0.5.sw
  double get sw => ScreenUtil().screenWidth * this;

  ///Altura da tela
  double get sh => ScreenUtil().screenHeight * this;

  ///Altura da StatusBar
  double get statusBarHeight => ScreenUtil().statusBarHeight * this;
}