import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/classes/bonlivraisonmodul.dart';
import '../models/classes/clientmodul.dart';
import '../models/classes/depositmodul.dart';
import '../models/classes/facturesmodul.dart';
import '../models/classes/groupsmodul.dart';
import '../models/classes/productfactmodul.dart';
import '../models/classes/productmodul.dart';
import '../models/classes/usermodul.dart';

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
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            adresse TEXT,
            phone_num TEXT,
            sold_total REAL,
            reste REAL,
            paid REAL,
            credit REAL
          );''');
        await db.execute('''
            CREATE TABLE IF NOT EXISTS "deposits" (
                    	"id"	INTEGER,
                    	"name"	TEXT NOT NULL UNIQUE,
                    	PRIMARY KEY("id")
          );''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS "factures" (
                    	"id"	INTEGER,
                    	"date"	DATE NOT NULL,
                    	"update_date"	DATE,
                    	"update_time"	TIMESTAMP,
                    	"solde"	REAL,
                    	"reste"	REAL,
                    	"payment"	REAL,
                    	"id_client"	INTEGER,
                    	"id_seller"	INTEGER,
                    	"type"	TEXT,
                    	PRIMARY KEY("id")
          );''');
        await db.execute('''
           CREATE TABLE IF NOT EXISTS "groupes" (
                    	"id"	INTEGER,
                    	"name"	TEXT NOT NULL,
                    	PRIMARY KEY("id")
          );''');
        await db.execute('''
               CREATE TABLE IF NOT EXISTS "products" (
                    	"id"	INTEGER UNIQUE,
                    	"bar_code"	VARCHAR NOT NULL UNIQUE,
                    	"reference"	VARCHAR UNIQUE,
                    	"name"	VARCHAR NOT NULL,
                    	"buying_price"	REAL,
                    	"selling_price"	REAL,
                    	"stock"	INTEGER,
                    	"photo"	VARCHAR,
                    	"id_groupe"	INTEGER,
                    	"id_deposite"	INTEGER,
                    	PRIMARY KEY("id")
          );''');
        await db.execute('''
             CREATE TABLE IF NOT EXISTS "product_facts" (
                    	"id_fact"	INTEGER,
                    	"id_prod"	INTEGER,
                    	"product_price"	REAL,
                    	"product_qte"	INTEGER,
                    	"tva"	REAL,
                    	PRIMARY KEY("id_fact","id_prod")
          );''');
        await db.execute('''
             CREATE TABLE IF NOT EXISTS "bon_de_livraisons" (
                    	"id"	INTEGER,
                    	"date"	DATE NOT NULL,
                    	"old_reste"	REAL,
                    	"reste"	REAL,
                    	"payment"	REAL,
                    	"id_client"	INTEGER,
                    	"id_user"	INTEGER,
                    	PRIMARY KEY("id")
          );''');
        await db.execute('''
            CREATE TABLE IF NOT EXISTS "users" (
                    	"id"	INTEGER,
                    	"username"	TEXT NOT NULL,
                    	"password"	TEXT NOT NULL,
                    	"l"	INTEGER NOT NULL,
                    	PRIMARY KEY("id")
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

  Future<void> insertGroupe(Groupe groupe) async {
    final Database db = await database;
    await db.insert('groupes', groupe.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Groupe>> getGroupes() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('groupes');

    return List.generate(maps.length, (i) {
      return Groupe.fromMap(maps[i]);
    });
  }

  // PRODUCT

  Future<void> insertProduct(Product product) async {
    final Database db = await database;
    await db.insert('products', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
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
}
