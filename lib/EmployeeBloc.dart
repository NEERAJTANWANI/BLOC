//TODO: imports
import 'dart:async';
import 'Employee.dart';
 

//TODO: List Of Employees
class EmployeeBloc {

  //sink to add in pipe
  //stream to get data from pipe
  //by pipe i mean data flow
   
  List<Employee> _employeeList = [
    Employee(1, "Employee 1" , 10000),
    Employee(2, "Employee 2" , 20000),
    Employee(3, "Employee 3" , 30000),
    Employee(4, "Employee 4" , 40000),
    Employee(5, "Employee 5" , 50000),
    Employee(6, "Employee 6" , 60000)
  ];
  
  //TODO: Stream Controllers

  final _employeeListStreamController = StreamController<List<Employee>>();
  
  //for inc and dec

  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  //TODO: Stream Sink Getter

  Stream<List<Employee>> get employeeListStream =>
   _employeeListStreamController.stream;


  StreamSink<List<Employee>> get employeeListSink =>
   _employeeListStreamController.sink;


  StreamSink<Employee> get employeeSalaryIncrement =>
   _employeeSalaryIncrementStreamController.sink;
  
  StreamSink<Employee> get employeeSalaryDecrement =>
   _employeeSalaryDecrementStreamController.sink;

  
  //TODO: Constructor - add data; listen to change

  EmployeeBloc(){
    _employeeListStreamController.add(_employeeList);

    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);

    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);

    //TODO:Core functions

  }

  _incrementSalary(Employee employee){

    double salary = employee.salary;

    double incrementedSalary = salary * 20/100; 

    _employeeList[employee.id -1].salary = salary + incrementedSalary;

    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee){

    double salary = employee.salary;

    
    double decrementedSalary = salary * 20/100; 

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;

    employeeListSink.add(_employeeList);

  }

  //TODO:dispose

   void dispose(){
     _employeeSalaryIncrementStreamController.close();
     _employeeSalaryDecrementStreamController.close();
     _employeeListStreamController.close();
   }
}








