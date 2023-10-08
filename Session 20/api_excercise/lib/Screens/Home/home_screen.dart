

import 'package:api_excercise/Constants/colors.dart';
import 'package:api_excercise/Cubits/app_cubit.dart';
import 'package:api_excercise/Screens/Details/details.dart';
import 'package:api_excercise/shared/widget/CircleAvtar/circleAvtar.dart';
import 'package:api_excercise/shared/widget/Text/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.red,
        title: Text('People you know'),
      ),
      body: cubit.users.length == 0?
      Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ) :
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: width*0.5,
              childAspectRatio: 3/4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context,index){
              return buildCard(cubit, index,context);
            },
            itemCount: 10,
        ),
      ),
    );
  },
);
  }

  Widget buildCard(AppCubit cubit, int index,context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_)=> DetailsScreen(
            user: cubit.users[index],
          ),)
        );
      },
      child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Hero(
                      tag: cubit.users[index].id,
                      child: BuildCircleAvtar(
                          radius: 50,
                          image:  cubit.users[index].avatar,
                          color: AppColor.red
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BuildText(
                      text: '${cubit.users[index].first_name} ${cubit.users[index].last_name}',
                      color: Colors.black,
                      size: 18,
                      isBold:  true,
                    ),
                    BuildText(
                      text: '@${cubit.users[index].username}',
                      color: Colors.blueGrey,
                      size: 15,

                    ),
                    SizedBox(
                      height: 10,
                    ),

                   cubit.users[index].following?
                   OutlinedButton (
                        onPressed: (){
                          cubit.changeFollowing(index: index);
                        },
                        child: BuildText(
                          text: 'Following',
                          color: Colors.black,
                          size: 15,
                          isBold: true,
                        ) ,

                    ):
                    MaterialButton(
                      color: Colors.red[400],
                        onPressed: (){
                          cubit.changeFollowing(index: index);

                        },
                        child: BuildText(
                          text: 'Follow',
                          color: Colors.white,
                          size: 15,
                          isBold: true,

                        ),
                    ),
                  ],
                ),
              ),
    );
  }


}
