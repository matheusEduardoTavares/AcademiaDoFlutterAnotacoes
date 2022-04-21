import 'package:flutter/material.dart';
import 'package:flutter_inherited_widget_example/model/user_model.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = UserModel.of(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user.imgAvatar),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.name, style: Theme.of(context).textTheme.subtitle2,),
                Text(user.birthDate, style: Theme.of(context).textTheme.overline),
              ],
            ),
          ],
        ),
      ),
    );
  }
}