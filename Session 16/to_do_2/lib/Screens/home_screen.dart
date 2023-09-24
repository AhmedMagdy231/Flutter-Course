

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_2/network/local_database.dart';

import '../models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool on = false;
  List<Note> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MyDatabase.getAllDate().then((value){
      value.forEach((element) {
        Note n = Note.fromJson(element);
        notes.add(n);
      });
      notes.forEach((element) {
        print(element.title);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffEDEDF5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search note ...',
                  hintStyle: GoogleFonts.openSans(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'ALL TODOS',
                style: GoogleFonts.openSans(
                  fontSize: 30,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: ListTile(
                            title: RichText(
                              text: TextSpan(
                                text: '${notes[index].title}\n',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,

                                ),
                                children: [
                                  TextSpan(
                                    text: '${notes[index].description}',
                                    style: GoogleFonts.openSans(
                                      color: Colors.black,
                                      fontSize: 18,


                                    ),

                                  ),
                                ],
                              ),
                            ),
                            subtitle: Padding(
                              padding:  EdgeInsets.only(top: 8),
                              child: Text(
                                '${notes[index].date}',
                                style: GoogleFonts.openSans(
                                  color: Colors.grey,

                                ),
                              ),
                            ),
                            leading: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: notes[index].finish,
                                onChanged: (value){
                                  setState(() {
                                    notes[index].finish = value!;
                                  });

                                },
                                activeColor: Colors.green,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: (){
                                print('press');
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  itemCount: notes.length,
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
