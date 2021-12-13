import 'package:flutter/foundation.dart';

class Employee {

  //"_" means private
  int _id;
  String _name;
  double _salary;

  //Constructor
Employee(this._id, this._name, this._salary);


//Customize Getters and Setters

//Setter
  set id(int id){
    this._id = id;
  }

  set name(String name){
    this._name = name;
  }

   set salary(double salary){
     this._salary = salary;
   }


   //Getters
    int get id =>  this._id;
    String get name => this._name;
    double get salary => this._salary;


}