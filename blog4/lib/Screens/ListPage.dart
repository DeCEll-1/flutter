// ignore_for_file: prefer_const_constructors, prefer_const_declarations, unnecessary_null_comparison, unnecessary_nullable_for_final_variable_declarations, dead_code, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_print, unused_local_variable

import 'package:blog4/Misc/Statics.dart';
import 'package:blog4/Services/DataAccessLayer.dart';
import 'package:blog4/Services/Models/AracModel.dart';
import 'package:blog4/Widgets/ListRow.dart';
import 'package:blog4/Widgets/Navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    double lrPadding = 30;
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width,
          ),
          child: IntrinsicHeight(
            child: Wrap(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(lrPadding, 20, lrPadding, 0),
                  child: getValueList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getValueList() {
    return FutureBuilder(
      future: DataAccessLayer().getAraclar(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }
        if (snapshot.data == null) return Text("2hou");
        List<Arac> araclar = snapshot.data!;

        return Container(
          child: Row(
            // a dirty trick to make the DataTable fit width
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columns: getTableHeaders(),
                    rows: getTableRows(araclar),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Decoration tableDecoration = BoxDecoration(
  border: Border.all(color: Colors.black, width: 1),
  borderRadius: BorderRadius.all(Radius.circular(3)),
);

Decoration tableDecorationAlt = BoxDecoration(
  border: Border.all(color: Colors.black, width: 1),
  borderRadius: BorderRadius.all(Radius.circular(3)),
  color: Colors.amber.shade100,
);

Container tableItemStyle = Container(
  padding: EdgeInsets.all(5),
);

Container tableItemStyleAlt = Container(
  padding: EdgeInsets.all(5),
);

List<DataColumn> getTableHeaders() {
  return [
    DataColumn(label: Expanded(child: combineContainers(tableItemStyle, Center(child: Text("Plaka"))))),
    DataColumn(label: Expanded(child: combineContainers(tableItemStyle, Center(child: Text("Seçenekler"))))),
  ];
}

List<DataRow> getTableRows(List<Arac> araclar) {
  List<DataRow> tableRows = [];

  for (var i = 0; i < araclar.length; i++) {
    Arac arac = araclar[i];
    tableRows.add(
      DataRow(
        cells: [
          DataCell(combineContainers((i % 2 == 1) ? tableItemStyle : tableItemStyleAlt, Center(child: Text(arac.plaka)))),
          DataCell(combineContainers((i % 2 == 1) ? tableItemStyle : tableItemStyleAlt, getOptions())),
        ],
        onLongPress: () {
          Statics.topPage!.pageUpdateAracDetay(arac);
        },
      ),
    );
  }
  return tableRows;
}

combineContainers(Container container, Widget child) {
  return Center(
    child: Container(
      alignment: container.alignment,
      clipBehavior: container.clipBehavior,
      color: container.color,
      constraints: container.constraints,
      decoration: container.decoration,
      foregroundDecoration: container.foregroundDecoration,
      margin: container.margin,
      padding: container.padding,
      transform: container.transform,
      transformAlignment: container.transformAlignment,
      child: child,
    ),
  );
}

getOptions() {
  TextStyle textStyle = TextStyle(fontSize: 12);

  Size buttonSize = Size(80, 30);

  ButtonStyle buttonStyle = ButtonStyle(
    maximumSize: MaterialStateProperty.all(buttonSize),
    minimumSize: MaterialStateProperty.all(buttonSize),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
  );

  return Container(
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("1"),
          Text("2"),
        ],
      ),
    ),
  );
}
