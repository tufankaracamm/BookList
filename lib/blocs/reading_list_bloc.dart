import 'dart:async';
import 'package:book_app/services/reading_list_service.dart';
import '../models/reading_list.dart';

class ReadingListBloc {
  final readingListStreamController = StreamController.broadcast();

  Stream get getStream => readingListStreamController.stream;

  void addToReadingList(ReadingList item) {
    ReadingListService.addToReadingList(item);
    readingListStreamController.sink.add(ReadingListService.getReadingList());
  }

  void removeToReadingList(ReadingList item) {
    ReadingListService.removeFromReadingList(item);
    readingListStreamController.sink.add(ReadingListService.getReadingList());
  }

  List<ReadingList> getAll() {
    return ReadingListService.getReadingList();
  }
}

final cartBloc = ReadingListBloc();
