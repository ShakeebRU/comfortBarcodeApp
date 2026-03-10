class OgpDetailListResponseModel {
  OgpDetailListResponseModel({required this.status, required this.listdata});
  late final bool status;
  late final List<OgpDetailModel> listdata;

  OgpDetailListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    listdata = List.from(
      json['listdata'],
    ).map((e) => OgpDetailModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['listdata'] = listdata.map((e) => e.toJson()).toList();
    return _data;
  }
}

class OgpDetailModel {
  OgpDetailModel({
    required this.branchCode,
    required this.formNo,
    required this.itemCode,
    required this.srNo,
    required this.unitCode,
    required this.qty,
    required this.woNumber,
    required this.purposeID,
    this.grnNo,
    this.remarks,
    required this.isAddedToGRN,
    this.grnSrNo,
    required this.locationID,
    required this.locationQty,
    required this.locationName,
    this.retentionDate,
    this.departmentName,
    required this.fKIssuanceID,
    this.lotNumber,
    this.yarnDemandType,
    required this.yarnID,
    this.purpose,
    required this.bags,
    this.noOfCones,
    required this.coneWeight,
    required this.coneTareWeight,
    required this.bagTareWeight,
    required this.grossWeight,
    required this.packingWeight,
    required this.lossWeight,
    required this.netWeight,
    required this.actualWeight,
    this.cflLotNo,
    this.yarnLotRef,
    this.productionDate,
    this.paperTip,
    this.computerName,
    required this.ppCRecordLine,
    required this.masterLocationID,
    this.assetCode,
    this.storeCode,
    this.demandFormNo,
    this.demandSrNo,
    this.demandQty,
    this.planQty,
    required this.colorCode,
    this.colorName,
    this.reprocessID,
    required this.contractFormNo,
    required this.contractSrNo,
    required this.yarnDemandFormNo,
    required this.yarnDemandSrNo,
    this.yarnDyeingContractNo,
    this.yarnDyeingContractSrNo,
    this.yarnTwistContractNo,
    this.yarnTwistContractSrNo,
    this.cottonType,
    this.yarnType,
  });
  late final dynamic branchCode;
  late final dynamic formNo;
  late final String itemCode;
  late final dynamic srNo;
  late final dynamic unitCode;
  late final dynamic? qty;
  late final dynamic woNumber;
  late final String purposeID;
  late final Null grnNo;
  late final Null remarks;
  late final bool isAddedToGRN;
  late final Null grnSrNo;
  late final String locationID;
  late final String locationQty;
  late final String locationName;
  late final Null retentionDate;
  late final Null departmentName;
  late final dynamic fKIssuanceID;
  late final Null lotNumber;
  late final Null yarnDemandType;
  late final dynamic yarnID;
  late final Null purpose;
  late final dynamic? bags;
  late final Null noOfCones;
  late final dynamic coneWeight;
  late final dynamic coneTareWeight;
  late final dynamic bagTareWeight;
  late final dynamic grossWeight;
  late final dynamic packingWeight;
  late final dynamic lossWeight;
  late final dynamic netWeight;
  late final dynamic actualWeight;
  late final Null cflLotNo;
  late final Null yarnLotRef;
  late final Null productionDate;
  late final Null paperTip;
  late final Null computerName;
  late final dynamic ppCRecordLine;
  late final String masterLocationID;
  late final Null assetCode;
  late final Null storeCode;
  late final Null demandFormNo;
  late final Null demandSrNo;
  late final Null demandQty;
  late final Null planQty;
  late final dynamic colorCode;
  late final Null colorName;
  late final Null reprocessID;
  late final dynamic contractFormNo;
  late final dynamic contractSrNo;
  late final dynamic yarnDemandFormNo;
  late final dynamic yarnDemandSrNo;
  late final Null yarnDyeingContractNo;
  late final Null yarnDyeingContractSrNo;
  late final Null yarnTwistContractNo;
  late final Null yarnTwistContractSrNo;
  late final Null cottonType;
  late final Null yarnType;

