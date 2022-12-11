
class DebtModel {
  String? imageUrl;
  String? percent;
  String? sumOne;
  String? url;

  DebtModel({this.imageUrl, this.percent, this.sumOne, this.url});

  DebtModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    percent = json['percent'];
    sumOne = json['sum_one'];
    url = json['url'];
  }
}
