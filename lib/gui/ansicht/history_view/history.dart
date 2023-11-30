
// import '../../../data/models/models.dart';

// class HistoryView extends ConsumerWidget {
//   const HistoryView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final appStateProvider = ref.read(refAppStateProvider.notifier);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 9,
//         title: const Text(
//           'Währungsumrechner',
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 35,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 200,
//                     ),
//                   ),
//                   InkWell(
//                     child: Container(
//                       height: 55,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.indigo[100],
//                         borderRadius: BorderRadius.circular(100),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.indigo.withOpacity(0.2),
//                             spreadRadius: 4,
//                             blurRadius: 100,
//                             offset: const Offset(2, 1),
//                           )
//                         ],
//                       ),
//                       child: const Center(
//                         //!like button
//                         child: Text(
//                           '❤',
//                           style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       //perform action on like button click
//                     },
//                   ),
//                   Expanded(
//                     flex: 0,
//                     child: InkWell(
//                       child: Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Colors.indigo[100],
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(color: Colors.indigo),
//                         ),
//                         child: const Row(
//                           children: [
//                             Text(
//                               'Switch Currencies',
//                               style: TextStyle(
//                                 color: Colors.indigo,
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       onTap: () {
//                         appStateProvider.switchFromTo();
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ..._buildHistory(context, appStateProvider.history),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.currency_exchange),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//         currentIndex: 1,
//         onTap: (index) {
//           // switch screen based on index
//         },
//       ),
//     );
//   }

//   List<Widget> _buildHistory(BuildContext context, List<HistoryEntry> history) {
//     return history.map((entry) {
//       return Container(
//         height: 50,
//         width: double.infinity,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               entry.from,
//               style: TextStyle(
//                 fontSize: 