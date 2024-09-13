import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_counter/app/presentation/pages/pages_screen.dart';
import 'app/data/models/page_model.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(PageModelAdapter());
  await Hive.openBox<PageModel>('pages');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerColor: Colors.transparent,
      ),
      home: const PagesScreen(),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Challenges'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.add),
//             onPressed: () {
//               showDialog(
//                 context: context,
//                 builder: (context) => const ChallengeDialog(),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Consumer<ChallengeProvider>(
//         builder: (context, provider, child) {
//           return ListView.builder(
//             itemCount: provider.challenges.length,
//             itemBuilder: (context, index) {
//               final challenge = provider.challenges[index];
//               return ListTile(
//                 title: Text(challenge.type.toString().split('.').last),
//                 subtitle: Text(
//                     '${challenge.beginDate.toLocal()} - ${challenge.endDate.toLocal()}'),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.edit),
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => ChallengeDialog(
//                             challenge: challenge,
//                             index: index,
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {
//                         provider.deleteChallenge(index);
//                       },
//                     ),
//                   ],
//                 ),
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (_) => PagesScreen(challenge: challenge)));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ChallengeDialog extends StatefulWidget {
//   final ChallengeModel? challenge;
//   final int? index;
//
//   const ChallengeDialog({super.key, this.challenge, this.index});
//
//   @override
//   _ChallengeDialogState createState() => _ChallengeDialogState();
// }
//
// class _ChallengeDialogState extends State<ChallengeDialog> {
//   late ChallengeType _selectedType;
//   late DateTime _beginDate;
//   late DateTime _endDate;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.challenge != null) {
//       _selectedType = widget.challenge!.type;
//       _beginDate = widget.challenge!.beginDate;
//       _endDate = widget.challenge!.endDate;
//     } else {
//       _selectedType = ChallengeType.Reading;
//       _beginDate = DateTime.now();
//       _endDate = DateTime.now().add(const Duration(days: 30));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title:
//           Text(widget.challenge == null ? 'Add Challenge' : 'Edit Challenge'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           DropdownButton<ChallengeType>(
//             value: _selectedType,
//             onChanged: (value) {
//               setState(() {
//                 _selectedType = value!;
//               });
//             },
//             items: ChallengeType.values.map((type) {
//               return DropdownMenuItem<ChallengeType>(
//                 value: type,
//                 child: Text(type.toString().split('.').last),
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 10),
//           TextButton(
//             onPressed: () async {
//               final date = await showDatePicker(
//                 context: context,
//                 initialDate: _beginDate,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (date != null) {
//                 setState(() {
//                   _beginDate = date;
//                 });
//               }
//             },
//             child: Text('Select Begin Date: ${_beginDate.toLocal()}'),
//           ),
//           TextButton(
//             onPressed: () async {
//               final date = await showDatePicker(
//                 context: context,
//                 initialDate: _endDate,
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2100),
//               );
//               if (date != null) {
//                 setState(() {
//                   _endDate = date;
//                 });
//               }
//             },
//             child: Text('Select End Date: ${_endDate.toLocal()}'),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             if (widget.challenge == null) {
//               Provider.of<ChallengeProvider>(context, listen: false)
//                   .addChallenge(
//                 ChallengeModel(
//                   type: _selectedType,
//                   beginDate: _beginDate,
//                   endDate: _endDate,
//                   pages: [],
//                 ),
//               );
//             } else {
//               Provider.of<ChallengeProvider>(context, listen: false)
//                   .updateChallenge(
//                 widget.index!,
//                 ChallengeModel(
//                   type: _selectedType,
//                   beginDate: _beginDate,
//                   endDate: _endDate,
//                   pages: widget.challenge!.pages,
//                 ),
//               );
//             }
//             Navigator.of(context).pop();
//           },
//           child: const Text('Save'),
//         ),
//       ],
//     );
//   }
// }
//
// // class PagesScreen extends StatelessWidget {
// //   final ChallengeModel challenge;
// //
// //   const PagesScreen({super.key, required this.challenge});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Pages'),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.add),
// //             onPressed: () {
// //               showDialog(
// //                 context: context,
// //                 builder: (context) => PageDialog(challenge: challenge),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //       body: ListView.builder(
// //         itemCount: challenge.pages.length,
// //         itemBuilder: (context, index) {
// //           final page = challenge.pages[index];
// //           return ListTile(
// //             title: Text(page.name),
// //             subtitle: Text('Page Number: ${page.pageNumber}'),
// //             trailing: Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 IconButton(
// //                   icon: const Icon(Icons.edit),
// //                   onPressed: () {
// //                     showDialog(
// //                       context: context,
// //                       builder: (context) => PageDialog(
// //                           challenge: challenge, page: page, index: index),
// //                     );
// //                   },
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.delete),
// //                   onPressed: () {
// //                     Provider.of<ChallengeProvider>(context, listen: false)
// //                         .deletePage(challenge, index);
// //                   },
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//
// class PageDialog extends StatefulWidget {
//   final ChallengeModel challenge;
//   final PageModel? page;
//   final int? index;
//
//   const PageDialog({super.key, required this.challenge, this.page, this.index});
//
//   @override
//   _PageDialogState createState() => _PageDialogState();
// }

