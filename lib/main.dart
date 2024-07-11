import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donor Registration',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BloodDonorForm(),
    );
  }
}

class BloodDonorForm extends StatefulWidget {
  @override
  _BloodDonorFormState createState() => _BloodDonorFormState();
}

class _BloodDonorFormState extends State<BloodDonorForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? name;
  String? usn;
  int? age;
  String? gender;
  String? bloodGroup;
  DateTime? lastDonationDate;
  String? mobileNumber;
  String? additionalMobileNumber;
  String? addressPinCode;
  String? donatedPlatelets;
  int? numberOfDonations;
  String? medicalCondition;
  String? drinksAndSmokes;
  String? willDonate;
  String? experience;
  String? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Donor Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                color: Colors.purple,
                height: 2.0,
              ),
              SizedBox(height: 8),
              Text(
                'Blood Donor Registration',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                '* indicates required question',
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 16),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email ID *',
                    hintText: 'Your answer',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name of the donor *',
                    hintText: 'Your answer',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    name = value;
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'USN *',
                    hintText: 'Your answer',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    usn = value;
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donor Age *',
                    hintText: 'Your answer',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    age = int.tryParse(value!);
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donor Mobile Number *',
                    hintText: 'Your answer',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    mobileNumber = value;
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Donor Additional Mobile Number *',
                    hintText: 'Your answer',
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    additionalMobileNumber = value;
                  },
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address Pin Code *',
                    hintText: 'Your answer',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    addressPinCode = value;
                  },
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donor Gender *', style: TextStyle(fontSize: 16)),
                    Column(
                      children: ['Male', 'Female', 'Non-binary']
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (gender == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Donor Blood Group *', style: TextStyle(fontSize: 16)),
                    Column(
                      children: [
                        'A RhD positive (A+)',
                        'A RhD negative (A-)',
                        'B RhD positive (B+)',
                        'B RhD negative (B-)',
                        'O RhD positive (O+)',
                        'O RhD negative (O-)',
                        'AB RhD positive (AB+)',
                      ]
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: bloodGroup,
                                onChanged: (value) {
                                  setState(() {
                                    bloodGroup = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (bloodGroup == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Last date of donation *',
                    hintText: 'Your answer',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        lastDonationDate = pickedDate;
                      });
                    }
                  },
                  validator: (value) {
                    if (lastDonationDate == null) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  readOnly: true,
                  controller: TextEditingController(
                      text: lastDonationDate == null
                          ? ''
                          : "${lastDonationDate!.toLocal()}".split(' ')[0]),
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Have you donated platelets? *',
                        style: TextStyle(fontSize: 16)),
                    Column(
                      children: ['Yes', 'No']
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: donatedPlatelets,
                                onChanged: (value) {
                                  setState(() {
                                    donatedPlatelets = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (donatedPlatelets == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Number of donations *',
                    hintText: 'Your answer',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    numberOfDonations = int.tryParse(value!);
                  },
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Are you under any medical condition? *',
                        style: TextStyle(fontSize: 16)),
                    Column(
                      children: ['Yes', 'No']
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: medicalCondition,
                                onChanged: (value) {
                                  setState(() {
                                    medicalCondition = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (medicalCondition == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Drinking and smoking? *',
                        style: TextStyle(fontSize: 16)),
                    Column(
                      children: ['Yes', 'No']
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: drinksAndSmokes,
                                onChanged: (value) {
                                  setState(() {
                                    drinksAndSmokes = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (drinksAndSmokes == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Will you donate blood if you stay close to needy? *',
                        style: TextStyle(fontSize: 16)),
                    Column(
                      children: ['Yes', 'No']
                          .map((label) => RadioListTile<String>(
                                title: Text(label),
                                value: label,
                                groupValue: willDonate,
                                onChanged: (value) {
                                  setState(() {
                                    willDonate = value;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    if (willDonate == null)
                      Text(
                        'This is a required question',
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
              buildContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText:
                        'Write a few lines about your blood donation experience',
                    hintText: 'Your answer',
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This is a required question';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    experience = value;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Upload Blood donation photo (for activity points)'),
                    SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          setState(() {
                            filePath = result.files.single.path;
                          });
                        }
                      },
                      icon: Icon(Icons.upload_file),
                      label: Text('Add File'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    if (filePath != null)
                      Text('File selected: ${filePath!.split('/').last}'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process data
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
