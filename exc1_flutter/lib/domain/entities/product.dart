class Product {
  String name;
  int? id;
  num price;
  Product({this.id, required this.name, required this.price}) {
    if (!validateName(name) || !validateprice(price)) {
      throw "validation error";
    }
  }
}

bool validateName(String? name) => name != null && name.isNotEmpty;
bool validateprice(num? price) => price != null && price > 0;
