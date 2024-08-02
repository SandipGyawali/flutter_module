import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_m/auth.dart';
import 'package:flutter_m/components/button.dart';
import 'package:flutter_m/components/input_field.dart';
import 'package:flutter_m/provider/auth_provider.dart';
import 'package:flutter_m/routes/route_consts.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Stream? employeeStream;
  late BuildContext _scaffoldContext;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scaffoldContext = context;
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    employeeStream = await Auth().getEmployeeDetails();
    setState(() {});
  }

  Widget allEmployeeDetails() {
    return StreamBuilder(
      stream: employeeStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(child: Text('No data available'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.docs[index];
              return Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white70,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 20,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name: ${ds["name"]}",
                                    style: TextStyle(
                                      color: Colors.yellow.shade600,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        child: const HugeIcon(
                                          icon: HugeIcons
                                              .strokeRoundedPencilEdit01,
                                          color: Color(0xff7DCD9A),
                                          size: 20,
                                        ),
                                        onTap: () {
                                          EditEmployeeDetail(
                                            "${ds["id"]}",
                                            "${ds["name"]}",
                                            "${ds["age"]}",
                                            "${ds["location"]}",
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 15),
                                      GestureDetector(
                                        child: HugeIcon(
                                          icon: HugeIcons.strokeRoundedDelete02,
                                          color: Colors.red.shade300,
                                          size: 20,
                                        ),
                                        onTap: () async {
                                          await AuthProvider()
                                              .deleteEmployeeDetail(
                                            "${ds["id"]}",
                                            _scaffoldContext,
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                "Age: ${ds["age"]}",
                                style: TextStyle(
                                  color: Colors.blue.shade300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Location: ${ds["location"]}",
                                style: TextStyle(
                                  color: Colors.red.shade300,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              children: <Widget>[
                Text(
                  "Flutter Module",
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
          Expanded(child: allEmployeeDetails()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          GoRouter.of(context).pushNamed(MyAppRouteConstants.employeeForm);
        },
        child: const HugeIcon(
          icon: HugeIcons.strokeRoundedAdd01,
          color: Colors.black,
          size: 24.0,
        ),
      ),
    );
  }

  Future EditEmployeeDetail(
    String id,
    String name,
    String age,
    String location,
  ) {
    final TextEditingController _nameController =
        TextEditingController(text: name);
    final TextEditingController _ageController =
        TextEditingController(text: age);
    final TextEditingController _locationController =
        TextEditingController(text: location);

    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: false,
      constraints: const BoxConstraints.expand(),
      enableDrag: true,
      context: context,
      builder: (index) {
        bool _obscure = false;

        return Container(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Edit Employee Data",
                        style: TextStyle(
                          color: Colors.green.shade300,
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 30),
                  Button(
                    label: "Submit",
                    buttonBgColor: Colors.yellow,
                    onPressed: () async {
                      Map<String, dynamic> employeeData = {
                        "name": _nameController.text,
                        "age": _ageController.text,
                        "id": id,
                        "location": _locationController.text
                      };

                      await AuthProvider()
                          .updateEmployeeDetail(employeeData, id, context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
