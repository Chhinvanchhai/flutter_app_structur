import 'package:flutter_app_structure/models/models.dart';

class MyResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Users>? data;

  MyResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  MyResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(new Users.fromJson(v));
      });
    }
    // ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['page'] = this.page;
  //   data['per_page'] = this.perPage;
  //   data['total'] = this.total;
  //   data['total_pages'] = this.totalPages;
  //   if (this.data != null) {
  //     data['data'] = this.data.map((v) => v.toJson()).toList();
  //   }
  //   if (this.ad != null) {
  //     data['ad'] = this.ad.toJson();
  //   }
  //   return data;
  // }
}
