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
  static const String getCategoryApi = '/category/getAllCategory';
  static const String getCartItemApi = '/cart/fetchitemsid';
  static const String getProductByIdApi = '/product/fetchproductcid';

  /* ---------------------------- Categories APi's ---------------------------- */
  static const String getAllmainCategoryApi = 'category/getallmaincategory';
  static const String getAllCategoryApi = '/category/getAllCategory';
  static const String getAllCategoryByMainCategory =
      '/category/getCategoryByMainCategory';

  /* ------------------------------ Products Api ------------------------------ */

  static const String getProductsMostSellingApi =
      '/product/fetchproductcmostselling';

  static const String getProductsByCategoriesApi = '/product/fetchProducts';
  static const String getOrderbyIdApi = '/order/fetchordersid';
  static const String placeorderApi = '/order/createorder';
  static const String getAllProducts = '/product/fetchAllProduct';

  static const String createuserApi = '/user/createuserifnotexist';
}
