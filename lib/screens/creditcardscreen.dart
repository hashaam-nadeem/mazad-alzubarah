import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zubara/API/basehelper.dart';
import 'package:zubara/languagedata/language_constants.dart';
import 'package:zubara/utils/const.dart';
import 'package:zubara/utils/customButton.dart';
import 'package:zubara/utils/routes.dart';
import 'package:zubara/utils/textstyle.dart';
import 'package:zubara/utils/Colors.dart';

class CreditCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CreditCard();
  }
}

class _CreditCard extends State<CreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  var width, height;
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Deposit",
          style: headingStyle,
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            AppRoutes.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       AppRoutes.push(context, Cart());
        //     },
        //     child: Icon(
        //       Icons.shopping_cart,
        //       color: Colors.white,
        //       size: height * .04,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 10,
        //   ),
        // ],
      ),
      bottomNavigationBar: BottomBar(),
      // body: ClipPath(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width,
      //     height: 200,
      //     decoration: BoxDecoration(
      //         color: Colors.green,
      //         image: DecorationImage(image: AssetImage("images/item.jpg"))),
      //   ),
      //   clipper: CustomClipPath(),
      // ),

      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .3,
                        child: CreditCardWidget(
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: width * .85,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[800]),
                            borderRadius: BorderRadius.circular(height * .01)),
                        child: TextField(
                          controller: amount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none, labelText: "Amount"),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .93,
                    height: MediaQuery.of(context).size.height * .7,
                    child: CreditCardForm(
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  Widget BottomBar() {
    return GestureDetector(
      onTap: () {
        if (cardHolderName.isEmpty ||
            cardNumber.isEmpty ||
            cvvCode.isEmpty ||
            expiryDate.isEmpty ||
            amount.text.isEmpty) {
          constValues()
              .toast("${getTranslated(context, "required_field")}", context);
        } else {
          APIHELPER()
              .deposit(cardNumber, cvvCode, "03", "2022", cardHolderName,
                  amount.text, context)
              .then((value) {
            if (!value['error']) {
              print("valid");
              constValues()
                  .toast("${getTranslated(context, "success")}", context);
              AppRoutes.pop(context);
            } else {
              constValues()
                  .toast("${getTranslated(context, "wrong")}", context);
            }
            print(value);
          }).catchError((error) {
            constValues().toast("${getTranslated(context, "wrong")}", context);
          });
        }
        // AppRoutes.push(context, SetPassword());
      },
      child: CustomButton(
        width: width * .6,
        height: height * .06,
        color: lightGolden,
        title: "Update Password",
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(15.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .3,
              child: Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: MediaQuery.of(context).size.width * .7,
                          height: MediaQuery.of(context).size.height * .25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "You have Placed the Order Successfully!",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Thank you for your payment. You will get your food soon. Thank for using our service. Enjoy your food!",
                                      textAlign: TextAlign.center,
                                      //   maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "OK",
                                      textAlign: TextAlign.center,
                                      //   maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .1,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.check,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
