class SearchResponse {
  List<Product>? products;

  SearchResponse({this.products});

  SearchResponse.fromJson(List<dynamic> json) {
    products = json.map((item) => Product.fromJson(item)).toList();
  }
}

class Product {
  int? id;
  int? subCategory;
  String? price;
  List<ProductImage>? images;
  List<ProductColor>? colors;
  double? size;
  String? name;
  String? material;
  String? type;
  String? description;
  bool? hasOffer;
  double? offerValue;
  double? newPrice;
  double? averageRate;

  Product({
    this.id,
    this.subCategory,
    this.price,
    this.images,
    this.colors,
    this.size,
    this.name,
    this.material,
    this.type,
    this.description,
    this.hasOffer,
    this.offerValue,
    this.newPrice,
    this.averageRate,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategory = json['sub_category'];
    price = json['price'];
    if (json['images'] != null) {
      images = List<ProductImage>.from(
        json['images'].map((x) => ProductImage.fromJson(x)),
      );
    }
    if (json['colors'] != null) {
      colors = List<ProductColor>.from(
        json['colors'].map((x) => ProductColor.fromJson(x)),
      );
    }
    size = (json['size'] as num?)?.toDouble();
    name = json['name'];
    material = json['material'];
    type = json['type'];
    description = json['description'];
    hasOffer = json['has_offer'];
    offerValue = json['offer_value'];
    newPrice = json['new_price'];
    averageRate = (json['average_rate'] as num?)?.toDouble();
  }
}

class ProductImage {
  int? id;
  int? product;
  String? img;

  ProductImage({this.id, this.product, this.img});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    img = json['img'];
  }
}

class ProductColor {
  int? id;
  int? product;
  String? color;

  ProductColor({this.id, this.product, this.color});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    color = json['color'];
  }
}

