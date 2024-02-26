class DomainModel {
  String? context;
  String? id;
  String? type;
  int? hydraTotalItems;
  List<HydraMember>? hydraMember;

  DomainModel(
      {this.context,
        this.id,
        this.type,
        this.hydraTotalItems,
        this.hydraMember});

  DomainModel.fromJson(Map<String, dynamic> json) {
    context = json['@context'];
    id = json['@id'];
    type = json['@type'];
    hydraTotalItems = json['hydra:totalItems'];
    if (json['hydra:member'] != null) {
      hydraMember = <HydraMember>[];
      json['hydra:member'].forEach((v) {
        hydraMember!.add(new HydraMember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@context'] = this.context;
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['hydra:totalItems'] = this.hydraTotalItems;
    if (this.hydraMember != null) {
      data['hydra:member'] = this.hydraMember!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HydraMember {
  String? id;
  String? type;
  String? onlyId;
  String? domain;
  bool? isActive;
  bool? isPrivate;
  String? createdAt;
  String? updatedAt;

  HydraMember(
      {this.id,
        this.type,
        this.onlyId,
        this.domain,
        this.isActive,
        this.isPrivate,
        this.createdAt,
        this.updatedAt});

  HydraMember.fromJson(Map<String, dynamic> json) {
    id = json['@id'];
    type = json['@type'];
    onlyId = json['onlyId'];
    domain = json['domain'];
    isActive = json['isActive'];
    isPrivate = json['isPrivate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['@id'] = this.id;
    data['@type'] = this.type;
    data['onlyId'] = this.onlyId;
    data['domain'] = this.domain;
    data['isActive'] = this.isActive;
    data['isPrivate'] = this.isPrivate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
