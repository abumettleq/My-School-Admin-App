import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Model/teacher_model.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ModifySpecificTeacher extends StatefulWidget {
  final TeacherModel teacherModel;

  const ModifySpecificTeacher({Key? key, required this.teacherModel}) : super(key: key);

  @override
  _ModifySpecificTeacherState createState() => _ModifySpecificTeacherState();
}

class _ModifySpecificTeacherState extends State<ModifySpecificTeacher> {
  late TextEditingController _teacherIdController;
  late TextEditingController _nIdController;
  late TextEditingController _fullNameController;
  late TextEditingController _genderController;
  late TextEditingController _birthdateController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _dateOfHireController;
  late TextEditingController _employmentStatusController;
  late TextEditingController _jobTitleController;
  late TextEditingController _degreeHeldController;
  late TextEditingController _salaryController;
  late RoundedLoadingButtonController _btnController;

  @override
  void initState() {
    super.initState();
    _teacherIdController = TextEditingController(text: widget.teacherModel.teacherID);
    _nIdController = TextEditingController(text: widget.teacherModel.nID);
    _fullNameController = TextEditingController(text: widget.teacherModel.fullName);
    _genderController = TextEditingController(text: widget.teacherModel.gender);
    _birthdateController = TextEditingController(text: widget.teacherModel.birthdate);
    _phoneNumberController = TextEditingController(text: widget.teacherModel.phoneNumber);
    _emailController = TextEditingController(text: widget.teacherModel.email);
    _dateOfHireController = TextEditingController(text: widget.teacherModel.dateOfHire);
    _employmentStatusController = TextEditingController(text: widget.teacherModel.employmentStatus);
    _jobTitleController = TextEditingController(text: widget.teacherModel.jobTitle);
    _degreeHeldController = TextEditingController(text: widget.teacherModel.degreeHeld);
    _salaryController = TextEditingController(text: widget.teacherModel.salary);
    _btnController = RoundedLoadingButtonController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modify Teacher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _teacherIdController,
                decoration: const InputDecoration(labelText: 'Teacher ID'),
                enabled: false,
              ),
              TextFormField(
                controller: _nIdController,
                decoration: const InputDecoration(labelText: 'National ID'),
              ),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: _genderController,
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: _birthdateController,
                decoration: const InputDecoration(labelText: 'Birthdate'),
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
                controller: _dateOfHireController,
                decoration: const InputDecoration(labelText: 'Date of Hire'),
              ),
              TextFormField(
                controller: _employmentStatusController,
                decoration: const InputDecoration(labelText: 'Employment Status'),
              ),
              TextFormField(
                controller: _jobTitleController,
                decoration: const InputDecoration(labelText: 'Job Title'),
              ),
              TextFormField(
                controller: _degreeHeldController,
                decoration: const InputDecoration(labelText: 'Degree Held'),
              ),
              TextFormField(
                controller: _salaryController,
                decoration: const InputDecoration(labelText: 'Salary'),
              ),
              const SizedBox(height: 16),
              RoundedLoadingButton(
                onPressed: () {
                  _updateTeacherModel();
                  // Call function to store modified teacher model to Firestore
                },
                controller: _btnController,
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateTeacherModel() async {
    setState(() {
      widget.teacherModel.teacherID = _teacherIdController.text;
      widget.teacherModel.nID = _nIdController.text;
      widget.teacherModel.fullName = _fullNameController.text;
      widget.teacherModel.gender = _genderController.text;
      widget.teacherModel.birthdate = _birthdateController.text;
      widget.teacherModel.phoneNumber = _phoneNumberController.text;
      widget.teacherModel.email = _emailController.text;
      widget.teacherModel.dateOfHire = _dateOfHireController.text;
      widget.teacherModel.employmentStatus = _employmentStatusController.text;
      widget.teacherModel.jobTitle = _jobTitleController.text;
      widget.teacherModel.degreeHeld = _degreeHeldController.text;
      widget.teacherModel.salary = _salaryController.text;
      _btnController.start();
    });

    // Access Firestore and update the document
  try {
    // Get a reference to the Firestore collection
    CollectionReference teachers = FirebaseFirestore.instance.collection('users')
    .doc(widget.teacherModel.teacherID)
    .collection('itemMenu');

    // Update the document with the new teacher model data
    await teachers.doc('profile').update({
      'teacherID': widget.teacherModel.teacherID,
      'nId': widget.teacherModel.nID,
      'full_name': widget.teacherModel.fullName,
      'gender': widget.teacherModel.gender,
      'birthdate': widget.teacherModel.birthdate,
      'phone_number': widget.teacherModel.phoneNumber,
      'email': widget.teacherModel.email,
      'date_of_hire': widget.teacherModel.dateOfHire,
      'employment_status': widget.teacherModel.employmentStatus,
      'job_title': widget.teacherModel.jobTitle,
      'degree_held': widget.teacherModel.degreeHeld,
      'salary': widget.teacherModel.salary,
    });

    // Show a success message or navigate to another page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Teacher information updated successfully!'),
      ),
    );
  } catch (e) {
    // Show an error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to update teacher information: $e'),
      ),
    );
  }

    setState(() {
      _btnController.stop();
    });
  }

  @override
  void dispose() {
    _teacherIdController.dispose();
    _nIdController.dispose();
    _fullNameController.dispose();
    _genderController.dispose();
    _birthdateController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _dateOfHireController.dispose();
    _employmentStatusController.dispose();
    _jobTitleController.dispose();
    _degreeHeldController.dispose();
    _salaryController.dispose();
    super.dispose();
  }
}
