import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  Book? book;
  BookDetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.book!.title} Details"),),
      body: ListView(
        children:[ Column(children: [
          Container(
            width: 400,height: 300,
            child: Image.network(book!.image!),),
          listTile("Title :",book!.title!),
          listTile("Author :",book!.author!),
          listTile("Genre :",book!.genre!),
          listTile("Description :",book!.description!),
          listTile("Publish Date :",book!.published!),
          listTile("Publisher :",book!.publisher!),
          listTile("Isbn :",book!.isbn!),
        ],),
  ]),
    );
  }

  Widget listTile(String field,String value){
    return ListTile(
      //leading: Image.network(book!.image!),
      subtitle: Text(field),
      title: Text(value),
    );
  }
}


