// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:my_school_admin_app/Provider/people_provider.dart';
// import 'package:provider/provider.dart';

// class StudentReport extends StatelessWidget {
//   const StudentReport({super.key, required this.studentId});

//   final String studentId;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Student's $studentId Report"),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               _buildProfileSection(),
//               const SizedBox(height: 20),
//               _buildResultsTable(),
//               const SizedBox(height: 20),
//               _buildAttendanceChart(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileSection() {
//     return Consumer<PeopleProvider>(
//       builder: (context, peopleProvider, child) {
//         return Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage(student.image),
//                       radius: 40,
//                     ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           student.name,
//                           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                         Text(student.currentClass),
//                         Text(student.academicYear),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Text('Student ID: ${student.studentID}'),
//                 Text('Email: ${student.email}'),
//                 Text('Phone: ${student.phoneNumber}'),
//                 Text('Address: ${student.address}'),
//                 Text('Birthday: ${student.birthday.toLocal()}'.split(' ')[0]),
//                 Text('Blood Group: ${student.bloodGroup}'),
//                 Text('Gender: ${student.gender}'),
//                 Text('Father: ${student.fatherName}'),
//                 Text('Mother: ${student.motherName}'),
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }

//   Widget _buildResultsTable() {
//     return Consumer<PeopleProvider>(
//       builder: (context, peopleProvider, child) {
//         return Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text(
//                   'Results',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),
//                 Table(
//                   border: TableBorder.all(),
//                   children: results.entries.map((entry) {
//                     return TableRow(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(entry.key),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(entry.value.toString()),
//                         ),
//                       ],
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }

//   Widget _buildAttendanceChart() {
//     return Consumer<PeopleProvider>(
//       builder: (context, peopleProvider, child) {
//         return Card(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const Text(
//                   'Attendance',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   height: 200,
//                   child: PieChart(
//                     PieChartData(
//                       sections: attendance.entries.map((entry) {
//                         return PieChartSectionData(
//                           color: entry.key == 'Present'
//                               ? Colors.green
//                               : entry.key == 'Late'
//                                   ? Colors.yellow
//                                   : Colors.red,
//                           value: entry.value,
//                           title: '${entry.key}: ${entry.value}%',
//                           radius: 100,
//                           titleStyle: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xffffffff),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
