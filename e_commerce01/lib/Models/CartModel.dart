class CartModel {
  var Id;
  var IdItems;
  var Count;
  var Price;
  var Name;
  var HomeImage;

  CartModel({
    required this.Id,
    required this.IdItems,
    required this.Count,
    required this.Price,
    required this.Name,
    required this.HomeImage,
  });

  factory CartModel.fromJson(var json) {
    return CartModel(
      Id: json['Id'],
      IdItems: json['IdItems'],
      Count: json['Count'],
      Price: json['Price'],
      Name: json['Name'],
      HomeImage: json['HomeImage'],
    );
  }
}
