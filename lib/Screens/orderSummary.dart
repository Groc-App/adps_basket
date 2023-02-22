// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import 'package:your_basket/models/product/productdetail.dart';

class OrderSummaryScreen extends StatelessWidget {
  OrderSummaryScreen({super.key});

  late final String orderID;
  late String totalAmount;
  late DateTime date;
  late String address;
  late String orderStatus;
  // String imageUrl;
  late List<Map<String, dynamic>> orderDetails;

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;
    var orderData = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    print("\nInside your OrdersSummary:");
    print("This is order received from argument $orderData");

    orderID = orderData['orderID'];
    totalAmount = orderData['totalAmount'];
    date = orderData['date'];
    orderStatus = orderData['orderStatus'];
    orderDetails = orderData['orderDetails'];
    address = orderData['address'];

    print("OrderDetails::::::: $orderDetails");

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 237, 237),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* ------------------------- Order Summary Container ------------------------ */
              /* -------------------------------------------------------------------------- */
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 2)],
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      // decoration: BoxDecoration(
                      //   border: Border.all(),
                      // ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Order Summary",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Arrived at ${DateFormat.jms().format(date)} in just 5 minutes!",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            "Download Summary",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      margin: EdgeInsetsDirectional.symmetric(vertical: 8),
                      child: Text(
                        "${orderDetails.length} items in this order",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                    ),

                    /* --------------------------- List tile for item --------------------------- */
                    Column(
                      children: [
                        ListView.builder(
                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            print("\n\nProduct Name in OrderDetails::");
                            print(orderDetails[i]['Product']['Name']);

                            double price = orderDetails[i]['Product']['Price'] *
                                orderDetails[i]['Quantity'];

                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10.0)), //add border radius here
                                child: Image.network(
                                    'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQUExYVFBQXFxYYGBscGhkZGRkgIRkbIBkXHBwbGR4hHishGR8mHBseIzIiJiosLy8vGCA1OjUuOSkuLywBCgoKDg0OHBAQHDcnISYvLjQwLDA3MTcuLjAuMi43Li4vNzo0LjEuLjcxLjAuLi4uLi4wMDA3MC4uMC4uLi4uLv/AABEIALcBEwMBIgACEQEDEQH/xAAcAAACAgMBAQAAAAAAAAAAAAAAAQUGAwQHAgj/xABAEAABAgQDBQUFBwMDBAMAAAABAhEAAxIhBDFBBSIyUXEGE2GBsUKRocHwBxQjM9Hh8UNSYnKCkhVTY8IkorP/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAwQFAgEG/8QAMREAAgIBAwIDBgYCAwAAAAAAAAECAxEEEiExQRNRYQUicYGRwTKhsdHw8RThI0JS/9oADAMBAAIRAxEAPwDsyj3lhZoCatzUa9IFGrgsddIRvZPFqfW8APTu9efxhA0bub69bQaU+3z/AH6QJtZV1aHPpfrAAn8PO7/L+YAmjeN3/mBO7x35a9YAKbruNNYATNv6cusMpff0GnSBvaPBy9LQmfeHBy9bQA1J7y4s0MnvMrNCIquiw10gVvcFuekABNW5k2vS0PTu9efxhKvZNlanLrfrD0p9vn+/SAAGnc569YAe7zu8AtZV1aH0vAnd478tYASU93c3eAJp39Dp1gSKeO401hANvHg0HpaAClz3mnLpaGU17ws3yvCAvUODl626wM90WTqMvh0gBq/Eys3z/iGVV7os38Qlb3BZs9OkBINk2Vqcvj1gAqcUa8+l4AaRRqdesDhqRxc/W8AIApPFofS8ANKu7sbvCSO7zu8CSE2Xc6awJFPHflrAABTv5vp1vA1+805fCBmuq6dB6Wga9Xscv26wAEVb+TadLwKHeZWaBnumydRl1tAoVcFuekANSu8sLNAVOKNRr0hKIVZFjrpASCKRxan1vAAFMKNefW8NKqN03f8AiE9qTx8/S8CVBNlXVpr8esACfw87v8v5gCaN43f53gTu8d3y16wANdV06DPpbpAB3JVfnBBSo8OWkKAGW/p56/Rhn/Hj1+fhAdzhu/n6Qilt4cRzHXO0APT/AMn15ZQD/Pi0+XxhaV+1y+GWcMCreVYjIQAk3/M8vnlAH9vh0+h4QDe47Nlp6wA1WVYDKAC+vB9N4wF9ODX5+MJ33Tw8/wB8oZLbo4efXO+UABf+nlr9GGq35fn8s48k02TcHPX0hnd4Lvnr6QAz/hxa/P4wf/p9eWUIineTdRzENvb9rl8Ms4AB/lx6fLwgF/zPL6EIJfeNlDIdMoAK+OzeXrAAl/6mWn0I15+MCTSq40A5aXjODXZVgPL1iI2qghZItkAelvQRQ9oaiymrfX1z9DqKyzd++aAFv7T+vWPKsYQDSKRyz87xAzlzE2qHxf1jAvaFNlpU/gc4wH7UvfDZ3hE0NpFN0k+7OI/F7dXLmbpGVw1rsf0iLxuOJWZaSwKHBYsDcG+WoPlEZsyWpcxSZt2PC/r1jh6u/H4mjltFxwu3qt5h4qHPlyyiWw2KC8wQvTx5eEVfB4YpTvqFiCAMug8IlJM+kg8r5RZ0/tC2ElullHuCcDe3np9CBN/zPL6Ea2FxiZhu4PhlGyN7js2WnrH0ldsLFui8ojAP7XBp8vHKDVv6f155wgat02SMj0yhvej2efxzyziQAX9ng1+fjlAq35fn9GETTui6TmeucCjTwXfPX0gBlv6eev0YCzW49fn4QKFN03J8/SAhhUOLl1ztnABZr8f03hlDDe3xafQ8YTOKjxcv2zhpFV1WIygBJv8AmeXzy8oA/t8Ony+EJO/x2bLT1gBq3VWAyMAN1+zlplBBWoWGQ8DBADbu75v5Qmp38306+MCRRdV35QAU75yOnWABv6nw+GcNqt7JtOl4TXr9nl8ICKt4WA06XgBfmeDeef8AEFVe7k38RrbTxTS1LSOEZNqSAMtIi9j7bXOUUKCRvMKXDWOdz9NHEpxi0mdxrlJNonan3Pj08Igsb2zwUlapEyeAtLhW5MLZPkggs/OJ4qcUji59I+au2oCcZMpLJE+emxVdphckk6l/CE5YRG2fScuaAA28FBwcrGPTd34v5Rg2aoIlSxmChLdKQ0Z07nFd+X7x0nlHoiKd/N9Ot4wSsUlSioZi7c9M4x7SBSgkmyj+/wAoipWIoNZyAf3XjK1ntCVN8YLp3LVVCnBvuWFqt/JtOl4R3/BvOKvI7Td4u26NBGxtjbE1EmYtCK1pSSANedrOWyFn5xIvalDlt5EtLZHqbm2NuypY3iHGj+v6RVcV2lmTOGoovSp2Fs2JIHx06vBbCD4lM3GqBlhzRUVb2nePYpFywJyGesvthctYcpAQFkmmzAvfpe49Ginqtc2lta69DrdCriKy/NmZOLnIYrSqk+ILdGJYPpo9rbsbKCmaDm9+vhbW/wAfOMX3kJl3KSAMz7TAMw/uaKtK2jMlTSQoEG7Avn6fvFONyt4mvmdK+MuJom56konywqWtSlJUykORSzFsnze/WNvGSmWgShSsikqIsUs7dbfKN7AzUYiWzsTysbsHHi6vcmITGYVaEgzF0LllwvIWNi/JtI4upcWmuUyG6tR5XQlp0ohJK1kpcVJVcguwKSBz8I1tmTkFdIcK1Bd7aEHJXllGWTtRM9IdBQkqS6TcLDs/vIPlGvtqRugKIUlKhSt9+Xdubljz0zeKzik+CIl1S/IwhOUlhUb+JgwUwkBCy5bdU3EPR9PKMeMmBCgCFOeXgR9W8Y9jPyZ6TOz8YCAhSmS53joeV4lgr+n8fjFTnTMgG6eMS+wbpUKi5sBy1jb0GrluVTWV5+RyyVqp3M3162gfu/F/KGDTum5OvWBJo4rvy/eNo5FT3d838oKad/np18YEii6rvAAxrOR06wABL7/w6Wzh0172TafGEzmv2eXSAiveFgP5gA/M8G88/wCIKq93JteloSvxOGzc/Hp0j0o1bosR/EAL7xTbl4woffNYvaCAAW48tNYBzVwafK0JJfjsNNIYvZXBp8rwAav7H1p1gN7o4dfn8INW9jn+/WES1k8OuvW/SAI3tKScPM7tsgDpmpI9Hiu9l9j4uXOeZLpTVYlSOSsmJ1v5xY+0KkpkskjeXLFyP+4jU+D+6N/EY2WACJiHcAbwzNgM+ZiKdalJSfYmhbKMXFLqe7Mw4/p7xw3/AKZJnLnrmSgpX3nEXL/95XixvHc2GY4/p7R8u9odoT5UwgTFy3nYglLkMTOWbjnHGpqnZDEJYZWms9D6W2MUiRJf/top6Uho2VKpBK8tNYiOxc0TMDhVLN+4l5nkgA9bvG5tKYqje529xf5R7Ofh07n2RLCOZJERj9pFc0ofdCXA8XA+cYpoqSQciGPnaIza8zu1omGwcpJ5Ozf/AGb3xuSgpSXBZ8sn6x8lY56izd+fzNmMFFLBF4nZvczElHAp8zcGzAcwQ/RomdozGkquzpIflYxCbQnpQoJXNWpQOpSyS1mFJBLesb8jGVJCFh0qG6sBgfAjRXwMTW6WUFv6+ZLZGTS7nN9mzzPUqWgslCSVE8RuB6kaNFs2cpbAsoiwyJL5ecVLYChLx81FvxK0p6hQUw8knzA5xdsJ2kMpKhfuwnM5A3DlhlU4+rS21bp4S4wn9TK0+nstb2rOOpEbbwSgilKhLS54iklJBCgkJB0zuwAfpESnABbLRNqU+RQ3ViLP18ImcRtKViJhlzgkkf1UWZhcKzcjJr+EPY2BMtSly0slBqKuZALJD+JYDXyET1RX4cYNPT0aWyLi4vd554+CYtjbVKV3sUhIOd2YAl/DXWLXtjZcrFolzFVHuy9IUQFBkh1AZscuTmKSvBJmCaupSUpQQSNXBZzpkb9ItPYraRVLCZliE0qBzsVVe8Zc3hD3lKCf+irbTscqX1j0+DPUyQmXLWhL1EhKPBTFYUWyYB+sYMWtCitCrLWgKAvyfzbLXKNHaU2dKdkqKAp1LUzEO2pcu/xbSMm1pqFGWotvJFN2Y6pfqDGa47cJme1h4NnY20FBPdm6pagR4pLgjq7Hyj1tDacxJYAKVqQHKRoLPSH5/KISfjZcp5hrVcJNDEpJBaq7J5OdSOcTfZ10yyaAkG+ZUr/cSznoPR4eHjlo5z2JCWtkpMw7wAqUzB2D/GN3Ze0kpUqkhTh7HK+fKw9YxJxAItEL2ixqpEpSpcsrmKBASkKsCDvGlLABjYkEtaJdPZLxo7ezD4Rf8JjELS730J8Q4vGdNuPy1jjHYftJNHeJnFSUqAEkTAQSQnIPmAEgHxUOcdFwHaaUpO+bJSkqe1LpSofAv5HlH0sNSs4kRqRYUuOPLTWGOZ4NPlaPEqaF5nd0+ukewdDwafK8Wk8nQDNxwfT26wFzwcOun1aB7sODn63gJayLp11+rQAKv+X5tbp84FMbJ4tfn8YFW/Lvza/SBTC6eLXXr8YAN32s9bQobIPEQ+t4IAEnvLGzcoAajQchr0hk95bJoT1bnLXpAA96NOfxhE0bouDr1tDdvw/j8YAaN3N9etoAqvbCeU4nZ+HQbzMQVq/0S0Kf31fCLPiMIFpIPl4HQ++Of7KmfeduTlgvLwkruwf8ySFfGqOkJMVZuMp4ZLykimdvO1acHKqArmr3RLBDlagqkNnSGJJ6DWOFbBCvvKhNxP3ZRCyqYSzuQsp/3ZgakAZsDc/tb2aZW1Zc69M2W4fKpIpU3KxTHMcfiDMWVHmfW3wb3RaracUyGS5wdi+yrtEUyp8l1TUSN5CzoCSwAAKmISpVNyCDziw/9XmqnS++UppskKCQGly5gIrQk0hRJBfeuwt4UzsBiKcEkJSVKUpdQQyTxqS61ki7ZMcgLO8WGZjaVVVXNlJSCpZDFha9ic8iBmNM3VNyTryaenpW1SJzaeHRNkTELulSSD7oicFt2WmxU2nSM86XNUO7QCVEh0rkziGe7EpSl2uL+HjEMiXhitUqbJSiaDdwpAV4gg7t+ZtzJjNjobK4NS6MtVWVTys5+BLbSThZ6kLWplpyI91wM4zbUmJQhISd0JNyddPSIdGw5aVmqWUSxcTBNmOBrWkpIQ3VvHMDen7ClzkgomTFIGVMxCgrwJCHD9RHeyaShn9yZOEcYbx6lGxHZLETZ0yYFSkvMUpNUxiBUSMgWOsZl49SFUTg6kICLF/8jcFlOVG5eLfhNmSVOmYmelizqZCB0JTd+YJeNPaHYHDklQXOSTdkzEqDc2Mqr/i8WMZWGz3Tyq083KOXn+ZK1M2wFWZIOQIAFv8AJrmJrZG2FAOuZUw3QVEhJYiwyf8ASMeC7GYKYo04qcCCzFLX5b8tLnwEby+wCRZOKUNWVLBUR4AKSY8UdrymXv8AOoksTWF8CH2XtRQmkJKhVfdqYhzm1rPkYl9g4pX3pQcoCg5FDXYhmIsCGOWpiQ2N2dky9+vEIY8U1CEJJJYNZxewcxsY3s7JE/vFGctc0pBanu0tSAVAbwBYC5Iu1niGNOLN3oZt0qpWynFvkybYlJQXUsh2IBTZRAyJ9ksTfwiF2gQASoilJqzFrC4VYNrkIt208HKVLJTJlqWgskKFIJs7kDxFz841UTEJWmWZDLIzTKmKRy4wkpQQ2Sm0vHU6VJnkLK8KUo5a88FSwOHkqBmSiASXIcbzl3YMFA55axkGGxC1OhBu4SglSUBmJUFEWBHW5bpc1TVpAHdqXdqkhCQn/U6gPCxJ8IwmVNSkBCgs1gqExRYJs4SumokZhw2bsLxxOqMnyRXqqxfhx8CJFUmUpU5ioJUqhBLkJclg7lgz+kRuxsFPxCu9M7uLUhIclgCwJCg5FRcAtceBixLRLROCpk8JHd0JTMICQr2pjqvcBIZ23eZjV7PorXdSUinduG8v11iHYqn7i5ZnaiuKkkjxjezJUinvgsldSq0kPZTXcsQTm2kV7tNsjESlIUpK0yUp31oU9TBKSSQbKW1nyBHIx0L71JCQ86VU7Ed4l1HkA8ecVtlMpN7JNnNmBaO4Pb+LgruCKrsHtLMTJXMmXUohk7zJDqIYc2V7qOcT8nb01aglUxKADwMHtoS7j3GIDaEpFVcsVFQIs4Cbu4bhN7kczlGLA7OnTVUykhxyJCUjrkDFrSznzl8Z4RG21wdKwWKrSAMjr11EbBNG6Lg/xELsPZUyQaVTQoqG8AmxJe7v0vToedpsGjdzf+I2INtcnaEr8PK78/D+YFCneFyfneAfh+L/AC/mCmjezfTreOj0fcVXOsELuKr84IACauCzZ6ekBU+6OIZnpneAt/Tz1+jDP+PHr8/CAE9qfb5/HPpGttPGpkSZsxd+7lrX5JST8o2tP/J9eWUVn7R1lOzMW/H3JHkSEn1MGerqVv7E5R+6zZ6y6505RUo5mmx/+znzjo6JkUH7KVhGy5HiZp981cW2XibGPn7tUo2tZ7sueG2sld+1nZ6ZuDEz2pMxKk9Fbih0ZT/7Y+cZcuooAzUQPeR+sd4+0bbBaXJ0Umao+J7pdPz+EcDUbJ6fpGnorXZVn1ZBZXsfJ2nZeypEmWmWJs1wkpKqEpzzLBy5N7k+LxC7cnLwq5KZUwzUqNVKkS3KUlJKHYKuCb5iLBjFAIksi4ASpm3jTcnd1N2iodocORMWXUGQ4Z+JsiQQMi1/jlEVcJymt8k15GjOUIwbjFpnQsB9okozZSRJUDMUEh1JsSqnmCb8gYpe2O1E+dOnzEUSkJIPdWUU7gqJUbXILENl767tNa0qw8xIIUAFhnsQoKGQtHraSAVKUwSEplBSSblVAydTZBrAZPzjUtjWuqz/AEZFU7M8PH9m5K7czqae4QvU1LUrzZmjPhe2k9MusCSjfp7uWQDk77ziN/DrCJaZgw6Ag2J3Rc/rE3NnS0S2XKKUTkXEooJXd0hBJAsXUeQSroc/w4f+f1JatddKai4tLPoQyftBUpBTNkKWmk1VTrKGobhKj0iX2N2ww8qWkS5VCSxolywtSc7k1gDLXwOV4qeKkSly0kUpYMVuWUblyeEW5HSJDsx2fkqXNE0pIBYKRSoL3V3BoJIa4ILuwa5EcKuMuFx8+DSnJwjufK8ksstG0vtAw60UqkzZtSgju6kCp8nAWQz2Lxu4PtShEsBMpMgMWk93+ISCBYBpbEFwq48YgMRsOaAnErK92lQWWuFBkskK1GYCUm+jwfcVzZZxAW9gVgo7vk4ZSjwp1IvSWfVhbeE9328znat6y1t+/kSW0u1kqZKUpWHTN3glUqesPmA6ZRQUHnZrAuQ0a+B7dpWtMruJmHSlQpSE0gnwTRUEjM3SLB7PEZiRLVMlFPdggpAJWkJq/uLoLHkEs5aJrAoweJwuJmTlSBMHeEzAF/hghLKSSLmoFikBnNrkHyKjNYOpw8N5xlfpnobOF7TmaibMlbpRooGpRbJNrPa+jeJaMkbbxi5qpZmolpUlXdGZLRQVpCVFIYJKd2o3Cub6HFgsLKGGE0XJmXAqLjIhIWQEcKmUwGVg7nHi1S6JRM0BMwqPdhQTSCkgFTAqWWGaQDZ9IKG1rjt5+Z63CUXh45aXHTBvY7GYzu5almagTQlSDLQAACouFrpRTusbm49kuxj8RMxTypc2dMqeVTvVIKVKCq51ICXG6H8VZ2BkAufMwmGknDrKEqFJoqICSQFL70tLZ3BUnLJoy4rY6/xEVyxIVTZpk6YVoBIIlgEE1l6OSBlp7lZz/Zx091+vw6kdthmmyppClywEqITmBUhBJZkmsksM2Fywjxs1aGYoQthzdQ94+LxOY3ZlEidLRUtRlTFfiMtdSVGmmWgboIKhvKDVJDEuBT9l7YSGSU1PwqDWHi2ZGUVdT7/vLkpahYaLng8NJmy3UEqORB5B2LGME+UhCFpZKUkXNIsA9jz821iBOLmVbhZOo/U5CNHHbR+8KCVGZQpYSqm3g1xnxe431itCtyfoVZPBbeyuElz5QMskSEkgc1XIJc5h390XHZsmghIsAMh1N4pWwtqSpIRhpW6lBap9Cp1EBV9TvE5tm8XeRdQKdP4PwPpFxOMeh5HkmkqDU+0deuV49A02VcnLWISXt1BJCU1FPtpulRZbBKrAkUkWcP4xLYWaFpqN9H5eB+tY0Yamub2p8kmD2nc47vlr6wwKbquDkM4E/wDk8vnl5QB/b4dPl8InPA7om4y0uYIe/wCzlplCgBqFPBfnrAQ28OI5j1tAR3d83hNTv89OsANrVe3y/bpFb+0VFWzMWVWUJKreAvlEvi9pyZZCpk1KSdCeoBP9otmbRpbfXIn4achc1LLlLSQhSSogpPC5zvaPGerqV77L8OP+l4Z+Sz75izFkxFEtLqLDLxJYlgMyWBiE7E/hYWXKACUoqSAS5ZznfOPHbtcqZhly13XxS7KtMHCXALB7F7MTHzs6oztfHdl+L5Sb4Kn2n2nhsUpJllYmSqwa0tUChaWF3cEvlHNsD2eJWgFaClJdTV7wDFQG6zsDrG5jMVPdICipRIZO+4J+GfjGfYiZgxBM97A2JfNbHW3Cc2zB1jRivBrai+C6qK52Riy67VmshAOnldrxCdqTQS1yUi7B7hrkh/cRG/tbEhVJGTGIPaM2uZJFncZnMJv6RU0/vXJeq/I0dYlXpnLHZ/V9BdokMZaQmZZJG6gHlkdPIRt/d0TJs9kKU6ErTTQ4C0gkVKSTUCVJY2FJiB7SzfxQKVcOi7ZnwjewWISpMgBKH7tUspJUxdNSXKb8QZx/eY2rs7WfK6fG5ZLJi8L/APFEldt92sbaXDB2bLWJLH4euVh0oTNJlpDUTUIIDNvKWCG00zjSnSiJSTkAfgza+UbePCe6kKV3TKluTOCikMS5YXdjlGd4smupqqqKa48zVRgKJS0pBZbhaULlzVMUtdSWILE5R52RsSV3ZrlTrqZ5uKCbZuUhQLaMA/OMy1y1S3Cpak6EYahA/wBKkmrzIjL2ZSkoFHdkmaojusMuYck5KU1J5rLDKIlZJ8Nk8q4wjuSxnr1JbaX5CkrmSBJKWpSQhKQMrlJUhmzT4tGrs3ZaFSgiXT3agFrCJc6YhRdJfvFlKPZTch90WiU2uZgQSO9qH9iJcxfRJSd0+KgRGspZCk947hm7+e5UWDlEuXd/FSWjp2S6t/qQqCxhJdfQxbR2IFTZZVLmqYgcKCAkf5khKE5cIqybWPOF2VJSQ5SJgyrmy1TEnyT3QPg0G1cVLTOlgiQFEkgLE1RskklCUulRbMkC0SOCmqTL3RMSkCyZchKB17lytQ8THOWdPKRo4XBSK2UJRWFtvzlzF1BCCwQRSVB9Lix9q0iqSEzEFCVga91KQlgxsubNuEu26kBTto8aOzqkhylUpJWpwtMmUC5HsSx3iiWcX/1aRk2jiEmdLAorBKm7tc6YAEq4UcMt7jvHBOWse55I5Lg3cVh6koFFTLSWImTSCFA3ZSRZs1qZJDsWAjFNmf8Ax1JLJAFNLkgckqTIa/JCSXye8au1MYgS5ferSFVJ3ZsxRNTj+lJstfgN1+kRu0NtUye7CloJsAg9woJf2UpClSk/4rYnMNHnZHj45ZLYuaO7SgmipM1krUqUS6XJTJRvE3JqUXS6jmRHJNi7MnKSO83Es7mxfwGnwi4pxc1KaAaEF91JUVKJzrUSVKdg7nQWtArAzFFzuhtYkgpYxgzdTbGbxHsa0vGpkgMkEgM5zMaGI2iO8c7oYls2a4AsWck/WXrauKkSiQ4Upr/DyzHpEXLmlYJrRTbc9pLqTc5PyYgg1eEeeFwVMMlpEoKW0yZTLABU9lIBCt4Ws7FiHa8X+ZtShKUmpSppEqWMrEEqmKe1kOQnqMyoxWth4YLQJqUBQG7SsKUaQLtd7MffE8cRLViAgAUoTLKW9nfCj7wkDRg8U7cNP0LlWksaykSOwsEUpmI4ihSlpfJlGaAn/SBZvGPHZjtSVBP4bd6mpCXKqkhnUkZmxydyAGtEjg9yaqk8QS58gGHT5nwjkuzcZP8Avk6WrfPeL8KloWEJo0SkUANpUkcm4prljenyuTy2uVaWe53vDzkrZzZrH4EHobfvGUGqyrJGRy+PSK3s+eTSarkZvYm9lc1ACyhmn+6kxYMPMKwxs30OoYu8a+l1G73WRmXvCLDLSxgg+8U25QRePASO7ubvygak16HTrAkU8dxprCZi6uDQeloA5v2m2+hc8plpLJUXBLVWRcJvYFKg5TrHg9oZBYqrQ2bgFuhs3WNHtvh5ktSMSKFS1z1hAa4BK1Em3MkamwuLvhRtlDEXB1CHA/8A1HpFW6yMZdTR01Lsgntz8Dc2ftrDBTFa2KtFHnmQFH0jHt7bUsXCRS1id8nyUlh4XjTw2JBUbr81zb/8VxqdqpxUkN3dg3CVHoa6vfnFLxoef0NFaOSfEX83wa2356ZuG7ylaWUDvF3DpS4GQes5N+XlFU2TP/FV4oV8Gjb2njJ889ykFbrJCEIDqLlrJDqZyfMxO9nPs6xFYmT1plJpO4N9d3FwN1PPiJ8IknKCg239TmMnVNZ8+3kay8QyE82+Ziu4+f8AiIJdgoZdf2jrMrsPhQAFTZym5GWP/U+sLFfZ1s6ZkqdLPNKwffUlQ9Iq6bUVV2bmz3XajxqXXFM43j2mKKgTyv8AxEz2HwxVPSGBpCj58PL/ACfyjoE37JMMzon4hX+6Vn07sP74fZD7PJ+HXNWqYghTBFlOUhy6h7Bvk5yjRt1Eba2oPLMimrZNOXQ87TITLIHJvr60jSxG0HlyUAN3QJfWolz5BhEvt3Yk+pLylKQC5KA7+6/vAzisYlZBaYCknMEMc4z5uS4NavbJeZIzZy6XqnlRuFKmSpiyPCUllJTG1sefMMv8VU4glT97ORLS1mCkJ/EPgE8y+kQa01SrCSzmyaEzDch5ilII6CoWaNvYMmXLSkk4eWQ7EVz5oJUeBJ3E/wCt/DSCS/mCWfMVx+pK7emyqUAmQlJIA7ybMCT4JEsVqP8Agpoy7JmXKpQWpKlHelSUyEHquYa8QehYxF7T2igT0hE4JmqKRbDiZOUP7QaUlOvtL6xkxGDmXXMRiQWbvcROUmYbcMqVKyFvaScokS90h/7YbM+0Z02oqpxKE3sZsnDJPiaiVnqGEecPjZXdqA7hRe4TNUffOmTErWrmUFXSMOzvs9E2WVujvDkJqpkx9W3TLHkQfOI3a8oyAmStckrPCnu2Wq+ctKQUy0hixcG2RJj3Cxk6hhy2Z7pfUn+yie8UQlMuUEpUSqWllM5JHeKdbed7mMuKxVbAzZqEkLZCZqkuqk7iikOb6i9orezdrTJRaW4UQQoc30IIixYDZSlLE0SxcOxbiZPmWYBwR8ohUn8y7rKPD5ilteF+7+JGbNViJwZCjIly7TFAJQlN+FLb/lWQc42pWFlhX4OTEGaq5UdSkaasRf5e8dKnIB7wFKEOaRcC5JIGY53yjLsvHS5oSilDKGZyUCHZTlteoiWNkU1lGXb7MnZmW5d8L09SIxvaDD4ckA1rGd9fE6eUVLbPa2ZNcVsn+1P65mLFjex+FTUQiab233SkA7xBPEG5ufHWHjezEkbyEABQShFKfbocA9QkqKh/dfMxLLU1p7WZFunnTLbJcnNZ+KfmHi09n1ncVLQyCQiohlLJKfywMmIYHRzEdjNlKM9MiimatSQEnMPdz5XMdJwWyJUqfhpCc0kqzuyUuT76R5+MdXWx2pJdSxptJ4icpcJFlKU4fDiwq0YZrJsB5mIvCbNEueFuSpaN4knMKew0uoxhm7XE/aRkJLow6XPjMNj/AMQW6lUSmPxATiZSNVpW3+0o/WM2cWuDapcdqx6/tgkyGUnz9IpWO2cFTcTMATuzFEAu5WsFGnsuam1KQ9ni4z1gTpY1KV/+n6xTMdiaJ8x5iADMUd6WpagQogBG6Uh0uMwXPjHUU88Gb7Q/BF/zubnZ6XiJ8omaEplBKhLSClImKqaWACHISFM7lnI5t0PYUtZloqXUaBc8ns/ixEVHC4cS1JmTFLnzjkFBqh/aEVZtbMJDk+EXzC3SGBC/afRrEA6h4taNb7N3kZa4M/f02bKCB0jiF9YI1z0Sb8eWmnpHicgqSpJJSkggKDW0BHj1jIk12VZuX7wAvunhGvTKAKD9qWHCMPhwl6ETkhP/AAVmdS4MUTCS3WY6P9qaHwyEaCclj40rjnMs0ktGTrl7/wAj6L2U/wDj+ZIBTE+XzjCcArEES0MCrU5Aak/WZEYO9tFl7DzkFU52elLdHL/ECM2ivdakbGptddEposez9kScJKKZSQFK45h4lnxPLknIR5eM06eFZF7/AK/ONWcAxqsCGJ8Pox1r5ZswuiPnqctZfVjQsEAjI87RhxOKShqjnk0ZESwAkC7ZPHmdJSsMoAiKfYnW3PPQ28DPKVC9jnEuqexyiviNzaWJCe7JIDg59B+sWdDZsnjzK98N3Jt4raBJoSWOpGngPr1iK2ns2XOlmWsFZOTcSTzB59fONLDz1lSiMySLaRYMAAkOTfU/vGklK2Wexy2qlx1KzjuxBEkJl0zSFOUzN173pWgJJI5KIB8INjzUSU92lAl0kugCljnlF3TNcPpEftLZErEcTgjJSWCvEOxt4GOraMr3RTqu1i4K0hSUTAZVCUKJUtKEpTUt3qUQHU7+0+UTGLnVy6SxDHzB0imy5E1MxaQhZCVqTUoM7EjPJ7aRath4Fa0VTHSDknUjmeQio3NcMu2eFFKS7HvZE5CEgBRtkeZiJxU0pnBklZYlNKSTS4qFg7O3wizf9IlAMEgdCp/e/qDELjsDMlYiR3Synve8TWsOAaQoSyQzEtZXgLWv3GLm1FsgWogm5JdSs9oNopmTkMkJZJ0vnk/l6xJrRNmoQqSpTAXAKXSd4Frvk1m1N4m53ZlBWZkxNcwm5WAr/iGYXv1MQ+39jUS1Kk1IWAS6bAsHZQBZizWu+uYiytLKKb6kstbVdCNXMcdxbaW0pKFJPeC63YlSSRmQSD00isSNnThKmzZSJipaTUbOQCSHR7SkMPHImJX7OcEZ6pk2c5ShQCUl7qpSupQLGwUlgfE8jHVcJJHwY9OXSOoadyTcu/Y4s10KNsauWu/2OPbO2oJykS1DdSMrg5avzOkW1ZlS6UrQqaokUIAJo3Qwtc+0f9xziW7R7I3SUAOMjqNbHk4FoydmZZThpKlfmTEBS1a3yS40SLe+ILKFVZunyscFPUaj/Ikp4xxj7mLB9nMFWFowkuVNSLKSighxc6DnnHN8b2e2qjaMyaEignuwt3SZSmG6HCgWubgggsY7Ik2Gcam0p8tKQZhQlLjia5zvzII+EWI2wmm2ucEGZLjPGSk7L7JycHOSqWGVMluoBSlJcKGVRKg9XO7aRp45VW1ZI3tySr2bGol3Vz3U28YtrrmzawlXdhJSktmRcnzdv9sbOH2SoIJUkV1BR94s/SK8a5ylJvy+xdVsYRS9fuQeMxI+9SZb7+ZHIKEwg+fdH3GIjZ+wMTOnTJsoJMszVlKqgTSVBQZyKTc82FLR0HC7KTVUtNzq2Qvr5n3mJBMsILISGbNhbRraWienSd5dynq71ZiK7EFsPs2mTvllTFDfACCPM0uosMzFhLDh4tfn8YStzhu+b39IahTvJuTmPjF+FcYLCKYUo9rPW5gg7kG516QR2Aq7y2TecD1bmTa9PCAmuybN5ekBLikcQ16ZwBE9ptlpxEhcggkjeQRmFhyLebdCY5bN2BikKZUmYfEJJjtGlHtc/jnnADTuquTkfhEF2njb1Lmm1k6OEsnFcRsac15MwdUK/SNSThZ0mYFJlTP8jk45e9vdHdGpDL3n8/WNDGbKSQ51yb5xVWgUXlMvv2xKcXGUUUrYm0xMdNwoAGk52sfURKEx7xWwylQmJSXGraZZ9IwFUZmtocJbuzOarFPoZIx98mqlxVm0eDMjHQiqtt7J4okyS7mxGv2kn0iSevomMyVPFc7ebalypkhClgKCVKIe4BpA97H3R3TFysW084ysm9K2l9fX1aN7D7SDaZxTpG25Kn3028Y2VbUkJuqYlI8SBGvCU48HM4QfJeZe0WzII+mjY/6oAxeKAjb2HIdM0EZbrm/lExg8SJxoSJoCmFSEhwNSmrXqIkzZJ4SIvDristhtzaSFTVEeD9bj9PdFr2dPC5MtcvhpSOhAAKfJoi8d9n0hYVMSZjnQrIJ66RE4TZONwpPcSlqQ9wVBQPxLR7qKJ7F3aIIzhN4XHxLlWpwGDMb+NmDa6+6IvtLPSlCEHiK6s7hhY+BvplaPGDx2MXnhlJPNkeoyjHtns7icQhPdzJctaTUQpLvoRVo/KK+mhOU8uLSXn9jyxqPVr5Fh2Tiq0ALufXxaK/8AaFtIYfDLKLrWClAzuRnzsL+URGI2PtlICZJw5IGZKhfw3uXyiE2xsDac1QViZNaxYCWELDeGQSTz/aNCTcI+4uPmVXZHOSF7A9rkYKYuXiCRKmqrCyHKFkBJrA9khIAIyaOybH7UYWcD3WIkrYOQmYkkB8yHcZ6xyKb2NxMxIMzDTnVlUASM+JNw4bV9I119l8TICUrlrSU3Q5SM2sSnKz2+Mcq5qHK5/IijPHDRfO3fbMoBw+HCZs+YGQUkFKHBdSzzGYT0jF9nPaJCpCMJOWBNlAoDuAtLlrlrjK/IxUcFLWGCEhxvKZnJsbnQB2vm3jHrCdnZq5hXmaiokE7pLClJBY5Z+OXOpbc7FhncbcP0OyrQpwz/ACgXs0TQAo2BuObtnfw+MV/s1sjEUb03dA5KD2i1ypZKQEnhDHR/dEmjok3umsEtli28MJEpJSEpAQlOTe6PdVW5y16eENRqsmxH1pAS4pHENemfjGmklwiuKpvw/j1vlDqo3c31y8IHYU+1z/fOGk02VcmPQL8vxfyy/mCmjezfTreEnc4rvk1/WACneVcHIfGAH93qvk/hBB3RNxr4mFADUx4M9dPWAszJ4tfnDVu8FzrrCNg6eLUetoANG9v61yygt7fFp8vjD0q9vl+3SEL3VZWmnS3WABNvzPLXrlAlxx8On10hJ3vzLcnt1hpL2XYaaQAB3c8H01s4xTJCVF6UlHiB553jK92PBz9LwnYsODn63hgGnO2TJWXEtLatb9IwL2DJVwBXjvH5xJqLWRca6w1bvBfm14ilRXLrFfQkVs10bIobCl5JKqtQ4t7xEVifs92fMJUuRXMVmVKUST4km9otSg103VqM+tusDWq9vl+3SEKa4fhikJWzl1ZUU/ZrswBlYdNWgc+UZZX2d7NRxYZAOmfyi1APdXFoPS0JO9x25PaJMI43MhMH2SwksuZCByzPziWkSEoySEo5AAdLCMqTVx2GmkIF7Hg0PpePcBtsLu44Pp7Z5wy54OHX5/CEDekcHP1v1gJaybp11636QPAVf8vza3TPzhljw8Wvz+MJW7+Xfm1+kNQAum6tdfh1gAszDj+nvllAGZjxafK+UDBqhxcvW3SAAEOeLQeloAEsOPPTX0jyZY/qgHk4Bj0kBXHY6aQk735luWkAYJeClpNRQkJ03R5eOUZEyUguEpCPAD0zzjI72VZOhy6Xge9Psc/36x5hAD/jwa/P4QKv+X56esDtZN06nPreErd/Lvz1j0DUx4M9dPWAszDi1+d8oFAJui511gIADji1HraAAMzHj+mvllAlhx8Wn11gADVHi5eloEgG67K00+rwAk2/M8nv1y8oYccfDp8vhCTvfmW5PbrAC9lWTpp0v0gBsv2ctMoUOpQ4RbSFAHpQouLvzhEUivU6dYIIANO815fCGBXvGzfK8KCABO/nZuXj/ECVV7ps38QoIAKnPd6c+kMljRodesKCAGpXd2F3hqFGV35woIAFCjfFyfneDTvNeXwgggAAqFeo06Q0ivOzcoUEACVV2Nm5QVVGjQa9IUEAAUx7vTn1vDWqjdzf52hQQA1bmV35+H8w1Jo3hd/5hQQAMw7zXl1tAA4r1GnSCCAGlNdzZuUJJrzs3KFBADG9uaDXpaB793pz+MKCAGd3cGR162gUaMrvzhQQB6Umi4u/OEQwr1OnWCCAABx3mvLpaGhNe8bN/MKCABO/nZuXj/EJJrNJs3ytBBAB94ps2UEEEAf/2Q=='), //add image location here
                              ),
                              title: Text(orderDetails[i]['Product']['Name']),
                              subtitle: Text(
                                  "${orderDetails[i]['Product']['Quantity'].toString()} X ${orderDetails[i]['Quantity'].toString()}"),
                              trailing: Text(
                                "₹${price.toString()}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          },
                          itemCount: orderDetails.length,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              /* ----------------------------- Upper container ---------------------------- */
              SizedBox(height: 20),
              /* ----------------------- Container For Bill Details ----------------------- */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 2)],
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  // mainAxisAlignment: MainA,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Bill Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text("MRP"),
                        Text("₹${totalAmount}"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Charges"),
                        Text("₹0"),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Bill Total",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        Text("₹${totalAmount}"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              /* ----------------------- Container For Order Details ---------------------- */
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 2)],
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Order Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 241, 237, 237),
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Order id",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text("${orderID}"),
                      ],
                    ),
                    SizedBox(height: 5),

                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text("Paid Online"),
                      ],
                    ),
                    SizedBox(height: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text("${address}"),
                      ],
                    ),
                    SizedBox(height: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Order placed",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Color.fromARGB(255, 137, 137, 137)),
                        ),
                        Text(
                            "placed on ${DateFormat('yyyy-MM-dd hh:mm:ss').format(date)}"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