// class _PageDialogState extends State<PageDialog> {
//   late String _name;
//   late int _pageNumber;
//   late int? _firstHalfCount;
//   late int? _secondHalfCount;
//   late int? _firstHalfGoal;
//   late int? _secondHalfGoal;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.page != null) {
//       _name = widget.page!.name;
//       _pageNumber = widget.page!.pageNumber;
//       _firstHalfCount = widget.page!.firstHalfCount;
//       _secondHalfCount = widget.page!.secondHalfCount;
//       _firstHalfGoal = widget.page!.firstHalfGoal;
//       _secondHalfGoal = widget.page!.secondHalfGoal;
//     } else {
//       _name = '';
//       _pageNumber = 1;
//       _firstHalfCount = null;
//       _secondHalfCount = null;
//       _firstHalfGoal = null;
//       _secondHalfGoal = null;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(widget.page == null ? 'Add Page' : 'Edit Page'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             decoration: const InputDecoration(labelText: 'Name'),
//             controller: TextEditingController(text: _name),
//             onChanged: (value) {
//               _name = value;
//             },
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Page Number'),
//             controller: TextEditingController(text: _pageNumber.toString()),
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _pageNumber = int.tryParse(value) ?? _pageNumber;
//             },
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'First Half Count'),
//             controller:
//                 TextEditingController(text: _firstHalfCount?.toString() ?? ''),
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _firstHalfCount = int.tryParse(value);
//             },
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Second Half Count'),
//             controller:
//                 TextEditingController(text: _secondHalfCount?.toString() ?? ''),
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _secondHalfCount = int.tryParse(value);
//             },
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'First Half Goal'),
//             controller:
//                 TextEditingController(text: _firstHalfGoal?.toString() ?? ''),
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _firstHalfGoal = int.tryParse(value);
//             },
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Second Half Goal'),
//             controller:
//                 TextEditingController(text: _secondHalfGoal?.toString() ?? ''),
//             keyboardType: TextInputType.number,
//             onChanged: (value) {
//               _secondHalfGoal = int.tryParse(value);
//             },
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text('Cancel'),
//         ),
//         TextButton(
//           onPressed: () {
//             final newPage = PageModel(
//               name: _name,
//               pageNumber: _pageNumber,
//               firstHalfCount: _firstHalfCount,
//               secondHalfCount: _secondHalfCount,
//               firstHalfGoal: _firstHalfGoal,
//               secondHalfGoal: _secondHalfGoal,
//             );
//
//             if (widget.page == null) {
//               Provider.of<ChallengeProvider>(context, listen: false)
//                   .addPage(widget.challenge, newPage);
//             } else {
//               Provider.of<ChallengeProvider>(context, listen: false)
//                   .updatePage(widget.challenge, widget.index!, newPage);
//             }
//
//             Navigator.of(context).pop();
//           },
//           child: const Text('Save'),
//         ),
//       ],
//     );
//   }
// }
//
// class ChallengeProvider with ChangeNotifier {
//   final Box<ChallengeModel> _challengeBox =
//       Hive.box<ChallengeModel>('challenges');
//
//   List<ChallengeModel> get challenges => _challengeBox.values.toList();
//
//   void addChallenge(ChallengeModel challenge) {
//     _challengeBox.add(challenge);
//     notifyListeners();
//   }
//
//   void updateChallenge(int index, ChallengeModel updatedChallenge) {
//     _challengeBox.putAt(index, updatedChallenge);
//     notifyListeners();
//   }
//
//   void deleteChallenge(int index) {
//     _challengeBox.deleteAt(index);
//     notifyListeners();
//   }
//
//   void addPage(ChallengeModel challenge, PageModel page) {
//     challenge.pages.add(page);
//     final index = challenges.indexOf(challenge);
//     updateChallenge(index, challenge);
//   }
//
//   void updatePage(
//       ChallengeModel challenge, int pageIndex, PageModel updatedPage) {
//     challenge.pages[pageIndex] = updatedPage;
//     final index = challenges.indexOf(challenge);
//     updateChallenge(index, challenge);
//   }
//
//   void deletePage(ChallengeModel challenge, int pageIndex) {
//     challenge.pages.removeAt(pageIndex);
//     final index = challenges.indexOf(challenge);
//     updateChallenge(index, challenge);
//   }
// }
