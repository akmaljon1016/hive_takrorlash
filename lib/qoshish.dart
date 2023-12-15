import 'package:flutter/material.dart';
import 'package:hive_takrorlash/mahsulot.dart';
import 'package:hive_takrorlash/main.dart';

class AddApp extends StatefulWidget {
  final int? index;

  const AddApp({super.key, this.index});

  @override
  State<AddApp> createState() => _AddAppState();
}

class _AddAppState extends State<AddApp> {
  TextEditingController nomitxt = TextEditingController();
  TextEditingController sonitxt = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      nomitxt = TextEditingController(
          text: mahsulotBox.getAt(widget.index!)?.nomi ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("maxsulot qo'shish"),
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              padding: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nomitxt,
                style: TextStyle(
                  fontSize: 25,
                ),
                decoration: InputDecoration(hintText: "Maxsulot nomi"),
              )),
          Container(
              padding: EdgeInsets.only(left: 5),
              height: 60,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: sonitxt,
                style: TextStyle(
                  fontSize: 25,
                ),
                decoration: InputDecoration(
                  hintText: "Maxsulot soni",
                ),
              )),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              onPressed: () {
                if (widget.index != null) {
                  int mahsulotSoni = mahsulotBox.getAt(widget.index!)?.soni ?? 0;
                  mahsulotSoni = mahsulotSoni + int.parse(sonitxt.text);
                  Mahsulot mahsulot = Mahsulot(nomitxt.text, mahsulotSoni);
                  mahsulotBox.putAt(widget.index!, mahsulot);
                } else {
                  Mahsulot mahsulot =
                      Mahsulot(nomitxt.text, int.parse(sonitxt.text));
                  mahsulotBox.add(mahsulot);
                }

                Navigator.pop(context);
              },
              child: Text(
                "Qo'shishi",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
