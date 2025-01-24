import 'package:application/model/student.dart';
import 'package:application/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListSiswaPages extends StatefulWidget {
  const ListSiswaPages({super.key});

  @override
  State<ListSiswaPages> createState() => _ListSiswaState();
}

class _ListSiswaState extends State<ListSiswaPages> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController classesController = TextEditingController();
  final TextEditingController majorController = TextEditingController();
  final List<Student> _students = [];    

  void _addStudent() {
    setState(() {
      if (firstNameController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          classesController.text.isEmpty ||
          majorController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black,
              ),
              child: Center(child: Text("Field Tidak Boleh Kosong")),
            ),
            behavior: SnackBarBehavior.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        );
        return;
      } 
        _students.add(
          Student(
            firstNameController.text,
            lastNameController.text,
            classesController.text,
            majorController.text,
          ),
        );
        firstNameController.clear();
        lastNameController.clear();
        classesController.clear();
        majorController.clear();
    });
  }

  void _editStudent(int index, Student newStudent) {
    setState(() {
      _students[index] = newStudent;
    });
    firstNameController.clear();
    lastNameController.clear();
    classesController.clear();
    majorController.clear();
  }

  void _deleteStudent(int index) {
    setState(() {
      _students.removeAt(index);
    });
  }

  void _showEdit(int index) {
    final student = _students[index];
    firstNameController.text = student.firstName;
    lastNameController.text = student.lastName;
    classesController.text = student.classes;
    majorController.text = student.major;

    showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: const Text("Edit Student"),
            content: Container(
              height: 300,
              width: 200,
              child: Column(
                children: [
                  CustomTextfield(  
                    nama: "First Name",
                    controller: firstNameController,
                    typekeyboard: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    nama: "Last Name",
                    controller: lastNameController,
                    typekeyboard: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    nama: "classes",
                    controller: classesController,
                    typekeyboard: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  CustomTextfield(
                    nama: "major",
                    controller: majorController,
                    typekeyboard: TextInputType.name,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  firstNameController.clear();
                  lastNameController.clear();
                  classesController.clear();
                  majorController.clear();
                },
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  _editStudent(
                    index,
                    Student(firstNameController.text, lastNameController.text,
                        classesController.text, majorController.text),
                  );
                  Navigator.pop(context);
                },
                child: const Text("save"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70)
              )
            ),
            child: Center(child: Text("Data Siswa\nBima",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),textAlign: TextAlign.center,),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                CustomTextfield(
                  controller: firstNameController,
                  nama: "First Name",
                  typekeyboard: TextInputType.name,
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: lastNameController,
                  nama: "Last Name",
                  typekeyboard: TextInputType.name,
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: classesController,
                  nama: "Classes",
                  typekeyboard: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextfield(
                  controller: majorController,
                  nama: "Major",
                  typekeyboard: TextInputType.text,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addStudent,
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: _students.length,
                itemBuilder: (context, index) {
                  final students = _students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                       color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Text(
                          "${students.firstName} ${students.lastName}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "${students.classes} ${students.major}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => _showEdit(index),
                              icon: const Icon(Icons.edit,color: Colors.white,),
                            ),
                            IconButton(
                              onPressed: () => _deleteStudent(index),
                              icon: const Icon(Icons.delete,color: Colors.white,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
