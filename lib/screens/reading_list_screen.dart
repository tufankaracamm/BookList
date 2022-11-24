import 'package:book_app/models/reading_list.dart';
import 'package:flutter/material.dart';
import 'package:book_app/blocs/reading_list_bloc.dart';

class ReadingListScreen extends StatefulWidget {
  const ReadingListScreen({Key? key}) : super(key: key);

  @override
  State<ReadingListScreen> createState() => _ReadingListScreenState();
}

class _ReadingListScreenState extends State<ReadingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Reading List"),),
      body: StreamBuilder<dynamic>(
        stream: ReadingListBloc().getStream,
        initialData: cartBloc.getAll(),
        builder: (context,AsyncSnapshot snapshot){
          return buildReadingList(snapshot);
        },
      ),
    );
  }

  buildReadingList(AsyncSnapshot snapshot){
    var readingList=snapshot.data;
    return ListView.builder(
        itemCount: readingList.length,
        itemBuilder: (context,index){
          var readingListItem=readingList[index];
          return ListTile(
            leading: CircleAvatar(child: Text(index.toString())),
            title: Text(readingListItem.title),
            subtitle: Text(readingListItem.author),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart,color: Colors.red),
              onPressed: (){
                ReadingListBloc().removeToReadingList(readingListItem);
              },
            ),
          );
        });
  }
}