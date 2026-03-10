class BarcodeLocationResponseModel {
  BarcodeLocationResponseModel({
    required this.status,
    required this.formdata,
    required this.subdata,
  });
  late final bool status;
  late final Formdata formdata;
  late final Subdata subdata;

  BarcodeLocationResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    formdata = Formdata.fromJson(json['formdata']);
    subdata = Subdata.fromJson(json['subdata']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['formdata'] = formdata.toJson();
    _data['subdata'] = subdata.toJson();
    return _data;
  }
}

class Formdata {
  Formdata({
    required this.packingID,
    required this.branchCode,
    required this.barcode,
    required this.refTrID,
    required this.refSrNo,
    required this.itemCode,
    required this.bagSerialNo,
    required this.cottonType,
    required this.yarnType,
  });
  late final dynamic packingID;
  late final dynamic branchCode;
  late final String barcode;
  late final String refTrID;
  late final dynamic refSrNo;
  late final String itemCode;
  late final dynamic bagSerialNo;
  late final String cottonType;
  late final String yarnType;

  Formdata.fromJson(Map<String, dynamic> json) {
    packingID = json['packingID'];
    branchCode = json['branchCode'];
    barcode = json['barcode'];
    refTrID = json['refTrID'];
    refSrNo = json['refSrNo'];
    itemCode = json['itemCode'];
    bagSerialNo = json['bagSerialNo'];
    cottonType = json['cottonType'];
    yarnType = json['yarnType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['packingID'] = packingID;
    _data['branchCode'] = branchCode;
    _data['barcode'] = barcode;
    _data['refTrID'] = refTrID;
    _data['refSrNo'] = refSrNo;
    _data['itemCode'] = itemCode;
    _data['bagSerialNo'] = bagSerialNo;
    _data['cottonType'] = cottonType;
    _data['yarnType'] = yarnType;
    return _data;
  }
}

class Subdata {
  Subdata({
    required this.locationAutoID,
    required this.locationCode,
    required this.formType,
    required this.formNo,
    required this.srNo,
    required this.itemCode,
    required this.qty,
    required this.storeCode,
    required this.woNo,
    required this.status,
    this.parentCode,
    required this.type,
    required this.inOut,
    required this.transactionDate,
    required this.isIssued,
    required this.demandFormNo,
    required this.demandSrNo,
    this.customerPO,
    this.projectionID,
    required this.colorCode,
    this.colorName,
    this.contractFormNo,
    this.contractSrNo,
    required this.yarnBagsSerialNo,
    required this.packingID,
    required this.cottonType,
    required this.yarnType,
  });
  late final dynamic locationAutoID;
  late final String locationCode;
  late final String formType;
  late final dynamic formNo;
  late final dynamic srNo;
  late final String itemCode;
  late final double qty;
  late final dynamic storeCode;
  late final dynamic woNo;
  late final String status;
  late final Null parentCode;
  late final String type;
  late final String inOut;
  late final String transactionDate;
  late final bool isIssued;
  late final dynamic demandFormNo;
  late final dynamic demandSrNo;
  late final Null customerPO;
  late final Null projectionID;
  late final dynamic colorCode;
  late final Null colorName;
  late final Null contractFormNo;
  late final Null contractSrNo;
  late final String yarnBagsSerialNo;
  late final dynamic packingID;
  late final String cottonType;
  late final String yarnType;

  Subdata.fromJson(Map<String, dynamic> json) {
    locationAutoID = json['locationAutoID'];
    locationCode = json['locationCode'];
    formType = json['formType'];
    formNo = json['formNo'];
    srNo = json['srNo'];
    itemCode = json['itemCode'];
    qty = json['qty'];
    storeCode = json['storeCode'];
    woNo = json['woNo'];
    status = json['status'];
    parentCode = null;
    type = json['type'];
    inOut = json['inOut'];
    transactionDate = json['transactionDate'];
    isIssued = json['isIssued'];
    demandFormNo = json['demandFormNo'];
    demandSrNo = json['demandSrNo'];
    customerPO = null;
    projectionID = null;
    colorCode = json['colorCode'];
    colorName = null;
    contractFormNo = null;
    contractSrNo = null;
    yarnBagsSerialNo = json['yarnBagsSerialNo'];
    packingID = json['packingID'];
    cottonType = json['cottonType'];
    yarnType = json['yarnType'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['locationAutoID'] = locationAutoID;
    _data['locationCode'] = locationCode;
    _data['formType'] = formType;
    _data['formNo'] = formNo;
    _data['srNo'] = srNo;
    _data['itemCode'] = itemCode;
    _data['qty'] = qty;
    _data['storeCode'] = storeCode;
    _data['woNo'] = woNo;
    _data['status'] = status;
    _data['parentCode'] = parentCode;
    _data['type'] = type;
    _data['inOut'] = inOut;
    _data['transactionDate'] = transactionDate;
    _data['isIssued'] = isIssued;
    _data['demandFormNo'] = demandFormNo;
    _data['demandSrNo'] = demandSrNo;
    _data['customerPO'] = customerPO;
    _data['projectionID'] = projectionID;
    _data['colorCode'] = colorCode;
    _data['colorName'] = colorName;
    _data['contractFormNo'] = contractFormNo;
    _data['contractSrNo'] = contractSrNo;
    _data['yarnBagsSerialNo'] = yarnBagsSerialNo;
    _data['packingID'] = packingID;
    _data['cottonType'] = cottonType;
    _data['yarnType'] = yarnType;
    return _data;
  }
}
