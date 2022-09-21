import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  const ContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 40,
            child: TextField(
              style: TextStyle(
                fontSize: 18,
              ),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),

                prefixIcon: Icon(
                  size: 30,
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  size: 30,
                  Icons.filter_list,
                  color: Colors.grey,
                ),
                //fillColor: Colors.red,
                filled: true,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                hintText: 'Search',
              ),
            ),
          ),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width,
                  height:40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(

                        color: Colors.grey.shade700,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(
                          Icons.connect_without_contact,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        // padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Check your Contacts settings to manage who can find and see you on Skype.',

                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 30,
                        height: 30,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade800,
                        ),

                        child: Icon(
                          Icons.close,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ),

                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  //height: 80,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  child: Text(
                    'E',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListTile(
                    //contentPadding: EdgeInsets.only(top: 10,left: 7, right: 7),
                    leading:
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(

                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.shade400,
                          ),
                          child: Icon(
                            Icons.headphones,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green.shade700,
                            border: Border.all(
                              color: Theme.of(context).cardColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    title:
                    Text(
                      'Echo / Sound Test Service .',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),




                  ),
                )
              ],
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.shade700,
                  border: Border.all(
                    color: Theme.of(context).cardColor,
                    //width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0), //(x,y)
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Icon(

                  Icons.person_add_alt_1_outlined,
                  size: 30,
                  color: Theme.of(context).cardColor.darken(13),
                ),
              ),
            ),

          ],
        ));
  }
}
