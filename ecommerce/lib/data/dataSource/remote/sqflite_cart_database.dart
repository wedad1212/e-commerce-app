// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce/core/model/cart_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/constant/const_name_data.dart';

class DatabaseCart {
  DatabaseCart._();

  static final DatabaseCart db = DatabaseCart._();

  Database? _database;

  Future<List<CartModel>> getAllProductCart(CartModel cartModel) async {
    final dbClient = await database;

    List<Map> maps = await dbClient.query(tableCart);
    List<CartModel> list = maps.isNotEmpty
        ? maps.map((product) => cartModel.formJson(product)).toList()
        : [];
    return list;
  }

  insert(CartModel cartModel) async {
    final dbClient = await database;
    await dbClient.insert(tableCart, cartModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartModel cartModel) async {
    final dbClient = await database;
    return await dbClient.update(tableCart, cartModel.toJson(),
        where:'productId = ?', whereArgs: [cartModel.productId]);
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await init();
    return _database!;
  }
}

init() async {
  final path = join(await getDatabasesPath(), "tableCart.db");
  return await openDatabase(path, version: 1, onCreate: (db, version) async {
    await db.execute('''
CREATE TABLE $tableCart (
name TEXT NOT NULL,
image TEXT NOT NULL,
price TEXT NOT NULL,
quantity INTEGER NOT NULL,
productId TEXT NOT NULL)
''');
  });
}
