import 'package:book_app/models/reading_list.dart';

class ReadingListService{
  static List<ReadingList> readingList=<ReadingList>[];

  static ReadingListService _singleton=ReadingListService._internal();

  factory ReadingListService(){
    return _singleton;
  }

  ReadingListService._internal();

  static void addToReadingList(ReadingList item){
    readingList.add(item);
  }

  static void removeFromReadingList(ReadingList item){
    readingList.remove(item);
  }

  static List<ReadingList> getReadingList(){
    return readingList;
  }

}