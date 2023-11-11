class WarrantyModel {
  int? id;
  String? receiveNo,
      receiveDate,
      receiveUrl,
      dealerCode,
      dealerName,
      dealerAddress;
  WarrantyModel({
    this.id,
    this.receiveNo,
    this.dealerAddress,
    this.dealerCode,
    this.dealerName,
    this.receiveDate,
    this.receiveUrl,
  });
}
