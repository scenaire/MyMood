import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mymood/Models/User.dart';

class LoadingTimeout extends StatelessWidget {

  final User user;

  LoadingTimeout({Key key, this.user}) : super(key: key);

  


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 50.0
        ),
      ),
    );
  }
}