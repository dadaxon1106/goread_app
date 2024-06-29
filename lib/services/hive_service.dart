import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveService{
  static final _box = Hive.box('local');

  static  setUser(String name){
    _box.put('name',name);
  }
  static String getName(){
    return _box.get('name');
  }
}