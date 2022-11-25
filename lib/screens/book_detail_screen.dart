import 'package:flutter/material.dart';
import '../models/book.dart';

class BookDetailScreen extends StatelessWidget {
  Book? book;
  BookDetailScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${this.book!.title} Details"),backgroundColor: Colors.black),
      body: ListView(
        children:[ Column(children: [
          Container(
            width: 400,height: 300,
            child: Image.network(book!.image!),),
          listTile(book!.title!,"Title :"),
          listTile(book!.author!,"Author :"),
          listTile(book!.genre!,"Genre :"),
          listTile(book!.description!,"Description :"),
          listTile(book!.published!,"Publish Date :",),
          listTile(book!.publisher!,"Publisher :",),
          listTile(book!.isbn!,"Isbn :",),
        ],),
  ]),
    );
  }

  Widget listTile(String field,String value){
    return ListTile(
      //leading: Image.network(book!.image!),
      subtitle: Text(field,style: TextStyle(fontWeight: FontWeight.bold),),
      title: Text(value,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),),
    );
  }
}


