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
      appBar: AppBar(
        title: Text("My Reading List"),
        backgroundColor: Colors.black,
      ),
      body: StreamBuilder<dynamic>(
        //bir veri alır - aldığı veriyi başka bir widget a verir.
        stream: ReadingListBloc().getStream,
        initialData: cartBloc.getAll(),
        builder: (context, AsyncSnapshot snapshot) {
          return list(snapshot);
        },
      ),
    );
  }

  list(AsyncSnapshot snapshot) {

    List<ReadingList> readingList = snapshot.data;
    return ReorderableListView(
      children: <Widget>[
        for (int index = 0; index < readingList.length; index += 1)
          ListTile(
            key: Key('$index'),
            leading: Image.network(readingList.elementAt(index).book!.image!),
            subtitle: Text(readingList.elementAt(index).book!.author!),
            tileColor: index % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
            title: Text(readingList.elementAt(index).book!.title!),
            trailing: IconButton(
              icon: Icon(Icons.highlight_remove_outlined, color: Colors.black),
              onPressed: () {
                ReadingListBloc()
                    .removeToReadingList(readingList.elementAt(index));
                setState(() {});
              },
            ),
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          ReadingList item = readingList.removeAt(oldIndex);
          readingList.insert(newIndex, item);
        });
      },
    );
  }
}
