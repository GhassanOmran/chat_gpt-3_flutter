import 'dart:convert';

/// id : "cmpl-uqkvlQyYK7bGYrRHQ0eXlWi7"
/// object : "text_completion"
/// created : 1589478378
/// model : "text-davinci-003"
/// choices : [{"text":"\n\nThis is indeed a test","index":0,"logprobs":null,"finish_reason":"length"}]
/// usage : {"prompt_tokens":5,"completion_tokens":7,"total_tokens":12}

TextResponse textResponseFromJson(String str) =>
    TextResponse.fromJson(json.decode(str));

String textResponseToJson(TextResponse data) => json.encode(data.toJson());

class TextResponse {
  TextResponse({
    String? id,
    String? object,
    num? created,
    String? model,
    List<Choices>? choices,
    Usage? usage,
  }) {
    _id = id;
    _object = object;
    _created = created;
    _model = model;
    _choices = choices;
    _usage = usage;
  }

  TextResponse.fromJson(dynamic json) {
    _id = json['id'];
    _object = json['object'];
    _created = json['created'];
    _model = json['model'];
    if (json['choices'] != null) {
      _choices = [];
      json['choices'].forEach((v) {
        _choices?.add(Choices.fromJson(v));
      });
    }
    _usage = json['usage'] != null ? Usage.fromJson(json['usage']) : null;
  }

  String? _id;
  String? _object;
  num? _created;
  String? _model;
  List<Choices>? _choices;
  Usage? _usage;

  TextResponse copyWith({
    String? id,
    String? object,
    num? created,
    String? model,
    List<Choices>? choices,
    Usage? usage,
  }) =>
      TextResponse(
        id: id ?? _id,
        object: object ?? _object,
        created: created ?? _created,
        model: model ?? _model,
        choices: choices ?? _choices,
        usage: usage ?? _usage,
      );

  String? get id => _id;

  String? get object => _object;

  num? get created => _created;

  String? get model => _model;

  List<Choices>? get choices => _choices;

  Usage? get usage => _usage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['object'] = _object;
    map['created'] = _created;
    map['model'] = _model;
    if (_choices != null) {
      map['choices'] = _choices?.map((v) => v.toJson()).toList();
    }
    if (_usage != null) {
      map['usage'] = _usage?.toJson();
    }
    return map;
  }
}

/// prompt_tokens : 5
/// completion_tokens : 7
/// total_tokens : 12

Usage usageFromJson(String str) => Usage.fromJson(json.decode(str));

String usageToJson(Usage data) => json.encode(data.toJson());

class Usage {
  Usage({
    num? promptTokens,
    num? completionTokens,
    num? totalTokens,
  }) {
    _promptTokens = promptTokens;
    _completionTokens = completionTokens;
    _totalTokens = totalTokens;
  }

  Usage.fromJson(dynamic json) {
    _promptTokens = json['prompt_tokens'];
    _completionTokens = json['completion_tokens'];
    _totalTokens = json['total_tokens'];
  }

  num? _promptTokens;
  num? _completionTokens;
  num? _totalTokens;

  Usage copyWith({
    num? promptTokens,
    num? completionTokens,
    num? totalTokens,
  }) =>
      Usage(
        promptTokens: promptTokens ?? _promptTokens,
        completionTokens: completionTokens ?? _completionTokens,
        totalTokens: totalTokens ?? _totalTokens,
      );

  num? get promptTokens => _promptTokens;

  num? get completionTokens => _completionTokens;

  num? get totalTokens => _totalTokens;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['prompt_tokens'] = _promptTokens;
    map['completion_tokens'] = _completionTokens;
    map['total_tokens'] = _totalTokens;
    return map;
  }
}

/// text : "\n\nThis is indeed a test"
/// index : 0
/// logprobs : null
/// finish_reason : "length"

Choices choicesFromJson(String str) => Choices.fromJson(json.decode(str));

String choicesToJson(Choices data) => json.encode(data.toJson());

class Choices {
  Choices({
    String? text,
    num? index,
    dynamic logprobs,
    String? finishReason,
  }) {
    _text = text;
    _index = index;
    _logprobs = logprobs;
    _finishReason = finishReason;
  }

  Choices.fromJson(dynamic json) {
    _text = json['text'];
    _index = json['index'];
    _logprobs = json['logprobs'];
    _finishReason = json['finish_reason'];
  }

  String? _text;
  num? _index;
  dynamic _logprobs;
  String? _finishReason;

  Choices copyWith({
    String? text,
    num? index,
    dynamic logprobs,
    String? finishReason,
  }) =>
      Choices(
        text: text ?? _text,
        index: index ?? _index,
        logprobs: logprobs ?? _logprobs,
        finishReason: finishReason ?? _finishReason,
      );

  String? get text => _text;

  num? get index => _index;

  dynamic get logprobs => _logprobs;

  String? get finishReason => _finishReason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['index'] = _index;
    map['logprobs'] = _logprobs;
    map['finish_reason'] = _finishReason;
    return map;
  }
}
