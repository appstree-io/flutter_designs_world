import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Shopping Cart",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                width: double.infinity,
                height: 150,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 20,
                    ),
                    Container(
                      height: 130,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      child: Card(
                        color: Colors.white,
                        elevation: 2.5,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0))),
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: 12, left: 125, right: 10, bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Alinium Chair",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                "Buy products related to lazy boy chair products and see what customers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[400]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "\$870",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[400]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[200],
                      height: 150,
                      width: 100,
                      margin: EdgeInsets.only(left: 15, bottom: 10),
                      child: Image.asset(
                        "assets/17.png",
                        width: 30,
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.grey[350],
                margin: EdgeInsets.only(top: 25),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Text(
                  "Custom Order: Your card may be charged before the order ships.",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Text(
                  "Ready to ship to the contiguous U.S and Canada in 1-4 days.",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(bottom: 20),
                color: Colors.grey[200],
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$1121,97",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Shipping",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$25,65",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Estimated Tax",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$10,87",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[350],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "\$1158,49",
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Questions? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "1-800-934-1571",
                                style: TextStyle(
                                    color: Colors.red[700],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),

              Container(
                margin: EdgeInsets.only(top: 22, left: 20, right: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red[700],
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text("Checkout", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 17),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
