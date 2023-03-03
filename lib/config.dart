class Config {
  /* -------------------------------- app setup ------------------------------- */
  static const String GrocApp = 'GrocApp';
  // static const String apiURL = '127.0.0.1:8000';
  // 127.0.0.1:8000
  // 192.168.1.16:8000
  static const String apiURL = '192.168.29.58:8000';

  /* -------------------------------------------------------------------------- */
  /*                                 End Points                                 */
  /* -------------------------------------------------------------------------- */

  /* ---------------------------------- AUth ---------------------------------- */
  static const String otpLoginAPI = '/otpLogin';
  static const String otpVerifyAPI = '/verifyOtp';
  static const String getCategoryApi = '/category/getAllCategory';
  static const String getCartItemApi = '/user/fetchAllItem';
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
  static const String addorupdatecartitemApi = '/user/createorupdatecartitem';
  static const String createcartitemApi = '/user/createcartitem';
  static const String removeCartItem = '/cart/deleteCartItem';

/* ------------------------------ Addreses API ------------------------------ */
  static const String getalladdressbyid = '/user/getaddresses';
  static const String addnewaddress = '/address/addAddress';
  static const String deleteaddress = '/address/deleteAddress';
  static const String updateaddress = '/address/updateAddress';
  static const String setSelectedaddress = '/address/setSelectedAddress';
  static const String getselectedaddress = '/user/fetchselectedaddress';

  /* -------------------------------- Offer Api ------------------------------- */
  static const String getAllOffers = '/offer/getAllOffers';
  static const String updateOffer = '/offer/updateOffer';

  /* ----------------------------- Subcription APi ---------------------------- */
  static const String getSubscriptionByUser =
      '/subscription/fetchSubscriptionByUser';
  static const String cancelSubscription =
      '/subscription/cancelSubscriptionByUser';
  static const String createSubscripiotn = '/subscription/createSubscription';
}
