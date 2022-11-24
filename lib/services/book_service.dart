import 'dart:convert';

import 'package:book_app/models/book.dart';
import 'package:book_app/models/data.dart';
import 'package:http/http.dart' as http;

class BookService{
  static List<Book> books=<Book>[];

  static BookService _singleton=BookService._internal();

  factory BookService(){return _singleton;}

  BookService._internal();


  static Future<List<Book>> getAllFromApi() async{
    var response=await http.get(Uri.parse("https://fakerapi.it/api/v1/books?_quantity=10"));
    var result=(json.decode(response.body)["data"] as List).map((e) => Book.fromJson(e)).toList();
     books.addAll(result);
    return books;
  }

}