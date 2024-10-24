import 'package:crafty_bay/data/models/slider_model.dart';

class SliderListModel {
  SliderListModel({
    required this.msg,
    required this.data,
  });
  late final String msg;
  late final List<SliderModel> data;

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => SliderModel.fromJson(e)).toList();
  }
}
