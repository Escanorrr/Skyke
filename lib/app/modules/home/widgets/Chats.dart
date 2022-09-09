import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
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
    );
  }
}
