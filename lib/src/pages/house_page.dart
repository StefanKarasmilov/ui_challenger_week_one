import 'package:flutter/material.dart';


class HousePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('GO'),
          onPressed: () {
            Navigator.pushNamed(context, 'detalle');
          } 
        ),
      ),
    );

  }

}