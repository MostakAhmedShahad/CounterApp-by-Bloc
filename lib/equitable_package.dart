import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquitablePackage extends StatefulWidget {
  const EquitablePackage({super.key});

  @override
  State<EquitablePackage> createState() => _EquitablePackageState();
}

class _EquitablePackageState extends State<EquitablePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(onPressed: 
      (){
        Person person =Person(name: 'Ahmed', age: 24);
        Person person1=Person(name: 'Mostak', age: 24);

        
          print(person==person1);
          print(person.hashCode.toString());
          print(person1.hashCode.toString());
          print(person.hashCode.toString()==person1.hashCode.toString());
        
          
      }
      
      
      ),

    );
  }
}


class Person extends Equatable{

  final String name;
  final int age;

    Person({required this.name, required this.age});
    
      @override
      // TODO: implement props
      List<Object?> get props => [name,age];

}