import 'dart:convert';
/// created : 1589478378
/// data : [{"url":"https://..."},{"url":"https://..."}]

ImageGeneratorResponse imageGeneratorResponseFromJson(String str) => ImageGeneratorResponse.fromJson(json.decode(str));
String imageGeneratorResponseToJson(ImageGeneratorResponse data) => json.encode(data.toJson());
class ImageGeneratorResponse {
  ImageGeneratorResponse({
      num? created, 
      List<Data>? data,}){
    _created = created;
    _data = data;
}

  ImageGeneratorResponse.fromJson(dynamic json) {
    _created = json['created'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _created;
  List<Data>? _data;
ImageGeneratorResponse copyWith({  num? created,
  List<Data>? data,
}) => ImageGeneratorResponse(  created: created ?? _created,
  data: data ?? _data,
);
  num? get created => _created;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created'] = _created;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// url : "https://..."

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? url,}){
    _url = url;
}

  Data.fromJson(dynamic json) {
    _url = json['url'];
  }
  String? _url;
Data copyWith({  String? url,
}) => Data(  url: url ?? _url,
);
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    return map;
  }

}