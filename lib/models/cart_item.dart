// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartItem {
  String itemName;
  String itemDetail;
  String image;

 int quantity;
  double total;

  CartItem({
    required this.itemName,
    required this.itemDetail,
    required this.quantity,
    required this.total,
    required this.image
  });

 get getImage => image;

 set setImage( image) => image = image;  
 
  String get getItemName => itemName;

  set setItemName(String itemName) => itemName = itemName;

  get getItemDetail => itemDetail;

  set setItemDetail(itemDetail) => itemDetail = itemDetail;

  get getQuantity => quantity;

  set setQuantity(quantity) => quantity = quantity;

  get getTotal => total;

  set setTotal(total) => total = total;
  
}