  OgpDetailModel.fromJson(Map<String, dynamic> json) {
    branchCode = json['branchCode'];
    formNo = json['formNo'];
    itemCode = json['itemCode'];
    srNo = json['srNo'];
    unitCode = json['unitCode'];
    qty = json['qty'];
    woNumber = json['woNumber'];
    purposeID = json['purposeID'];
    grnNo = null;
    remarks = null;
    isAddedToGRN = json['isAddedToGRN'];
    grnSrNo = null;
    locationID = json['locationID'];
    locationQty = json['locationQty'];
    locationName = json['locationName'];
    retentionDate = null;
    departmentName = null;
    fKIssuanceID = json['fK_Issuance_ID'];
    lotNumber = null;
    yarnDemandType = null;
    yarnID = json['yarn_ID'];
    purpose = null;
    bags = json['bags'];
    noOfCones = null;
    coneWeight = json['coneWeight'];
    coneTareWeight = json['coneTareWeight'];
    bagTareWeight = json['bagTareWeight'];
    grossWeight = json['grossWeight'];
    packingWeight = json['packingWeight'];
    lossWeight = json['lossWeight'];
    netWeight = json['netWeight'];
    actualWeight = json['actualWeight'];
    cflLotNo = null;
    yarnLotRef = null;
    productionDate = null;
    paperTip = null;
    computerName = null;
    ppCRecordLine = json['ppC_RecordLine'];
    masterLocationID = json['masterLocationID'];
    assetCode = null;
    storeCode = null;
    demandFormNo = null;
    demandSrNo = null;
    demandQty = null;
    planQty = null;
    colorCode = json['colorCode'];
    colorName = null;
    reprocessID = null;
    contractFormNo = json['contractFormNo'];
    contractSrNo = json['contractSrNo'];
    yarnDemandFormNo = json['yarnDemandFormNo'];
    yarnDemandSrNo = json['yarnDemandSrNo'];
    yarnDyeingContractNo = null;
    yarnDyeingContractSrNo = null;
    yarnTwistContractNo = null;
    yarnTwistContractSrNo = null;
    cottonType = null;
    yarnType = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['branchCode'] = branchCode;
    _data['formNo'] = formNo;
    _data['itemCode'] = itemCode;
    _data['srNo'] = srNo;
    _data['unitCode'] = unitCode;
    _data['qty'] = qty;
    _data['woNumber'] = woNumber;
    _data['purposeID'] = purposeID;
    _data['grnNo'] = grnNo;
    _data['remarks'] = remarks;
    _data['isAddedToGRN'] = isAddedToGRN;
    _data['grnSrNo'] = grnSrNo;
    _data['locationID'] = locationID;
    _data['locationQty'] = locationQty;
    _data['locationName'] = locationName;
    _data['retentionDate'] = retentionDate;
    _data['departmentName'] = departmentName;
    _data['fK_Issuance_ID'] = fKIssuanceID;
    _data['lot_Number'] = lotNumber;
    _data['yarnDemandType'] = yarnDemandType;
    _data['yarn_ID'] = yarnID;
    _data['purpose'] = purpose;
    _data['bags'] = bags;
    _data['no_of_Cones'] = noOfCones;
    _data['coneWeight'] = coneWeight;
    _data['coneTareWeight'] = coneTareWeight;
    _data['bagTareWeight'] = bagTareWeight;
    _data['grossWeight'] = grossWeight;
    _data['packingWeight'] = packingWeight;
    _data['lossWeight'] = lossWeight;
    _data['netWeight'] = netWeight;
    _data['actualWeight'] = actualWeight;
    _data['cflLotNo'] = cflLotNo;
    _data['yarnLot_Ref'] = yarnLotRef;
    _data['productionDate'] = productionDate;
    _data['paperTip'] = paperTip;
    _data['computerName'] = computerName;
    _data['ppC_RecordLine'] = ppCRecordLine;
    _data['masterLocationID'] = masterLocationID;
    _data['assetCode'] = assetCode;
    _data['storeCode'] = storeCode;
    _data['demandFormNo'] = demandFormNo;
    _data['demandSrNo'] = demandSrNo;
    _data['demandQty'] = demandQty;
    _data['planQty'] = planQty;
    _data['colorCode'] = colorCode;
    _data['colorName'] = colorName;
    _data['reprocessID'] = reprocessID;
    _data['contractFormNo'] = contractFormNo;
    _data['contractSrNo'] = contractSrNo;
    _data['yarnDemandFormNo'] = yarnDemandFormNo;
    _data['yarnDemandSrNo'] = yarnDemandSrNo;
    _data['yarnDyeingContractNo'] = yarnDyeingContractNo;
    _data['yarnDyeingContractSrNo'] = yarnDyeingContractSrNo;
    _data['yarnTwistContractNo'] = yarnTwistContractNo;
    _data['yarnTwistContractSrNo'] = yarnTwistContractSrNo;
    _data['cottonType'] = cottonType;
    _data['yarnType'] = yarnType;
    return _data;
  }
}
