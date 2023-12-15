import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_takrorlash/mahsulot.dart';
import 'package:hive_takrorlash/qoshish.dart';

late Box<Mahsulot> mahsulotBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MahsulotAdapter());
  mahsulotBox = await Hive.openBox("mahsulot");
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maxsulotlar"),
      ),
      body: ListView.builder(
          itemCount: mahsulotBox.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AddApp(
                              index: index,
                            ))).then((value) {
                  setState(() {});
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    )),
                child: Column(
                  children: [
                    Text(
                      "Nomi : ${mahsulotBox.getAt(index)?.nomi ?? ""}",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Soni : ${mahsulotBox.getAt(index)?.soni ?? ""}",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          mahsulotBox.deleteAt(index);
                        });
                      },
                      child: Icon(Icons.remove_circle, size: 20),
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => AddApp()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
