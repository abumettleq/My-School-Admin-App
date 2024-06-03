import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/student_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ModifySpecificStudent extends StatefulWidget {
  final StudentModel studentModel;

  const ModifySpecificStudent({Key? key, required this.studentModel})
      : super(key: key);

  @override
  _ModifySpecificStudentState createState() => _ModifySpecificStudentState();
}

class _ModifySpecificStudentState extends State<ModifySpecificStudent> {
  late TextEditingController _studentIdController;
  late TextEditingController _studentNameController;
  late TextEditingController _fatherNameController;
  late TextEditingController _motherNameController;
  late TextEditingController _genderController;
  late TextEditingController _birthdayController;
  late TextEditingController _bloodGroupController;
  late TextEditingController _addressController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _academicYearController;
  late TextEditingController _currentClassController;
  late RoundedLoadingButtonController _btnController;

  @override
  void initState() {
    super.initState();
    _studentIdController =
        TextEditingController(text: widget.studentModel.studentID);
    _studentNameController =
        TextEditingController(text: widget.studentModel.studentName);
    _fatherNameController =
        TextEditingController(text: widget.studentModel.fatherName);
    _motherNameController =
        TextEditingController(text: widget.studentModel.motherName);
    _genderController = TextEditingController(text: widget.studentModel.gender);
    _birthdayController =
        TextEditingController(text: widget.studentModel.birthday);
    _bloodGroupController =
        TextEditingController(text: widget.studentModel.bloodGroup);
    _addressController =
        TextEditingController(text: widget.studentModel.address);
    _phoneNumberController =
        TextEditingController(text: widget.studentModel.phoneNumber);
    _emailController = TextEditingController(text: widget.studentModel.email);
    _academicYearController =
        TextEditingController(text: widget.studentModel.academicYear);
    _currentClassController =
        TextEditingController(text: widget.studentModel.currentClass);
    _btnController = RoundedLoadingButtonController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _studentIdController,
              decoration: const InputDecoration(labelText: 'Student ID'),
              enabled: false,
            ),
            TextFormField(
              controller: _studentNameController,
              decoration: const InputDecoration(labelText: 'Student Name'),
            ),
            TextFormField(
              controller: _fatherNameController,
              decoration: const InputDecoration(labelText: "Father's Name"),
            ),
            TextFormField(
              controller: _motherNameController,
              decoration: const InputDecoration(labelText: "Mother's Name"),
            ),
            TextFormField(
              controller: _genderController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            TextFormField(
              controller: _birthdayController,
              decoration: const InputDecoration(labelText: 'Birthday'),
            ),
            TextFormField(
              controller: _bloodGroupController,
              decoration: const InputDecoration(labelText: 'Blood Group'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _academicYearController,
              decoration: const InputDecoration(labelText: 'Academic Year'),
            ),
            TextFormField(
              controller: _currentClassController,
              decoration: const InputDecoration(labelText: 'Current Class'),
            ),
            const SizedBox(height: 16),
            RoundedLoadingButton(
              onPressed: () {
                _updateStudentModel();
                // Call function to store modified student model to Firebase
              },
              controller: _btnController,
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateStudentModel() async {
    // Update the student model with the new values
    setState(() {
      widget.studentModel.studentID = _studentIdController.text;
      widget.studentModel.studentName = _studentNameController.text;
      widget.studentModel.fatherName = _fatherNameController.text;
      widget.studentModel.motherName = _motherNameController.text;
      widget.studentModel.gender = _genderController.text;
      widget.studentModel.birthday = _birthdayController.text;
      widget.studentModel.bloodGroup = _bloodGroupController.text;
      widget.studentModel.address = _addressController.text;
      widget.studentModel.phoneNumber = _phoneNumberController.text;
      widget.studentModel.email = _emailController.text;
      widget.studentModel.academicYear = _academicYearController.text;
      widget.studentModel.currentClass = _currentClassController.text;
      _btnController.start();
    });

    // Access Firestore and update the document
    try {
      // Get a reference to the Firestore collection
      CollectionReference students = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.studentModel.studentID)
          .collection('itemMenu');

      // Update the document with the new student model data
      await students.doc('profile').update({
        'name': widget.studentModel.studentName,
        'father_name': widget.studentModel.fatherName,
        'address': widget.studentModel.address,
        'current_class': widget.studentModel.currentClass,
        'phone_number': widget.studentModel.phoneNumber,
      });

      // Show a success message or navigate to another page
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Student data updated successfully!'),
        ),
      );
    } catch (e) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update student data: $e'),
        ),
      );
    }

    setState(() {
      _btnController.stop();
    });
  }

  @override
  void dispose() {
    _studentIdController.dispose();
    _studentNameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _genderController.dispose();
    _birthdayController.dispose();
    _bloodGroupController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _academicYearController.dispose();
    _currentClassController.dispose();
    super.dispose();
  }
}
