import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/models/circular_profile_model.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/models/post_model.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/utils/app_size_utils.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/widgets/circular_profile.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/widgets/post_widget.dart';

class DesafioPage extends StatefulWidget {
  const DesafioPage({ 
    Key? key,
    this.profiles,
    this.posts,
  }) : super(key: key);

  final List<CircularProfileModel>? profiles;
  final List<PostModel>? posts;

  @override
  State<DesafioPage> createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {

  List<CircularProfileModel>? _profiles;
  List<PostModel>? _posts;
  var _bodyIndex = 0;

  @override
  void initState() {
    super.initState();

    if (kDebugMode) {
      setMocks();
    }
  }

  void setMocks() {
    _profiles = widget.profiles ?? [
      CircularProfileModel(
        urlImage: 'https://yt3.ggpht.com/ytc/AKedOLTwp9wjVbGtMh7D81SnOLY9oDjVtaH-AEtIuaRTzQ=s900-c-k-c0x00ffffff-no-rj',
      ),
      CircularProfileModel(
        urlImage: 'https://i.pinimg.com/564x/8d/da/39/8dda39d89cea777270772bb62782035c.jpg',
        isLive: true,
      ),
      CircularProfileModel(
        urlImage: 'https://thumbs.dreamstime.com/b/design-do-vetor-de-pessoa-avatar-um-masculino-pessoal-m%C3%ADdia-social-humana-e-tema-retrato-ilustra%C3%A7%C3%A3o-vetorial-165097318.jpg',
      ),
      CircularProfileModel(
        urlImage: 'https://img.myloview.com.br/adesivos/humano-homem-pessoa-avatar-perfil-do-usuario-vector-icon-ilustracao-700-80949470.jpg',
      ),
      CircularProfileModel(
        urlImage: 'https://st2.depositphotos.com/1007566/6954/v/950/depositphotos_69546837-stock-illustration-person-avatar.jpg',
      ),
    ];

    _posts = widget.posts ?? [
      PostModel(
        userName: 'NoName', 
        userURL: 'https://thumbs.dreamstime.com/z/%C3%ADcone-do-sinal-do-usu%C3%A1rio-s%C3%ADmbolo-da-pessoa-avatar-humano-84519083.jpg', 
        urlImage: 'https://terminalroot.com.br/assets/img/dev/lorem-ipsum.jpg', 
        qtyLikes: 15, 
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque nec bibendum nibh. Ut sollicitudin at libero id sollicitudin.'
      ),
      PostModel(
        userName: 'NoName 2', 
        userURL: 'https://image.freepik.com/vetores-gratis/design-de-avatar-de-pessoa_24877-38132.jpg', 
        urlImage: 'https://e3z7c6v7.rocketcdn.me/blog/wp-content/uploads/2015/03/loremipsum.jpg', 
        qtyLikes: 250320, 
        description: 'Morbi id felis orci. Suspendisse potenti. Sed rutrum sed tellus tincidunt hendrerit. Vivamus convallis dignissim mauris, eget aliquam enim efficitur eget. Quisque eget nisi ac libero interdum ullamcorper a in magna. Nam vehicula molestie mi eu porta. Proin nec mattis ex.'
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          foregroundColor: Colors.white,
        ),
        canvasColor: Colors.black,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        dividerColor: Colors.grey,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ), 
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _bodyIndex,
            onTap: (newIndex) => setState(() { _bodyIndex = newIndex; }),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage('https://yt3.ggpht.com/ytc/AKedOLTwp9wjVbGtMh7D81SnOLY9oDjVtaH-AEtIuaRTzQ=s900-c-k-c0x00ffffff-no-rj'),
                ),
                label: '',
              ),
            ],
          ),
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  child: Text('Instagram'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.add_box_outlined ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(Icons.favorite_border),
                ),
                Icon(Icons.messenger_outline ),
              ],
            ),
          ),
          body: IndexedStack(
            index: _bodyIndex,
            children: [
              Column(
                children: [
                  if (_profiles != null && _profiles!.isNotEmpty)
                    ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizeUtils.horizontalContentSpace,
                        ),
                        child: SizedBox(
                          height: AppSizeUtils.circularProfileSize,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: _profiles!.length,
                            itemBuilder: (_, index) => CircularProfile(
                              profile: _profiles![index]
                            ),
                            separatorBuilder: (_, index) => SizedBox(width: 10,),
                          ),
                        ),
                      ),
                    ],
                  if (_posts != null && _posts!.isNotEmpty)
                    ...[
                      SizedBox(height: 10,),
                      Divider(height: 2,),
                      // SizedBox(height: 10,),
                      Flexible(
                        child: ListView.separated(
                          separatorBuilder: (_, index) => Column(
                            children: [
                              Divider(),
                              SizedBox(height: 10,),
                            ],
                          ),
                          itemCount: _posts!.length,
                          itemBuilder: (_, index) => PostWidget(
                            index: index,
                            postData: _posts![index]
                          ),
                        ),
                      )
                    ]
                ],
              ),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}