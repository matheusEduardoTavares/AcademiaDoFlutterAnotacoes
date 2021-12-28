import 'package:flutter/material.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/models/circular_profile_model.dart';
import 'package:flutter_primeiro_projeto/pages/desafio/utils/app_size_utils.dart';

class CircularProfile extends StatelessWidget {
  const CircularProfile({ 
    required this.profile,
    Key? key,
  }) : super(key: key);

  final CircularProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppSizeUtils.circularProfileSize,
          width: AppSizeUtils.circularProfileSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.purple,
              ]
            ),
          ),
        ),
        SizedBox(
          height: AppSizeUtils.circularProfileSize,
          width: AppSizeUtils.circularProfileSize,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(profile.urlImage),
            ),
          ),
        ),
        if (profile.isLive ?? false)
          SizedBox(
            height: AppSizeUtils.circularProfileSize,
            width: AppSizeUtils.circularProfileSize,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('AO VIVO', style: TextStyle(fontSize: 12),),
                ),
              ),
            ),
          ),
      ],
    );
  }
}