//TODO: imports
//TODO: List of employees
//TODO: Stream Controllers
//TODO: Stream Sink Getter
//TODO: Constructor add data; and listen to changes
//TODO: Core functions
//TODO: Dispose

import 'dart:async';
import 'Employee.dart';

//List of employee
class EmployeeBloc {
  //Sink is to add in pipe
  //Stream to get data from pipe
  //by pipe i mean data flow here

  //Data
  List<Employee> _employeeList = [
    Employee(1, "Employee One", 10000.0),
    Employee(2, "Employee Two", 20000.0),
    Employee(3, "Employee Three", 30000.0),
    Employee(4, "Employee Four", 40000.0),
    Employee(5, "Employee Five", 50000.0)
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  //for increment and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();


  //Stream sink Getter
  //    int get id =>  this._id;

  //stream
  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;


  //sink
  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;

  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;


  //Constructor

  EmployeeBloc(){
    //May be initialise the data as soon as application loads up

    _employeeListStreamController.add(_employeeList);

    //Listen to changes, we call the stream getters

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);




  }

  //Core functions

  _incrementSalary(Employee employee){

    double salary = employee.salary;

    double incrementedSalary = salary * 20/100;

    //update the object
    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    
    employeeListSink.add(_employeeList);

  }


  _decrementSalary(Employee employee){

    double salary = employee.salary;

    double decrementedSalary = salary * 20/100;

    //update the object
    _employeeList[employee.id - 1].salary = salary - decrementedSalary;

    employeeListSink.add(_employeeList);

  }


  //Dispose ie call all the resources and free the stream
  void dispose(){
      _employeeSalaryIncrementStreamController.close();
      _employeeSalaryDecrementStreamController.close();
      _employeeListStreamController.close();
  }

}
