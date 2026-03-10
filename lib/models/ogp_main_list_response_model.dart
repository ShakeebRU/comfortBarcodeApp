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
    remarks = json['remarks'];
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
    isYarnDyedContract = json['isYarnDyedContract'];
    isKnittingContract = json['isKnittingContract'];
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
