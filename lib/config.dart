import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Config {
  /* -------------------------------- app setup ------------------------------- */
  static const String GrocApp = 'GrocApp';
  // static const String apiURL = '127.0.0.1:8000';
  static const String apiURL = '192.168.1.7:8000';
  // 127.0.0.1:8000
  // 192.168.1.16:8000
  // static const String apiURL =
  //     'https://i1fn4d1wa3.execute-api.ap-south-1.amazonaws.com/dev';

  /* -------------------------------------------------------------------------- */
  /*                               End Points                                   */
  /* -------------------------------------------------------------------------- */

  static Size scSize = WidgetsBinding.instance.window.physicalSize;
// double width = size.width;
// double height = size.height;
//  screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
  static double scHeight =
      ui.window.physicalSize.height / ui.window.devicePixelRatio;

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
  static const String getrefferalID = '/offer/getReferralId';
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
  static const String checkOffer = '/offer/redeemOffer';
  static const String verifyOffer = '/offer/verifyReferral';

  /* ----------------------------- Subcription APi ---------------------------- */
  static const String getSubscriptionByUser =
      '/subscription/fetchSubscriptionByUser';
  static const String cancelSubscription =
      '/subscription/cancelSubscriptionByUser';
  static const String createSubscripiotn = '/subscription/createSubscription';
  static const String editSubscripiotn = '/subscription/editSubscriptionByUser';

  /* ---------------------------------- Quote --------------------------------- */
  static const String getQuote = '/quote/getQuote';
}
