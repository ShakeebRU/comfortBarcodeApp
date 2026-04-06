class OgpMainListResponseModel {
  OgpMainListResponseModel({required this.status, required this.listdata});
  late final bool status;
  late final List<OgpMainModel> listdata;

  OgpMainListResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    listdata = List.from(
      json['listdata'],
    ).map((e) => OgpMainModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['listdata'] = listdata.map((e) => e.toJson()).toList();
    return _data;
  }
}

class OgpMainModel {
  OgpMainModel({
    required this.branchCode,
    required this.formNo,
    required this.transactionDate,
    required this.partyCode,
    required this.partyName,
    this.partyAddress,
    this.partyContact,
    this.partyOGPNo,
    required this.vehicleNo,
    required this.driverName,
    required this.driverContactNo,
    this.vehicleTimeIn,
    required this.vehicleDateOut,
    required this.vehicleTimeOut,
    required this.remarks,
    required this.userId,
    required this.addDateTime,
    required this.status,
    required this.storeCode,
    required this.fKIssuanceID,
    this.returnable,
    this.entryGate,
    this.verifiedSecurityOfficerCardNo,
    this.isClosed,
    required this.ogpType,
    required this.ofd,
    required this.isYarnDyedContract,
    required this.isKnittingContract,
  });
  late final int branchCode;
  late final int formNo;
  late final String transactionDate;
  late final int partyCode;
  late final String partyName;
  late final Null partyAddress;
  late final Null partyContact;
  late final Null partyOGPNo;
  late final String vehicleNo;
  late final String driverName;
  late final String driverContactNo;
  late final Null vehicleTimeIn;
  late final String vehicleDateOut;
  late final String vehicleTimeOut;
  late final String remarks;
  late final String userId;
  late final String addDateTime;
  late final String status;
  late final int storeCode;
  late final int fKIssuanceID;
  late final Null returnable;
  late final Null entryGate;
  late final Null verifiedSecurityOfficerCardNo;
  late final Null isClosed;
  late final int ogpType;
  late final int ofd;
  late final int isYarnDyedContract;
  late final int isKnittingContract;

