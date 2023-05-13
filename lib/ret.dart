import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final TextEditingController _docIdController = TextEditingController();
  String? _data;

  Future<void> _getData() async {
    final FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

    final DocumentReference<Map<String, dynamic>> result =
        firestoreInstance.collection('Userdata').doc(_docIdController.text);
    final DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await result.get();
    if (docSnapshot.exists) {
      final Map<String, dynamic> data = docSnapshot.data()!;
      setState(() {
        _data = json.encode(data);
      });
    } else {
      setState(() {
        _data = 'No data found for Username: ${_docIdController.text.trim()}';
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Vault Business'),
          backgroundColor: Color.fromARGB(255, 255, 184, 0),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _docIdController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Username',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _getData();
                },
                child: const Text(
                  'Retrieve Data',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 184, 0),
                ),
              ),
              if (_data != null)
                Column(
                  children: [
                    if (json.decode(_data!) is Map<String, dynamic>)
                      Container(
                        child: Text(
                          'Name: ${(json.decode(_data!) as Map<String, dynamic>)['name']}',
                        ),
                      ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Date of Birth: ${(json.decode(_data!) as Map<String, dynamic>)['Date_of_birth']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Sex: ${(json.decode(_data!) as Map<String, dynamic>)['sex']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Sex: ${(json.decode(_data!) as Map<String, dynamic>)['sex']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Phone: ${(json.decode(_data!) as Map<String, dynamic>)['phone']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Email: ${(json.decode(_data!) as Map<String, dynamic>)['email']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Sex: ${(json.decode(_data!) as Map<String, dynamic>)['sex']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ---------------------------------------------
                    Container(
                      child: Text(
                        'Address: ${(json.decode(_data!) as Map<String, dynamic>)['House_no']},   ${(json.decode(_data!) as Map<String, dynamic>)['Street_cur']},   ${(json.decode(_data!) as Map<String, dynamic>)['locality_cur']},  ${(json.decode(_data!) as Map<String, dynamic>)['town_cur']},  ${(json.decode(_data!) as Map<String, dynamic>)['district_cur']},  ${(json.decode(_data!) as Map<String, dynamic>)['State_cur']},  ${(json.decode(_data!) as Map<String, dynamic>)['Country_bu']}  ${(json.decode(_data!) as Map<String, dynamic>)['Pin_cur']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // -------------------------------------------------
                    Container(
                      child: Text(
                        'Address: ${(json.decode(_data!) as Map<String, dynamic>)['building_bu']},   ${(json.decode(_data!) as Map<String, dynamic>)['Street_bu']},   ${(json.decode(_data!) as Map<String, dynamic>)['locality_bu']},  ${(json.decode(_data!) as Map<String, dynamic>)['town_bu']},  ${(json.decode(_data!) as Map<String, dynamic>)['district_bu']},  ${(json.decode(_data!) as Map<String, dynamic>)['State_bu']},  ${(json.decode(_data!) as Map<String, dynamic>)['Country_bu']}  ${(json.decode(_data!) as Map<String, dynamic>)['Pin_bu']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // -----------------------------------------------------------
                    Container(
                      child: Text(
                        'Aadhaar: ${(json.decode(_data!) as Map<String, dynamic>)['aadhaar_number']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Pan: ${(json.decode(_data!) as Map<String, dynamic>)['pan_number']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Voter ID: ${(json.decode(_data!) as Map<String, dynamic>)['voter']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Driving ID: ${(json.decode(_data!) as Map<String, dynamic>)['driving']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Digilocker ID: ${(json.decode(_data!) as Map<String, dynamic>)['digilocker']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Passport ID: ${(json.decode(_data!) as Map<String, dynamic>)['passport']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // ------------------------------------------------
                    Container(
                      child: Text(
                        'Blood type: ${(json.decode(_data!) as Map<String, dynamic>)['blood']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      child: Text(
                        'Height: ${(json.decode(_data!) as Map<String, dynamic>)['blood']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Weight: ${(json.decode(_data!) as Map<String, dynamic>)['Weight']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Medical Conditions: ${(json.decode(_data!) as Map<String, dynamic>)['medical_condition']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'BMI: ${(json.decode(_data!) as Map<String, dynamic>)['bmi']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Allergies: ${(json.decode(_data!) as Map<String, dynamic>)['allergies']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Bank Name: ${(json.decode(_data!) as Map<String, dynamic>)['bank_name']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Branch: ${(json.decode(_data!) as Map<String, dynamic>)['branch']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Account Number: ${(json.decode(_data!) as Map<String, dynamic>)['account_number']}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        'Ifsc: ${(json.decode(_data!) as Map<String, dynamic>)['ifsc_code']}',
                      ),
                    ),
                  ],
                ),
            ],
          )),
        ));
  }
}
