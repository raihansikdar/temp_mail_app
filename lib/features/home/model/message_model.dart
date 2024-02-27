class MessageModel {
  String? context;
  String? id;
  String? type;
  int? hydraTotalItems;
  List<HydraMember>? hydraMember;

  MessageModel({
    this.context,
    this.id,
    this.type,
    this.hydraTotalItems,
    this.hydraMember,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    hydraTotalItems = json['hydra:totalItems'];
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember!.add(HydraMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@context'] = context;
    data['@id'] = id;
    data['@type'] = type;
    data['hydra:totalItems'] = hydraTotalItems;
    if (hydraMember != null) {
      data['hydra:member'] = hydraMember!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HydraMember {
  String? id;
  String? type;
  String? memberId;
  String? msgid;
  From? from;
  List<MyTo>? to;
  String? subject;
  String? intro;
  bool? seen;
  bool? isDeleted;
  bool? hasAttachments;
  int? size;
  String? downloadUrl;
  String? sourceUrl;
  String? createdAt;
  String? updatedAt;
  String? accountId;

  HydraMember({
    this.id,
    this.type,
    this.memberId,
    this.msgid,
    this.from,
    this.to,
    this.subject,
    this.intro,
    this.seen,
    this.isDeleted,
    this.hasAttachments,
    this.size,
    this.downloadUrl,
    this.sourceUrl,
    this.createdAt,
    this.updatedAt,
    this.accountId,
  });

  HydraMember.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    memberId = json['memberId'];
    msgid = json['msgid'];
    from = json['from'] != null ? From.fromJson(json['from']) : null;
    if (json['to'] != null) {
      to = <MyTo>[];
      json['to'].forEach((v) {
        to!.add(MyTo.fromJson(v));
      });
    }
    subject = json['subject'];
    intro = json['intro'];
    seen = json['seen'];
    isDeleted = json['isDeleted'];
    hasAttachments = json['hasAttachments'];
    size = json['size'];
    downloadUrl = json['downloadUrl'];
    sourceUrl = json['sourceUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['@id'] = id;
    data['@type'] = type;
    data['memberId'] = memberId;
    data['msgid'] = msgid;
    if (from != null) {
      data['from'] = from!.toJson();
    }
    if (to != null) {
      data['to'] = to!.map((v) => v.toJson()).toList();
    }
    data['subject'] = subject;
    data['intro'] = intro;
    data['seen'] = seen;
    data['isDeleted'] = isDeleted;
    data['hasAttachments'] = hasAttachments;
    data['size'] = size;
    data['downloadUrl'] = downloadUrl;
    data['sourceUrl'] = sourceUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['accountId'] = accountId;
    return data;
  }
}

class From {
  String? address;
  String? name;

  From({this.address, this.name});

  From.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}

class MyTo {
  String? address;
  String? name;

  MyTo({this.address, this.name});

  MyTo.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['name'] = name;
    return data;
  }
}
