class Config {
  /* -------------------------------- app setup ------------------------------- */
  static const String GrocApp = 'GrocApp';
  static const String apiURL = '127.0.0.1:8000';

  /* -------------------------------------------------------------------------- */
  /*                                 End Points                                 */
  /* -------------------------------------------------------------------------- */

  /* ---------------------------------- AUth ---------------------------------- */
  static const String otpLoginAPI = '/otpLogin';
  static const String otpVerifyAPI = '/verifyOtp';

  /* ---------------------------- Categories APi's ---------------------------- */
  static const String getAllCategoryApi = '/category/getAllCategory';

  /* ------------------------------ Products Api ------------------------------ */
  static const String getProductsByCategoriesApi =
      '/product/fetchproductcategory';
}
