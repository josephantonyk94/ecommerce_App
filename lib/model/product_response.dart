import 'dart:convert';

ProductResponse productResponseFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productResponseToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
  ProductResponse({
    this.data,
    this.links,
    this.meta,
    this.status,
    this.code,
    this.error,
  });

  List<Product> data;
  Links links;
  Meta meta;
  bool status;
  int code;
  dynamic error;

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
    data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
    status: json["status"],
    code: json["code"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
    "status": status,
    "code": code,
    "error": error,
  };
}

class Product {
  Product({
    this.id,
    this.name,
    this.images,
    this.created,
    this.brand,
    this.brandType,
    this.category,
    this.stock,
    this.variants,
  });

  int id;
  String name;
  List<dynamic> images;
  DateTime created;
  Brand brand;
  Brand brandType;
  Brand category;
  List<dynamic> stock;
  List<Variant> variants;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    created: DateTime.parse(json["created"]),
    brand: Brand.fromJson(json["brand"]),
    brandType: Brand.fromJson(json["brand_type"]),
    category: Brand.fromJson(json["category"]),
    stock: List<dynamic>.from(json["stock"].map((x) => x)),
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x)),
    "created": created.toIso8601String(),
    "brand": brand.toJson(),
    "brand_type": brandType.toJson(),
    "category": category.toJson(),
    "stock": List<dynamic>.from(stock.map((x) => x)),
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    this.id,
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    name: json["name"],
    slug: json["slug"] == null ? null : json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug == null ? null : slug,
  };
}

class Variant {
  Variant({
    this.id,
    this.sku,
    this.images,
    this.wholesalePrice,
    this.retailPrice,
    this.attributes,
    this.alert,
    this.createdAt,
  });

  int id;
  String sku;
  List<dynamic> images;
  int wholesalePrice;
  int retailPrice;
  List<Attribute> attributes;
  int alert;
  DateTime createdAt;

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    sku: json["sku"],
    images: List<dynamic>.from(json["images"].map((x) => x)),
    wholesalePrice: json["wholesale_price"],
    retailPrice: json["retail_price"],
    attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
    alert: json["alert"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "images": List<dynamic>.from(images.map((x) => x)),
    "wholesale_price": wholesalePrice,
    "retail_price": retailPrice,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "alert": alert,
    "created_at": createdAt.toIso8601String(),
  };
}

class Attribute {
  Attribute({
    this.valueId,
    this.attributeId,
    this.value,
    this.slug,
    this.attribute,
  });

  int valueId;
  int attributeId;
  String value;
  dynamic slug;
  Brand attribute;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
    valueId: json["value_id"],
    attributeId: json["attribute_id"],
    value: json["value"],
    slug: json["slug"],
    attribute: Brand.fromJson(json["attribute"]),
  );

  Map<String, dynamic> toJson() => {
    "value_id": valueId,
    "attribute_id": attributeId,
    "value": value,
    "slug": slug,
    "attribute": attribute.toJson(),
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String first;
  String last;
  String prev;
  String next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
