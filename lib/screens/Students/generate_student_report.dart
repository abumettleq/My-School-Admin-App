import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:my_school_admin_app/Provider/people_provider.dart';
import 'package:provider/provider.dart';

class StudentReport extends StatelessWidget {
  const StudentReport({super.key, required this.studentId});

  final String studentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student's $studentId Report"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProfileSection(),
              const SizedBox(height: 20),
              _buildResultsTable(),
              const SizedBox(height: 20),
              _buildAttendance(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Consumer<PeopleProvider>(builder: (context, peopleProvider, child) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(peopleProvider.studentReport.student.image),
                    radius: 40,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${peopleProvider.studentReport.student.studentName} ${peopleProvider.studentReport.student.fatherName}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(peopleProvider.studentReport.student.currentClass),
                      Text(peopleProvider.studentReport.student.academicYear),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('Student ID: ${peopleProvider.studentReport.student.studentID}'),
              Text('Email: ${peopleProvider.studentReport.student.email}'),
              Text('Phone: ${peopleProvider.studentReport.student.phoneNumber}'),
              Text('Address: ${peopleProvider.studentReport.student.address}'),
              Text('Birthday: ${peopleProvider.studentReport.student.birthday}'),
              Text('Blood Group: ${peopleProvider.studentReport.student.bloodGroup}'),
              Text('Gender: ${peopleProvider.studentReport.student.gender}'),
              Text('Father: ${peopleProvider.studentReport.student.fatherName}'),
              Text('Mother: ${peopleProvider.studentReport.student.motherName}'),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildResultsTable() {
    return Consumer<PeopleProvider>(builder: (context, peopleProvider, child) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Results',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Table(
                border: TableBorder.all(),
                children: peopleProvider.studentReport.results.entries.map((entry) {
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.key),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry.value.toString()),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildAttendance() {
    return Consumer<PeopleProvider>(builder: (context, peopleProvider, child) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Attendance',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: peopleProvider.studentReport.attendance.length,
                  itemBuilder: (context, index)
                  {
                    return Text(
                      "Date: ${peopleProvider.studentReport.attendance[index].attendanceDate}, Day: ${peopleProvider.studentReport.attendance[index].weekday}, Status: ${peopleProvider.studentReport.attendance[index].statusGiven}"
                    );
                  }
                )
              ),
            ],
          ),
        ),
      );
    });
  }
}
