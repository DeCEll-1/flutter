// ignore_for_file: avoid_unnecessary_containers, invalid_use_of_protected_member, non_constant_identifier_names, library_private_types_in_public_api, duplicate_ignore, prefer_interpolation_to_compose_strings, unused_import

import 'package:flutter/material.dart';


class NotePad extends StatelessWidget {
  const NotePad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //returns main form to the build for renndering
      theme: ThemeData(
          // colorScheme: ColorScheme.dark().copyWith(primary: Colors.white)
          ),
      title: "Notepad", //title
      home: MainStatelessWidget(), //our main form
      debugShowCheckedModeBanner: false,
    );
  }
} //end of run

class MainStatelessWidget extends StatelessWidget {
  const MainStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notepad")),
      body: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
const   MainWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainWidgetState createState() =>
      _MainWidgetState(); //fgs just end chaining already
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    Helper.initStaticWidget(this);

    return Container(
        child: Center(
      child: Column(children: Helper.returnChilds()),
    ));
  }
}

class Helper {
  static TextEditingController tedMain = TextEditingController(text: "");

  static List<String> savedTexts = List.empty(growable: true);

  static _MainWidgetState? mainWidgetAsStatic;

  static AddTextToTextList() {
    mainWidgetAsStatic?.setState(() {
      if (tedMain.text != "") {
        savedTexts.add(tedMain.text + "\n");

        tedMain.text = "";
      }
    });
  }

  static void initStaticWidget(_MainWidgetState stateWidget) {
    mainWidgetAsStatic = stateWidget;
  }

  static List<Widget> returnChilds() {
    List<Widget> listToReturn = List.empty(growable: true);

    listToReturn.add(Container(
        //textbox that allows adding the things
        //in-container for padding
        margin: const EdgeInsets.only(left: 40, right: 40), //margin
        decoration: BoxDecoration(
            //i want fancy looking tb
            border: Border.all(color: Colors.blueAccent)),
        child: TextField(
          //the actualy element we want
          controller: tedMain, //assign text controller
        )));

    listToReturn.add(Container(
        child: ElevatedButton(
            onPressed: AddTextToTextList, child: Text("noteIt"))));

    String textToPutOnNotes = "";

    for (var text in savedTexts) {
      textToPutOnNotes += text;
    }

    listToReturn.add(
      Container(child: Text("Notes:\n" + textToPutOnNotes)),
    );

    return listToReturn;
  }
}
