import 'package:book_app/models/reading_list.dart';
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'package:book_app/blocs/book_bloc.dart';
import 'package:book_app/blocs/reading_list_bloc.dart';
import 'book_detail_screen.dart';

class BookListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book List"),
        actions: [
          IconButton(onPressed: ()=>Navigator.pushNamed(context, "reading-list"), icon: Icon(Icons.bookmark_add_outlined))
        ],),
      body:buildProductListGridView(),
    );
  }

  buildProductListGridView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
        stream: bookBloc.getStream,
        initialData: bookBloc.getAllFromApi(),
        builder: (context, AsyncSnapshot snapshot) {
          return FutureBuilder<List<Book>>(
            future: bookBloc.getAllFromApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 5,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var book = snapshot.data![index];
                      return SizedBox(
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 250,
                                    child: Image.network(
                                      book.image!, fit: BoxFit.contain,)),
                                Text(book.author!, style: TextStyle(
                                    fontStyle: FontStyle.italic),),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(book.title!, style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${book.genre}",
                                          textAlign: TextAlign.center),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2.0,
                                            color: Colors.orange.shade900),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(book.published.toString()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.orange)),
                                      onPressed: () {
                                        ReadingListBloc().addToReadingList(
                                            new ReadingList(book));
                                      },
                                      child: Icon(
                                        Icons.add_task, color: Colors.black,),),
                                    ElevatedButton(
                                      style: ButtonStyle
                                        (backgroundColor: MaterialStateProperty
                                          .all(Colors.black)),
                                      onPressed: () {
                                        Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BookDetailScreen(book)),);
                                      },
                                      child: Text("Details"),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
              else {
                return Center(child: CircularProgressIndicator(),);
              }
            },
          );
        },
      ),
    );
  }
}