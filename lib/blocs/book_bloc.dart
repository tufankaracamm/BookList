import 'dart:async';
import '../models/book.dart';
import '../services/book_service.dart';

class BookBloc{

  final bookStreamController=StreamController.broadcast();
  Stream get getStream=>bookStreamController.stream;

  Future<List<Book>> getAllFromApi(){
    return BookService.getAllFromApi();
  }
}

final bookBloc=BookBloc();