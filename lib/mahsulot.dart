import 'package:hive/hive.dart';

part 'mahsulot.g.dart';

@HiveType(typeId: 0)
class Mahsulot {
  @HiveField(0)
  String nomi;
  @HiveField(1)
  int soni;

  Mahsulot(this.nomi, this.soni);
}