  OgpMainModel.fromJson(Map<String, dynamic> json) {
    branchCode = json['branchCode'];
    formNo = json['formNo'];
    transactionDate = json['transactionDate'];
    partyCode = json['partyCode'];
    partyName = json['partyName'];
    partyAddress = null;
    partyContact = null;
    partyOGPNo = null;
    vehicleNo = json['vehicleNo'];
    driverName = json['driverName'];
    driverContactNo = json['driverContactNo'];
    vehicleTimeIn = null;
    vehicleDateOut = json['vehicleDateOut'];
    vehicleTimeOut = json['vehicleTimeOut'];
    remarks = json['remarks'] ?? "";
    userId = json['userId'];
    addDateTime = json['addDateTime'];
    status = json['status'];
    storeCode = json['storeCode'];
    fKIssuanceID = json['fK_Issuance_ID'];
    returnable = null;
    entryGate = null;
    verifiedSecurityOfficerCardNo = null;
    isClosed = null;
    ogpType = json['ogpType'];
    ofd = json['ofd'];
    isYarnDyedContract = json['isYarnDyedContract'] ?? 0;
    isKnittingContract = json['isKnittingContract'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['branchCode'] = branchCode;
    _data['formNo'] = formNo;
    _data['transactionDate'] = transactionDate;
    _data['partyCode'] = partyCode;
    _data['partyName'] = partyName;
    _data['partyAddress'] = partyAddress;
    _data['partyContact'] = partyContact;
    _data['partyOGPNo'] = partyOGPNo;
    _data['vehicleNo'] = vehicleNo;
    _data['driverName'] = driverName;
    _data['driverContactNo'] = driverContactNo;
    _data['vehicleTimeIn'] = vehicleTimeIn;
    _data['vehicleDateOut'] = vehicleDateOut;
    _data['vehicleTimeOut'] = vehicleTimeOut;
    _data['remarks'] = remarks;
    _data['userId'] = userId;
    _data['addDateTime'] = addDateTime;
    _data['status'] = status;
    _data['storeCode'] = storeCode;
    _data['fK_Issuance_ID'] = fKIssuanceID;
    _data['returnable'] = returnable;
    _data['entryGate'] = entryGate;
    _data['verifiedSecurityOfficerCardNo'] = verifiedSecurityOfficerCardNo;
    _data['isClosed'] = isClosed;
    _data['ogpType'] = ogpType;
    _data['ofd'] = ofd;
    _data['isYarnDyedContract'] = isYarnDyedContract;
    _data['isKnittingContract'] = isKnittingContract;
    return _data;
  }
}
// class OgpMainListResponseModel {
//   OgpMainListResponseModel({required this.status, required this.listdata});
//   late final bool status;
//   late final List<OgpMainModel> listdata;

//   OgpMainListResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     listdata = List.from(
//       json['listdata'],
//     ).map((e) => OgpMainModel.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['listdata'] = listdata.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class OgpMainModel {
//   OgpMainModel({
//     required this.branchCode,
//     required this.formNo,
//     required this.itemCode,
//     required this.srNo,
//     required this.unitCode,
//     required this.qty,
//     required this.woNumber,
//     required this.purposeID,
//     this.grnNo,
//     this.remarks,
//     required this.isAddedToGRN,
//     this.grnSrNo,
//     required this.locationID,
//     required this.locationQty,
//     required this.locationName,
//     this.retentionDate,
//     this.departmentName,
//     required this.fKIssuanceID,
//     this.lotNumber,
//     this.yarnDemandType,
//     required this.yarnID,
//     this.purpose,
//     required this.bags,
//     this.noOfCones,
//     required this.coneWeight,
//     required this.coneTareWeight,
//     required this.bagTareWeight,
//     required this.grossWeight,
//     required this.packingWeight,
//     required this.lossWeight,
//     required this.netWeight,
//     required this.actualWeight,
//     this.cflLotNo,
//     this.yarnLotRef,
//     this.productionDate,
//     this.paperTip,
//     this.computerName,
//     required this.ppCRecordLine,
//     required this.masterLocationID,
//     this.assetCode,
//     this.storeCode,
//     this.demandFormNo,
//     this.demandSrNo,
//     this.demandQty,
//     this.planQty,
//     required this.colorCode,
//     this.colorName,
//     this.reprocessID,
//     required this.contractFormNo,
//     required this.contractSrNo,
//     required this.yarnDemandFormNo,
//     required this.yarnDemandSrNo,
//     this.yarnDyeingContractNo,
//     this.yarnDyeingContractSrNo,
//     this.yarnTwistContractNo,
//     this.yarnTwistContractSrNo,
//     this.cottonType,
//     this.yarnType,
//     required this.scannedBags,
//     required this.scannedWeight,
//     required this.itemDescription,
//     this.ogpLocationList,
//   });
//   late final int branchCode;
//   late final int formNo;
//   late final String itemCode;
//   late final int srNo;
//   late final int unitCode;
//   late final double? qty;
//   late final int woNumber;
//   late final String purposeID;
//   late final Null grnNo;
//   late final Null remarks;
//   late final bool isAddedToGRN;
//   late final Null grnSrNo;
//   late final String locationID;
//   late final String locationQty;
//   late final String locationName;
//   late final Null retentionDate;
//   late final Null departmentName;
//   late final int fKIssuanceID;
//   late final Null lotNumber;
//   late final Null yarnDemandType;
//   late final int yarnID;
//   late final Null purpose;
//   late final int? bags;
//   late final Null noOfCones;
//   late final int coneWeight;
//   late final int coneTareWeight;
//   late final int bagTareWeight;
//   late final int grossWeight;
//   late final int packingWeight;
//   late final int lossWeight;
//   late final int netWeight;
//   late final int actualWeight;
//   late final Null cflLotNo;
//   late final Null yarnLotRef;
//   late final Null productionDate;
//   late final Null paperTip;
//   late final Null computerName;
//   late final int ppCRecordLine;
//   late final String masterLocationID;
//   late final Null assetCode;
//   late final Null storeCode;
//   late final Null demandFormNo;
//   late final Null demandSrNo;
//   late final Null demandQty;
//   late final Null planQty;
//   late final int colorCode;
//   late final Null colorName;
//   late final Null reprocessID;
//   late final int contractFormNo;
//   late final int contractSrNo;
//   late final int yarnDemandFormNo;
//   late final int yarnDemandSrNo;
//   late final Null yarnDyeingContractNo;
//   late final Null yarnDyeingContractSrNo;
//   late final Null yarnTwistContractNo;
//   late final Null yarnTwistContractSrNo;
//   late final Null cottonType;
//   late final Null yarnType;
//   late final int scannedBags;
//   late final int scannedWeight;
//   late final String itemDescription;
//   late final Null ogpLocationList;

//   OgpMainModel.fromJson(Map<String, dynamic> json) {
//     branchCode = json['branchCode'];
//     formNo = json['formNo'];
//     itemCode = json['itemCode'];
//     srNo = json['srNo'];
//     unitCode = json['unitCode'];
//     qty = json['qty'];
//     woNumber = json['woNumber'];
//     purposeID = json['purposeID'];
//     grnNo = null;
//     remarks = null;
//     isAddedToGRN = json['isAddedToGRN'];
//     grnSrNo = null;
//     locationID = json['locationID'];
//     locationQty = json['locationQty'];
//     locationName = json['locationName'];
//     retentionDate = null;
//     departmentName = null;
//     fKIssuanceID = json['fK_Issuance_ID'];
//     lotNumber = null;
//     yarnDemandType = null;
//     yarnID = json['yarn_ID'];
//     purpose = null;
//     bags = json['bags'];
//     noOfCones = null;
//     coneWeight = json['coneWeight'];
//     coneTareWeight = json['coneTareWeight'];
//     bagTareWeight = json['bagTareWeight'];
//     grossWeight = json['grossWeight'];
//     packingWeight = json['packingWeight'];
//     lossWeight = json['lossWeight'];
//     netWeight = json['netWeight'];
//     actualWeight = json['actualWeight'];
//     cflLotNo = null;
//     yarnLotRef = null;
//     productionDate = null;
//     paperTip = null;
//     computerName = null;
//     ppCRecordLine = json['ppC_RecordLine'];
//     masterLocationID = json['masterLocationID'];
//     assetCode = null;
//     storeCode = null;
//     demandFormNo = null;
//     demandSrNo = null;
//     demandQty = null;
//     planQty = null;
//     colorCode = json['colorCode'];
//     colorName = null;
//     reprocessID = null;
//     contractFormNo = json['contractFormNo'];
//     contractSrNo = json['contractSrNo'];
//     yarnDemandFormNo = json['yarnDemandFormNo'];
//     yarnDemandSrNo = json['yarnDemandSrNo'];
//     yarnDyeingContractNo = null;
//     yarnDyeingContractSrNo = null;
//     yarnTwistContractNo = null;
//     yarnTwistContractSrNo = null;
//     cottonType = null;
//     yarnType = null;
//     scannedBags = json['scannedBags'];
//     scannedWeight = json['scannedWeight'];
//     itemDescription = json['itemDescription'];
//     ogpLocationList = null;
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['branchCode'] = branchCode;
//     _data['formNo'] = formNo;
//     _data['itemCode'] = itemCode;
//     _data['srNo'] = srNo;
//     _data['unitCode'] = unitCode;
//     _data['qty'] = qty;
//     _data['woNumber'] = woNumber;
//     _data['purposeID'] = purposeID;
//     _data['grnNo'] = grnNo;
//     _data['remarks'] = remarks;
//     _data['isAddedToGRN'] = isAddedToGRN;
//     _data['grnSrNo'] = grnSrNo;
//     _data['locationID'] = locationID;
//     _data['locationQty'] = locationQty;
//     _data['locationName'] = locationName;
//     _data['retentionDate'] = retentionDate;
//     _data['departmentName'] = departmentName;
//     _data['fK_Issuance_ID'] = fKIssuanceID;
//     _data['lot_Number'] = lotNumber;
//     _data['yarnDemandType'] = yarnDemandType;
//     _data['yarn_ID'] = yarnID;
//     _data['purpose'] = purpose;
//     _data['bags'] = bags;
//     _data['no_of_Cones'] = noOfCones;
//     _data['coneWeight'] = coneWeight;
//     _data['coneTareWeight'] = coneTareWeight;
//     _data['bagTareWeight'] = bagTareWeight;
//     _data['grossWeight'] = grossWeight;
//     _data['packingWeight'] = packingWeight;
//     _data['lossWeight'] = lossWeight;
//     _data['netWeight'] = netWeight;
//     _data['actualWeight'] = actualWeight;
//     _data['cflLotNo'] = cflLotNo;
//     _data['yarnLot_Ref'] = yarnLotRef;
//     _data['productionDate'] = productionDate;
//     _data['paperTip'] = paperTip;
//     _data['computerName'] = computerName;
//     _data['ppC_RecordLine'] = ppCRecordLine;
//     _data['masterLocationID'] = masterLocationID;
//     _data['assetCode'] = assetCode;
//     _data['storeCode'] = storeCode;
//     _data['demandFormNo'] = demandFormNo;
//     _data['demandSrNo'] = demandSrNo;
//     _data['demandQty'] = demandQty;
//     _data['planQty'] = planQty;
//     _data['colorCode'] = colorCode;
//     _data['colorName'] = colorName;
//     _data['reprocessID'] = reprocessID;
//     _data['contractFormNo'] = contractFormNo;
//     _data['contractSrNo'] = contractSrNo;
//     _data['yarnDemandFormNo'] = yarnDemandFormNo;
//     _data['yarnDemandSrNo'] = yarnDemandSrNo;
//     _data['yarnDyeingContractNo'] = yarnDyeingContractNo;
//     _data['yarnDyeingContractSrNo'] = yarnDyeingContractSrNo;
//     _data['yarnTwistContractNo'] = yarnTwistContractNo;
//     _data['yarnTwistContractSrNo'] = yarnTwistContractSrNo;
//     _data['cottonType'] = cottonType;
//     _data['yarnType'] = yarnType;
//     _data['scannedBags'] = scannedBags;
//     _data['scannedWeight'] = scannedWeight;
//     _data['itemDescription'] = itemDescription;
//     _data['ogpLocationList'] = ogpLocationList;
//     return _data;
//   }
// }
