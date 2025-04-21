class CartProductsResponse {
  List<CartProductItem>? products;

  CartProductsResponse({this.products});

  CartProductsResponse.fromJson(List<dynamic> json) {
    products = json.map((item) => CartProductItem.fromJson(item)).toList();
  }
}
class Product {
  int? id;
  int? subCategory;
  String? price;
  List<Images>? images;
  String? name;
  String? description;
  bool? hasOffer;
  int? quantity;

  Product({
    this.id,
    this.subCategory,
    this.price,
    this.images,
    this.name,
    this.description,
    this.hasOffer,
    this.quantity,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategory = json['sub_category'];
    price = json['price'];
    if (json['images'] != null) {
      images = List<Images>.from(json['images'].map((v) => Images.fromJson(v)));
    }
    name = json['name'];
    description = json['description'];
    hasOffer = json['has_offer'];
    quantity = json['quantity'];
  }
}

class Images {
  int? id;
  int? product;
  String? img;

  Images({this.id, this.product, this.img});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    img = json['img'];
  }
}


class CartProductItem {
  int? id;
  String? color;
  Product? product;

  CartProductItem({this.id, this.color, this.product});

  CartProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}
