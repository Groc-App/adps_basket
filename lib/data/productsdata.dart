import '../models/product/products.dart';

List<Product> data = [
  // {
  //   "Name": "Amul Taaza Toned Fresh Milk",
  //   "Price": 27.00,
  //   "Description":
  //       "Amul Taaza Toned Milk (Polypack) is pasteurized with a great nutritional value. It can be consumed directly or can be used for preparing tea, coffee, sweets, khoya, curd, buttermilk, ghee etc.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://tiimg.tistatic.com/fp/1/007/819/500-ml-100-pure-and-fresh-amul-pasteurized-toned-milk--801-w410.jpg",
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e00826b56990c02866bba2"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e008bdb56990c02866bbae"
  // },
  // {
  //   "Name": "Amul Buttermilk (Amul Chhach)",
  //   "Price": 12.00,
  //   "Description":
  //       "Bringing a pleasant tang to the palate, Amul Buttermilk has been proven to be beneficial and practically useful by incorporating it in many meal preparations and baked goods alike. While it helps build the taste in dishes, Amul Buttermilk (Chaas) is just as much healthy when consumed as it is. Go ahead and buy Amul Buttermilk online today!",
  //   "Category": ["63e00827b56990c02866bba7"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://www.jiomart.com/images/product/600x600/590001683/amul-buttermilk-500-ml-pack-product-images-o590001683-p590041240-0-202204141120.jpg",
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e00fc16dd12138c0aa48cb"
  // },
  // {
  //   "Name": "Bonn High Fibre Brown Bread",
  //   "Price": 45.00,
  //   "Description":
  //       "Made from 100% unprocessed whole wheat flour.A softer, fresher, tastier, and healthier way to stay in shape and be fit.Does not contain trans fat or added color.Make the best of your day by satiating your appetite with the wholesome taste of bread",
  //   "Category": ["63e012406dd12138c0aa48d7"],
  //   "Quantity": "400g",
  //   "Company": "Bonn",
  //   "ImageUrl":
  //       "https://www.pngfind.com/pngs/m/266-2668291_brown-b…g-arts-transparent-background-wholemeal-bread.png",
  //   "MainCategory": "63e012406dd12138c0aa48d5",
  //   "productId": "63e012406dd12138c0aa48d2"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e0ff703b46f32e5a962464"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": [],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "productId": "63e100bf50e5c7c3cdea624a"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e101a3ca0438054553cfd4"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e103b687e3db8bc3a17664"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e103b887e3db8bc3a1766e"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e103ba87e3db8bc3a17678"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31.00,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e103bc87e3db8bc3a17682"
  // },
  // {
  //   "Name": "Amul Gold Full Cream Fresh Milk",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e103be87e3db8bc3a1768c"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e1042087e3db8bc3a17698"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e104def12f3f8c9685579c"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e10505f12f3f8c968557ab"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e10506f12f3f8c968557b6"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e10508f12f3f8c968557c1"
  // },
  // {
  //   "Name": "Bread",
  //   "Price": 31,
  //   "Description":
  //       "Amul Gold Full Cream Milk (Polypack) Milk is homogenized toned pasteurized milk. Rich and creamy, this milk is an excellent source of vitamin A and vitamin D that enhances growth and development of the body tissues and the brain.",
  //   "Category": ["63e00827b56990c02866bba7", "63e00827b56990c02866bbaa"],
  //   "Quantity": "500ml",
  //   "Company": "amul",
  //   "ImageUrl":
  //       "https://slyce-product.s3.ap-south-1.amazonaws.com/MILK%20%26%20DAIRY%20PRODUCTS_null_AMUL%20GOLD%20MILK%20%E2%80%93%20500%20ML_image_2022-06-07T08%3A25%3A30.516.jpg",
  //   "MostSelling": true,
  //   "MainCategory": "63e00827b56990c02866bba5",
  //   "productId": "63e10509f12f3f8c968557cc"
  // }
];
