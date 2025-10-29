class ApiUrlConstants {
  // Base Url
  static const String baseUrl = 'http://3.144.159.178:3001/api/';
  static const String baseUrlForGetMethodParams = '157.173.222.27:3001';
 // for Query Parameter use Dio comment
  /*
  but me baseUrlForGetMethodParams ki jgh Dio use krke .replace se bhi kr skta hu ,

  Example -->
  final uri = Uri.parse('${ApiUrlConstants.baseUrl}users/get-user-details')
    .replace(queryParameters: {'userId': '1234'});

    Generated Url ==> http://3.144.159.178:3001/api/users/get-user-details?userId=1234

  * */

  // Error Image
  static const String imageError =
      'https://icrier.org/wp-content/uploads/2022/09/Event-Image-Not-Found.jpg';

  // Auth API Login , OTPVerify
  static const String endPointOfLogin = '${baseUrl}users/login';
  static const String endPointOfOtpVerify = '${baseUrl}users/verify-otp';

  // Personal Details
  static const String endPointOfDriverAddPersonalDetails =
      '${baseUrl}driver/add-personal-details';
  static const String endPointOfGetProfile = '${baseUrl}get-profile';
  static const String endPointOfUpdateProfile = '${baseUrl}update-profile';

  // Drivers - Location, Online, Details,
  static const String endPointOfDriverUpdateLocation =
      '${baseUrl}driver/update-location';
  static const String endPointOfDriverUpdateOnlineStatus =
      '${baseUrl}driver/update-online-status';
  static const String endPointOfDriverDetails =
      '${baseUrl}driver/get-driver-details';
  static const String endPointOfUserDetails =
      '${baseUrl}users/get-user-details';
  static const String endPointOfAllDrivers = '${baseUrl}driver/all-drivers';
  static const String endPointOfGetBanner = '${baseUrl}banner/get-all';
}
