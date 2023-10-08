import 'package:api_excercise/Constants/colors.dart';
import 'package:api_excercise/shared/widget/CircleAvtar/circleAvtar.dart';
import 'package:api_excercise/shared/widget/Text/text.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class DetailsScreen extends StatelessWidget {
  late User user;

  DetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: AppColor.red,
        title: BuildText(
          text: 'Details',
          color: Colors.white,
          size: 20,
          isBold: true,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
          child: Column(
            children: [
              Hero(
                tag: user.id,
                child: BuildCircleAvtar(
                  radius: 100,
                  image: user.avatar,
                  color: AppColor.red,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BuildText(
                  text: '${user.first_name} ${user.last_name}',
                  color: Colors.black,
                  size: 25,
                  isBold: true,
              ),
              SizedBox(
                height: 5,
              ),
              BuildText(
                text: '@${user.username}',
                color: Colors.blueGrey,
                size: 20,

              ),
              SizedBox(
                height: 20,
              ),


              buildListTile(icon: Icons.baby_changing_station,text: user.date_of_birth),
              buildListTile(icon: Icons.phone,text: user.phone_number),
              buildListTile(icon: Icons.home,text: '${user.address.city} ${user.address.street_name}'),

            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile({
    required IconData icon,
    required String text,
}) {
    return ListTile(
              leading: Icon(icon),
              title: BuildText(
                text: text,
                color: Colors.black,
                size: 15,
              ),
            );
  }
}
