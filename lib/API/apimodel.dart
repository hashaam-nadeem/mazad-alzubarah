class API {
  static const String API_URL = "https://mzadalzubarah.com/";
  //"http://192.168.18.32"
  //"http://3.135.23.7";

  static const String Image_Path =
      "https://mzadalzubarah.com/uploads/reseller/normal/";
  /*------------------------------------------------------------
                 API:sendOtp
                 TYPE: post  -------------------------------------------------------------*/
  static const sendOtp = "api/user/create-otp";

  /*------------------------------------------------------------
                 API:verifyOtp
                 TYPE: post  -------------------------------------------------------------*/
  static const verifyOtp = "api/user/verifiy-otp";

  /*------------------------------------------------------------
                 API:register
                 TYPE: post  -------------------------------------------------------------*/
  static const register = "api/user/register";

  /*------------------------------------------------------------
                 API:LoginUser
                 TYPE: post  -------------------------------------------------------------*/
  static const LoginUser = "api/user/login";

  /*------------------------------------------------------------
                 API:resetRequestOtp
                 TYPE: post  -------------------------------------------------------------*/
  static const resetRequestOtp = "api/user/reset-request";

  /*------------------------------------------------------------
                 API:resetVerifyOTP
                 TYPE: post  -------------------------------------------------------------*/
  static const resetVerifyOTP = "api/user/reset-verify-otp";

  /*------------------------------------------------------------
                 API:resetverifyPass
                 TYPE: post  -------------------------------------------------------------*/
  static const resetverifyPass = "api/user/reset-password";

  /*------------------------------------------------------------
                 API:userProfile
                 TYPE: post  -------------------------------------------------------------*/
  static const userProfile = "api/user/profile";
  /*------------------------------------------------------------
                 API:allDepartment
                 TYPE: post  -------------------------------------------------------------*/
  static const allDepartment = "api/departments";

  /*------------------------------------------------------------
                 API:depositAmount
                 TYPE: post  -------------------------------------------------------------*/
  static const depositAmount = "api/user/deposit";

  /*------------------------------------------------------------
                 API:depositAmount
                 TYPE: post  -------------------------------------------------------------*/
  static const departmentAttributes = "api/get-department-attributes";
}
