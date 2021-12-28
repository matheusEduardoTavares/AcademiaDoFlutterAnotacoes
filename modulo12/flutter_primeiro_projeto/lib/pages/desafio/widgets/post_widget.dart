import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/models/post_model.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/utils/app_size_utils.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({ 
    required this.postData,
    required this.index,
    Key? key
  }) : super(key: key);

  final PostModel postData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 0)
          SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizeUtils.horizontalContentSpace,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(postData.userURL),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(postData.userName),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.more_horiz)
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            postData.urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizeUtils.horizontalContentSpace,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.favorite),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(Icons.message),
                      ),
                      Icon(Icons.send)
                    ],
                  ),
                  IconButton(
                    onPressed: () {}, 
                    icon: Icon(Icons.flag)
                  ),
                ],
              ),
              Row(
                children: [
                  Text('${postData.qtyLikes} curtidas', style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: postData.userName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: ' ${postData.description}',
                            style: TextStyle(fontWeight: FontWeight.normal)
                          ),
                        ]
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}