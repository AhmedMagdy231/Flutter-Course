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
  List<Note> allNotes = [];
  List<Note> filterNotes = [];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      MyDatabase.getAllDate().then((value) {
        value.forEach((element) {
          Note n = Note.fromJson(element);
          allNotes.add(n);
        });
      });
      filterNotes = allNotes;
    });
  }

  void searchNote(String input) {
    setState(() {
      filterNotes = allNotes
          .where((element) =>
          element.title.toLowerCase().contains(input.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffEDEDF5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFirstRow(),
              SizedBox(
                height: height * 0.02,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Note...',
                  hintStyle: GoogleFonts.lato(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onChanged: searchNote,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Text(
                'ALL TODOS',
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          titleController.text = filterNotes[index].title;
                          descriptionController.text =
                              filterNotes[index].description;
                          dateController.text = filterNotes[index].date;
                          scaffoldKey.currentState!.showBottomSheet(
                                (context) =>
                                buildBottomSheet(
                                    height, width, context, float: false,
                                    id: filterNotes[index].id, index: index ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: RichText(
                              text: TextSpan(
                                text: '${filterNotes[index].title}\n',
                                style: GoogleFonts.lato(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  decoration: filterNotes[index].finish
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                                children: [
                                  TextSpan(
                                    text: '${filterNotes[index].description}',
                                    style: GoogleFonts.lato(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.only(top: height * 0.01),
                              child: Text(
                                '${filterNotes[index].date}',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            leading: Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                value: filterNotes[index].finish,
                                onChanged: (value) {
                                  setState(() {
                                    filterNotes[index].finish = value!;
                                    MyDatabase.updateRow(
                                        id: filterNotes[index].id,
                                        finish: filterNotes[index].finish);
                                  });
                                },
                                activeColor: Colors.green,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Delete ${filterNotes[index]
                                            .title} Note',
                                        style: GoogleFonts.lato(),
                                      ),
                                      content: Text(
                                        'Are you sure to delete ?',
                                        style: GoogleFonts.lato(),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('NO'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              MyDatabase.deleteRow(
                                                  id: filterNotes[index].id);
                                              allNotes.removeAt(index);
                                              filterNotes = allNotes;
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text('Yes'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 35,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: filterNotes.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scaffoldKey.currentState!.showBottomSheet((context) {
            titleController.clear();
            descriptionController.clear();
            dateController.clear();
            return buildBottomSheet(height, width, context, float: true);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  SizedBox buildBottomSheet(double height, double width, BuildContext context,
      {required bool float, int? id,int? index}) {
    return SizedBox(
      height: height * 0.6,
      width: width,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.01),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Title',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                buildTextFormField(
                    controller: titleController,
                    text: 'Input title',
                    function: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter title';
                      }
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Description',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                buildTextFormField(
                    controller: descriptionController,
                    text: 'Input description',
                    function: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter description';
                      }
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Date',
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                buildTextFormField(
                    controller: dateController,
                    text: 'Input date',
                    function: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter date';
                      }
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () async{
                      if (formKey.currentState!.validate()) {
                        float ? await MyDatabase.insertRow(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: dateController.text,
                        ).then((value) {
                          Note n = Note(
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                            id: value,
                          );
                          setState(() {
                            allNotes.add(n);
                            filterNotes = allNotes;
                          });
                          Navigator.pop(context);
                          var snackBar = SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text(
                              'Note ${n.title} Add Successfully',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.green,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }) : await MyDatabase.updateAllRow(
                            id: id!,
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController.text,
                        ).then((value) {
                          allNotes[index!].title = titleController.text;
                          allNotes[index!].description = descriptionController.text;
                          allNotes[index!].date = dateController.text;

                          setState(() {
                            filterNotes = allNotes;
                          });
                        });
                      }
                    },
                    child: Text(
                      float ? 'insert' : 'update',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField({required controller,
    required text,
    required String? Function(String?) function}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
      ),
      validator: function,
    );
  }

  Row buildFirstRow() {
    return Row(
      children: [
        Icon(
          Icons.menu,
          size: 35,
        ),
        Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg'),
        ),
      ],
    );
  }
}
