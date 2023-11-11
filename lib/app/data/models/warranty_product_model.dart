class WarrantyProductModel {
  int? id, amount;
  String? type, brand, detail, imagePath;
  WarrantyProductModel({
    this.id,
    this.type,
    this.brand,
    this.detail,
    this.amount = 0,
    this.imagePath,
  });
}
