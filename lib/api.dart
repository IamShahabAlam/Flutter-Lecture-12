import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}

class _ApiState extends State<Api> {

  var users = [];               // empty list it will store data in list from the api
  getuser() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));  // getting data from link
    var jsonData = jsonDecode(response.body);                                         //  decoding the data in Json form

    for (var i in jsonData){                                                    // creating for loop to get data in list 
      UserModel user = UserModel(i["name"], i["username"], i["company"]["name"]);         // i is the index and these as should b same as in API
      users.add(user);                                   

    }
    return users;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      FutureBuilder(
        future: getuser() ,
        builder: (context ,snapshot){
        if (snapshot.data == null){
          return Container(child: Text("Nothing in API"),);
        }
        else return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context,i){
            return ListTile(
              title: Text(snapshot.data[i].a),
              subtitle: Text(snapshot.data[i].username),
              trailing: Text(snapshot.data[i].company),
              );
          }
         ); 
         }
      )
    );
  }
}

class UserModel {               // constructor
  var a;                     // var as can be changed
  var username;
  var company;

  UserModel(this.a, this.username, this.company);
}

