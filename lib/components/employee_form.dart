import 'package:flutter/material.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class EmployeeForm extends StatefulWidget {
  const EmployeeForm({super.key});

  @override
  State<EmployeeForm> createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _locationController = TextEditingController();
  final _obscure = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                children: <Widget>[
                  Text(
                    "Employee Form",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                children: <Widget>[
                  InputField(
                    label: "Name",
                    obscure: _obscure,
                    hintText: "Enter Name",
                    controller: _nameController,
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "Age",
                    obscure: _obscure,
                    hintText: "Enter Age",
                    controller: _ageController,
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    label: "Location",
                    obscure: _obscure,
                    hintText: "Enter Location",
                    controller: _locationController,
                  ),
                  const SizedBox(height: 50),
                  Button(
                    label: "Submit",
                    buttonBgColor: Colors.yellow,
                    onPressed: () async {
                      String id = randomAlphaNumeric(10);

                      Map<String, dynamic> employeeData = {
                        "name": _nameController.text,
                        "age": _ageController.text,
                        "id": id,
                        "location": _locationController.text
                      };

                      await authProvider.addEmployeeDetails(
                        employeeData,
                        id,
                        context,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
