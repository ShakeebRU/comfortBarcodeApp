class ApiLinks {
  // api path and links
  static const String base = 'http://comfortapi.cabcabit.com/api';
  static const String userlogin = "$base/Login/userlogin";

  // setup api
  static const String getitemsdescriptionlist =
      "$base/Setup/getitemsdescriptionlist";
  static const String getogpmainlist = "$base/OGP/getogpmainlist";
  static const String getogpdetaillist = "$base/OGP/getogpdetaillist";
  static const String getbarcodedetail = "$base/OGP/getbarcodedetail";
  static const String savebarcodelocation = "$base/OGP/savebarcodelocation";
}
