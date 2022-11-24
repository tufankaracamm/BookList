import 'book.dart';
class Data {
  String? status;
  int? code;
  int? total;
  List<Book>? book;

  Data({this.status, this.code, this.total, this.book});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    total = json['total'];
    if (json['data'] != null) {
      book = <Book>[];
      json['data'].forEach((v) {
        book!.add(new Book.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['total'] = this.total;
    if (this.book != null) {
      data['data'] = this.book!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}