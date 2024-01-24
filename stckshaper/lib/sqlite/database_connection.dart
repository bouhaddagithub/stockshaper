import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/classes/bon_livraison_module.dart';
import '../models/classes/client_module.dart';
import '../models/classes/deposit_module.dart';
import '../models/classes/facture_module.dart';
import '../models/classes/category_module.dart';
import '../models/classes/product_fact_module.dart';
import '../models/classes/product_module.dart';
import '../models/classes/user_module.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    Directory documentdir = await getApplicationDocumentsDirectory();
    String path = join(documentdir.path, 'main.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
           CREATE TABLE IF NOT EXISTS clients (
            id INTEGER PRIMARY KEY autoincrement,
            name TEXT NOT NULL,
            address TEXT,
            phone_num TEXT,
            sold_total REAL,
            reste REAL,
            paid REAL,
            credit REAL
          );''');
        await db.execute('''
            CREATE TABLE IF NOT EXISTS deposits (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	name	TEXT NOT NULL UNIQUE
          );''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS factures (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	date	DATE NOT NULL,
                    	update_date	DATE,
                    	update_time	TIMESTAMP,
                    	solde	REAL,
                    	reste	REAL,
                    	payment	REAL,
                    	id_client	INTEGER,
                    	id_seller	INTEGER,
                    	type	TEXT
          );''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS groupes (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	name	TEXT NOT NULL
          );''');
        await db.execute('''
               CREATE TABLE IF NOT EXISTS products (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	bar_code	VARCHAR NOT NULL UNIQUE,
                    	reference	VARCHAR UNIQUE,
                    	name	VARCHAR NOT NULL,
                    	buying_price	REAL,
                    	selling_price	REAL,
                    	stock	INTEGER,
                    	photo	VARCHAR,
                    	id_groupe	INTEGER,
                    	id_deposite	INTEGER
          );''');
        await db.execute('''
             CREATE TABLE IF NOT EXISTS product_facts (
                    	id_fact	INTEGER,
                    	id_prod	INTEGER,
                    	product_price	REAL,
                    	product_qte	INTEGER,
                    	tva	REAL,
                    	PRIMARY KEY("id_fact","id_prod")
          );''');
        await db.execute('''
             CREATE TABLE IF NOT EXISTS bon_de_livraisons (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	date	DATE NOT NULL,
                    	old_reste	REAL,
                    	reste	REAL,
                    	payment	REAL,
                    	id_client	INTEGER,
                    	id_user	INTEGER
          );''');
        await db.execute('''
            CREATE TABLE IF NOT EXISTS users (
                    	id	INTEGER PRIMARY KEY autoincrement,
                    	username	TEXT NOT NULL,
                    	password	TEXT NOT NULL,
                    	l	INTEGER NOT NULL
          );''');
      },
    );
  }

// 2 choices either creating a services folder with each table has its own service folder or let them be here in databasehelper file.

  // CLIENT

  Future<void> insertClient(Client client) async {
    final Database db = await database;
    await db.insert('clients', client.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Client>> getClients() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('clients');

    return List.generate(maps.length, (i) {
      return Client.fromMap(maps[i]);
    });
  }

  // DEPOSIT

  Future<void> insertDeposit(Deposit deposit) async {
    final Database db = await database;
    await db.insert('deposits', deposit.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Deposit>> getDeposits() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('deposits');

    return List.generate(maps.length, (i) {
      return Deposit.fromMap(maps[i]);
    });
  }

  // FACTURES

  Future<void> insertFacture(Facture facture) async {
    final Database db = await database;
    await db.insert('factures', facture.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Facture>> getFactures() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('factures');

    return List.generate(maps.length, (i) {
      return Facture.fromMap(maps[i]);
    });
  }

  // GROUPS

  Future<void> insertGroupe(Category category) async {
    final Database db = await database;
    await db.insert('groupes', category.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Category>> getGroupes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('groupes');

    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  // PRODUCT

  Future<void> insertProduct(Product product) async {
    final Database db = await database;
    await db.insert(
      'products',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  //PRODUCTFACTS

  Future<void> insertProductFact(ProductFact productFact) async {
    final Database db = await database;
    await db.insert('product_facts', productFact.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ProductFact>> getProductFacts(int idFact) async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'product_facts',
      where: 'id_fact = ?',
      whereArgs: [idFact],
    );

    return List.generate(maps.length, (i) {
      return ProductFact.fromMap(maps[i]);
    });
  }

  // BONLIVRAISON

  Future<void> insertBonLivraison(BonLivraison bonLivraison) async {
    final Database db = await database;
    await db.insert('bon_de_livraisons', bonLivraison.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<BonLivraison>> getBonLivraisons() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('bon_de_livraisons');

    return List.generate(maps.length, (i) {
      return BonLivraison.fromMap(maps[i]);
    });
  }

  //USER

  Future<void> insertUser(User user) async {
    final Database db = await database;
    await db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  // delete functions

  // CLIENT
  Future<void> deleteClient(int id) async {
    final Database db = await database;
    await db.delete('clients', where: 'id = ?', whereArgs: [id]);
  }

// DEPOSIT
  Future<void> deleteDeposit(int id) async {
    final Database db = await database;
    await db.delete('deposits', where: 'id = ?', whereArgs: [id]);
  }

// FACTURES
  Future<void> deleteFacture(int id) async {
    final Database db = await database;
    await db.delete('factures', where: 'id = ?', whereArgs: [id]);
  }

// GROUPS
  Future<void> deleteGroupe(int id) async {
    final Database db = await database;
    await db.delete('groupes', where: 'id = ?', whereArgs: [id]);
  }

// PRODUCT
  Future<void> deleteProduct(int id) async {
    final Database db = await database;
    await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

// PRODUCTFACTS
  Future<void> deleteProductFact(int idFact, int idProd) async {
    final Database db = await database;
    await db.delete(
      'product_facts',
      where: 'id_fact = ? AND id_prod = ?',
      whereArgs: [idFact, idProd],
    );
  }

// BONLIVRAISON
  Future<void> deleteBonLivraison(int id) async {
    final Database db = await database;
    await db.delete('bon_de_livraisons', where: 'id = ?', whereArgs: [id]);
  }

// USER
  Future<void> deleteUser(int id) async {
    final Database db = await database;
    await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

// update functions

// CLIENT
  Future<void> updateClient(Client client) async {
    final Database db = await database;
    await db.update('clients', client.toMap(),
        where: 'id = ?', whereArgs: [client.id]);
  }

// DEPOSIT
  Future<void> updateDeposit(Deposit deposit) async {
    final Database db = await database;
    await db.update('deposits', deposit.toMap(),
        where: 'id = ?', whereArgs: [deposit.id]);
  }

// FACTURES
  Future<void> updateFacture(Facture facture) async {
    final Database db = await database;
    await db.update('factures', facture.toMap(),
        where: 'id = ?', whereArgs: [facture.id]);
  }

// GROUPS
  Future<void> updateGroupe(Category category) async {
    final Database db = await database;
    await db.update('groupes', category.toMap(),
        where: 'id = ?', whereArgs: [category.id]);
  }

// PRODUCT
  Future<void> updateProduct(Product product) async {
    final Database db = await database;
    await db.update('products', product.toMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }

// PRODUCTFACTS
  Future<void> updateProductFact(ProductFact productFact) async {
    final Database db = await database;
    await db.update('product_facts', productFact.toMap(),
        where: 'id_fact = ? AND id_prod = ?',
        whereArgs: [productFact.idFact, productFact.idProduct]);
  }

// BONLIVRAISON
  Future<void> updateBonLivraison(BonLivraison bonLivraison) async {
    final Database db = await database;
    await db.update('bon_de_livraisons', bonLivraison.toMap(),
        where: 'id = ?', whereArgs: [bonLivraison.id]);
  }

// USER
  Future<void> updateUser(User user) async {
    final Database db = await database;
    await db
        .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }
}
