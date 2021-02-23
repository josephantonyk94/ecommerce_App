import 'package:ecommercetestapp/product_home.dart';
import 'package:ecommercetestapp/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Services _services=Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
              child: FlatButton(
            onPressed: () async{
              var result= await _services.login();
              print(result);
              if(result!=null)
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductHome(token:result)));
            },
            child: Text("Login"),
            color: Colors.indigo,
          )),
        ),
      ),
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff20639B),
      ),
    );
  }
}
