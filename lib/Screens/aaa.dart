// if (provider.isIncomeSelected) ...[
// if (provider.calenderRangeTransactionDate.isNotEmpty) ...[
// SizedBox(
// height: MediaQuery.of(context).size.height * 0.1,
// ),
// Stack(
// alignment: Alignment.center,
// children: [
// if (provider.categoryEntries
//     .any((entry) => entry.value > 0)) ...[
// EasyPieChart(
// key: const Key('chart'),
// children: provider.categoryEntries
//     .where((entry) =>
// entry.value > 0)
//     .where((entry) {
// final totalValue = provider.categoryEntries
//     .where((e) =>
// e.value >
// 0)
//     .fold(0.0, (sum, e) => sum + e.value);
//
// final percentage =
// (entry.value / totalValue) * 100;
//
// // Return entries with percentage > 0
// return percentage > 0.0;
// })
//     .map((entry) => PieData(
// value: entry.value,
// color: provider.getColorForEntry(
// entry: entry),
// ))
//     .toList(),
// borderWidth: 70,
// showValue: false,
// animateFromEnd: true,
// borderEdge: StrokeCap.butt,
// pieType: PieType.crust,
// onTap: (index) {
// touchedIndex = index;
// provider.onSelectCategoryItem(
// index: index,
// selectedCategory:
// provider.categoryEntries[index].key,
// );
// setState(() {});
// },
// gap: 0.03,
// start: 0,
// size: 240,
// ),
// // Center text with dynamic category name and total amount
// Container(
// width: 150,
// height: 155,
// decoration: BoxDecoration(
// border: Border.all(
// width: 12,
// color: touchedIndex != null &&
// touchedIndex! <
// provider.categoryEntries.length
// ? provider.getColorForEntry(
// entry: provider.categoryEntries
//     .elementAt(touchedIndex!),
// )
//     : const Color.fromRGBO(242, 242, 242, 1),
// ),
// shape: BoxShape.circle,
// ),
// child: Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text(
// touchedIndex != null
// ? provider.categoryEntries
//     .elementAt(touchedIndex!)
//     .key
//     .toUpperCase()
//     : "ACTIVE",
// style: const TextStyle(
// color: Colors.black,
// fontSize: 13,
// fontWeight: FontWeight.bold),
// textAlign: TextAlign.center,
// ),
// const SizedBox(height: 10),
// Text(
// touchedIndex != null &&
// touchedIndex! <
// provider
//     .categoryEntries.length
// ? "₹ ${provider.selectedCategoryNameTotalAmount.toStringAsFixed(0)}"
//     : "Outgoing\nTransfers",
// textAlign: TextAlign.center,
// style: const TextStyle(
// color: Colors.black,
// fontWeight: FontWeight.bold,
// fontSize: 18,
// ),
// ),
// ],
// ),
// ),
// ),
// ] else ...[
// // Display message when no positive entries exist
// const Center(
// child: Text(
// "No income available",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color: Colors.red,
// ),
// textAlign: TextAlign.center,
// ),
// ),
// ],
// ],
// ),
// spacing,
// spacing,
// Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Wrap(
// alignment: WrapAlignment.start,
// runSpacing: 15.0,
// spacing: MediaQuery.of(context).size.width * 0.042,
// children: List.generate(
// (provider.showAll == false)
// ? provider.categoryEntries.take(10).length
//     : provider.categoryEntries.length,
// (int index) {
// final entry = provider.categoryEntries[index];
// String category = entry.key;
// String categoryName = category;
// if (category.startsWith('Transfer to')) {
// categoryName = category
//     .replaceFirst('Transfer to', '')
//     .trim();
// } else if (category
//     .startsWith('Transfer from')) {
// categoryName = category
//     .replaceFirst('Transfer from', '')
//     .trim();
// }
//
// int percentage = entry.value.truncate() > 0
// ? entry.value.truncate()
//     : 0;
//
// if (percentage <= 0) {
// return const SizedBox.shrink();
// }
//
// return GestureDetector(
// onTap: () {
// touchedIndex = index;
// provider.onSelectCategoryItem(
// index: index,
// selectedCategory: entry.key,
// );
// setState(() {});
// },
// child: SizedBox(
// width:
// MediaQuery.of(context).size.width / 1 -
// 2,
// child: Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceEvenly,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// width: MediaQuery.of(context)
//     .size
//     .width *
// 0.06,
// height: MediaQuery.of(context)
//     .size
//     .height *
// 0.03,
// decoration: BoxDecoration(
// color: provider.getColorForEntry(
// entry: entry),
// borderRadius:
// BorderRadius.circular(5),
// ),
// ),
// SizedBox(
// width: MediaQuery.of(context)
//     .size
//     .width *
// 0.1,
// ),
// Expanded(
// child: Text(
// categoryName.toUpperCase(),
// overflow: TextOverflow.ellipsis,
// maxLines: 1,
// style: const TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.bold,
// color: Colors.brown),
// ),
// ),
// SizedBox(
// width: MediaQuery.of(context)
//     .size
//     .width *
// 0.01,
// ),
// Text(
// "$percentage %",
// style: const TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color:
// Color.fromRGBO(45, 45, 45, 1),
// ),
// )
// ],
// ),
// ),
// );
// },
// ),
// ),
// ],
// ),
// const SizedBox(
// height: 20,
// ),
// const SizedBox(
// height: 20,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// "FILTER BY CATEGORIES",
// style: style,
// ),
// const SizedBox(
// width: 20,
// ),
// IconButton(
// onPressed: () {
// _showFilterOptionsForIncome(context);
// },
// icon: const Icon(
// Icons.filter,
// size: 32,
// ),
// )
// ],
// ),
// ListView.builder(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// itemCount:
// provider.calenderRangeTransactionDate.length,
// itemBuilder: (context, index) {
// final List<Color> colors = [
// const Color.fromRGBO(168, 226, 156, 1),
// const Color.fromRGBO(226, 211, 156, 1),
// const Color.fromRGBO(195, 247, 236, 1),
// const Color.fromRGBO(239, 183, 234, 1),
// const Color.fromRGBO(154, 175, 225, 1),
// const Color.fromRGBO(180, 224, 241, 1),
// const Color.fromRGBO(229, 210, 239, 1),
// ];
// final Random random = Random();
// final randomColor =
// colors[random.nextInt(colors.length)];
// AccountTransaction transaction =
// provider.calenderRangeTransactionDate[index];
//
// return (transaction.amount ?? 0) > 0
// ? Container(
// padding: const EdgeInsets.all(6),
// decoration: BoxDecoration(
// color: randomColor,
// border: Border.all(
// color: Colors.black,
// width: 0.8,
// ),
// borderRadius: const BorderRadius.only(
// topLeft: Radius.circular(25),
// bottomRight: Radius.circular(25.0)),
// ),
// margin: const EdgeInsets.all(12),
// child: ListTile(
// leading: Icon(
// provider
//     .categoryIcons[
// transaction.category]
//     ?.icon ??
// Icons.other_houses_outlined,
// ),
// title: Text(
// "${transaction.narration}",
// style: style,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// textAlign: TextAlign.start,
// ),
// trailing: Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// Text(
// "₹ ${transaction.amount}",
// style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold,
// color:
// (transaction.amount ?? 0) < 0
// ? Colors.red
//     : Colors.green,
// ),
// ),
// Container(
// padding: const EdgeInsets.all(3),
// margin: const EdgeInsets.all(3),
// decoration: BoxDecoration(
// color: const Color.fromRGBO(
// 234, 240, 240, 2),
// borderRadius:
// BorderRadius.circular(5),
// ),
// child: InkWell(
// onTap: () {
// _showTransactionDetails(context,
// transaction, provider);
// },
// child: Text('View Details ▼',
// style: styles),
// ),
// ),
// ],
// ),
// subtitle: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Flexible(
// child: Text(
// transaction.category ?? '',
// maxLines: 1,
// overflow:
// TextOverflow.ellipsis,
// textAlign: TextAlign.start,
// style: const TextStyle(
// color: Color.fromRGBO(
// 105, 105, 105, 1),
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// const SizedBox(width: 8),
// GestureDetector(
// onTap: () {},
// child: const Icon(
// Icons.edit,
// color: Colors.grey,
// size: 18,
// ),
// ),
// ],
// ),
// const SizedBox(height: 5),
// Text(
// "${transaction.date != null ? DateFormat('dd-MM-yyyy').format(transaction.date!) : transaction.date}",
// style: const TextStyle(
// color: Colors.indigoAccent,
// fontSize: 12,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// )
//     : Container();
// }),
// const SizedBox(
// height: 12,
// ),
// ]
// else ...[
// Column(
// children: [
// const SizedBox(height: 300),
// Text(
// "No Income available for this Month",
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 22,
// color: red),
// ),
// ],
// )
// ]
// ],
// // if (provider.isExpenseSelected) ...[
// // if (provider.calenderRangeTransactionDate.isNotEmpty) ...[
// // SizedBox(
// // height: MediaQuery.of(context).size.height * 0.1,
// // ),
// // Stack(
// // alignment: Alignment.center,
// // children: [
// // if (provider.categoryEntriess
// //     .any((entry) => entry.value < 0)) ...[
// // EasyPieChart(
// // key: const Key('chart'),
// // children: provider.categoryEntriess
// //     .where((entry) =>
// // entry.value < 0)
// //     .where((entry) {
// // final totalValue = provider.categoryEntriess
// //     .where((e) =>
// // e.value <
// // 0)
// //     .fold(0.0, (sum, e) => sum + e.value);
// //
// // final percentage =
// // (entry.value / totalValue) * 100;
// //
// //
// // return percentage < 0.0;
// // })
// //     .map((entry) => PieData(
// // value: entry.value,
// // color: provider.getColorForEntry(
// // entry: entry),
// // ))
// //     .toList(),
// // borderWidth: 70,
// // showValue: false,
// // animateFromEnd: true,
// // borderEdge: StrokeCap.butt,
// // pieType: PieType.crust,
// // onTap: (index) {
// // touchedIndex = index;
// // provider.onSelectCategoryItem(
// // index: index,
// // selectedCategory:
// // provider.categoryEntriess[index].key,
// // );
// // setState(() {});
// // },
// // gap: 0.03,
// // start: 0,
// // size: 240,
// // ),
// // Container(
// // width: 150,
// // height: 155,
// // decoration: BoxDecoration(
// // border: Border.all(
// // width: 12,
// // color: touchedIndex != null &&
// // touchedIndex! <
// // provider.categoryEntriess.length
// // ? provider.getColorForEntry(
// // entry: provider.categoryEntriess
// //     .elementAt(touchedIndex!),
// // )
// //     : const Color.fromRGBO(242, 242, 242, 1),
// // ),
// // shape: BoxShape.circle,
// // ),
// // child: Center(
// // child: Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [
// // Text(
// // touchedIndex != null
// // ? provider.categoryEntriess
// //     .elementAt(touchedIndex!)
// //     .key
// //     .toUpperCase()
// //     : "ACTIVE",
// // style: const TextStyle(
// // color: Colors.black,
// // fontSize: 13,
// // fontWeight: FontWeight.bold),
// // textAlign: TextAlign.center,
// // ),
// // const SizedBox(height: 10),
// // Text(
// // touchedIndex != null &&
// // touchedIndex! <
// // provider
// //     .categoryEntriess.length
// // ? "₹ ${provider.selectedCategoryNameTotalAmount.toStringAsFixed(0)}"
// //     : "Outgoing\nTransfers",
// // textAlign: TextAlign.center,
// // style: const TextStyle(
// // color: Colors.black,
// // fontWeight: FontWeight.bold,
// // fontSize: 18,
// // ),
// // ),
// // ],
// // ),
// // ),
// // ),
// // ] else ...[
// // // Display message when no positive entries exist
// // const Center(
// // child: Text(
// // "No Expense available",
// // style: TextStyle(
// // fontSize: 18,
// // fontWeight: FontWeight.bold,
// // color: Colors.red,
// // ),
// // textAlign: TextAlign.center,
// // ),
// // ),
// // ],
// // ],
// // ),
// // spacing,
// // spacing,
// // Column(
// // mainAxisAlignment: MainAxisAlignment.start,
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Wrap(
// // alignment: WrapAlignment.start,
// // runSpacing: 15.0,
// // spacing: MediaQuery.of(context).size.width * 0.042,
// // children: List.generate(
// // (provider.showAll == false)
// // ? provider.categoryEntriess.take(10).length
// //     : provider.categoryEntriess.length,
// // (int index) {
// // final entry = provider.categoryEntriess[index];
// // String category = entry.key;
// // String categoryName = category;
// // if (category.startsWith('Transfer to')) {
// // categoryName = category
// //     .replaceFirst('Transfer to', '')
// //     .trim();
// // } else if (category
// //     .startsWith('Transfer from')) {
// // categoryName = category
// //     .replaceFirst('Transfer from', '')
// //     .trim();
// // }
// //
// // num percentage = entry.value< 0
// // ? entry.value
// //     : 0;
// //
// // if (percentage <= 0) {
// // return const SizedBox.shrink();
// // }
// //
// // return GestureDetector(
// // onTap: () {
// // touchedIndex = index;
// // provider.onSelectCategoryItem(
// // index: index,
// // selectedCategory: entry.key,
// // );
// // setState(() {});
// // },
// // child: SizedBox(
// // width:
// // MediaQuery.of(context).size.width / 1 -
// // 2,
// // child: Row(
// // mainAxisAlignment:
// // MainAxisAlignment.spaceEvenly,
// // crossAxisAlignment:
// // CrossAxisAlignment.start,
// // children: [
// // Container(
// // width: MediaQuery.of(context)
// //     .size
// //     .width *
// // 0.06,
// // height: MediaQuery.of(context)
// //     .size
// //     .height *
// // 0.03,
// // decoration: BoxDecoration(
// // color: provider.getColorForEntry(
// // entry: entry),
// // borderRadius:
// // BorderRadius.circular(5),
// // ),
// // ),
// // SizedBox(
// // width: MediaQuery.of(context)
// //     .size
// //     .width *
// // 0.1,
// // ),
// // Expanded(
// // child: Text(
// // categoryName.toUpperCase(),
// // overflow: TextOverflow.ellipsis,
// // maxLines: 1,
// // style: const TextStyle(
// // fontSize: 15,
// // fontWeight: FontWeight.bold,
// // color: Colors.brown),
// // ),
// // ),
// // SizedBox(
// // width: MediaQuery.of(context)
// //     .size
// //     .width *
// // 0.01,
// // ),
// // Text(
// // "$percentage %",
// // style: const TextStyle(
// // fontSize: 18,
// // fontWeight: FontWeight.bold,
// // color:
// // Color.fromRGBO(45, 45, 45, 1),
// // ),
// // )
// // ],
// // ),
// // ),
// // );
// // },
// // ),
// // ),
// // ],
// // ),
// // const SizedBox(
// // height: 20,
// // ),
// // const SizedBox(
// // height: 20,
// // ),
// // Row(
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Text(
// // "FILTER BY CATEGORIES",
// // style: style,
// // ),
// // const SizedBox(
// // width: 20,
// // ),
// // IconButton(
// // onPressed: () {
// // _showFilterOptionsForExpense(context);
// // },
// // icon: const Icon(
// // Icons.filter,
// // size: 32,
// // ),
// // )
// // ],
// // ),
// // ListView.builder(
// // shrinkWrap: true,
// // physics: const NeverScrollableScrollPhysics(),
// // itemCount:
// // provider.calenderRangeTransactionDate.length,
// // itemBuilder: (context, index) {
// // final List<Color> colors = [
// // const Color.fromRGBO(168, 226, 156, 1),
// // const Color.fromRGBO(226, 211, 156, 1),
// // const Color.fromRGBO(195, 247, 236, 1),
// // const Color.fromRGBO(239, 183, 234, 1),
// // const Color.fromRGBO(154, 175, 225, 1),
// // const Color.fromRGBO(180, 224, 241, 1),
// // const Color.fromRGBO(229, 210, 239, 1),
// // ];
// // final Random random = Random();
// // final randomColor =
// // colors[random.nextInt(colors.length)];
// // AccountTransaction transaction =
// // provider.calenderRangeTransactionDate[index];
// //
// // return (transaction.amount ?? 0) < 0
// // ? Container(
// // padding: const EdgeInsets.all(6),
// // decoration: BoxDecoration(
// // color: randomColor,
// // border: Border.all(
// // color: Colors.black,
// // width: 0.8,
// // ),
// // borderRadius: const BorderRadius.only(
// // topLeft: Radius.circular(25),
// // bottomRight: Radius.circular(25.0)),
// // ),
// // margin: const EdgeInsets.all(12),
// // child: ListTile(
// // leading: Icon(
// // provider
// //     .categoryIcons[
// // transaction.category]
// //     ?.icon ??
// // Icons.other_houses_outlined,
// // ),
// // title: Text(
// // "${transaction.narration}",
// // style: style,
// // maxLines: 1,
// // overflow: TextOverflow.ellipsis,
// // textAlign: TextAlign.start,
// // ),
// // trailing: Column(
// // mainAxisAlignment:
// // MainAxisAlignment.spaceAround,
// // children: [
// // Text(
// // "₹ ${transaction.amount}",
// // style: TextStyle(
// // fontSize: 18,
// // fontWeight: FontWeight.bold,
// // color:
// // (transaction.amount ?? 0) < 0
// // ? Colors.red
// //     : Colors.green,
// // ),
// // ),
// // Container(
// // padding: const EdgeInsets.all(3),
// // margin: const EdgeInsets.all(3),
// // decoration: BoxDecoration(
// // color: const Color.fromRGBO(
// // 234, 240, 240, 2),
// // borderRadius:
// // BorderRadius.circular(5),
// // ),
// // child: InkWell(
// // onTap: () {
// // _showTransactionDetails(context,
// // transaction, provider);
// // },
// // child: Text('View Details ▼',
// // style: styles),
// // ),
// // ),
// // ],
// // ),
// // subtitle: Column(
// // mainAxisAlignment:
// // MainAxisAlignment.start,
// // crossAxisAlignment:
// // CrossAxisAlignment.start,
// // children: [
// // Row(
// // children: [
// // Flexible(
// // child: Text(
// // transaction.category ?? '',
// // maxLines: 1,
// // overflow:
// // TextOverflow.ellipsis,
// // textAlign: TextAlign.start,
// // style: const TextStyle(
// // color: Color.fromRGBO(
// // 105, 105, 105, 1),
// // fontWeight: FontWeight.bold,
// // ),
// // ),
// // ),
// // const SizedBox(width: 8),
// // GestureDetector(
// // onTap: () {},
// // child: const Icon(
// // Icons.edit,
// // color: Colors.grey,
// // size: 18,
// // ),
// // ),
// // ],
// // ),
// // const SizedBox(height: 5),
// // Text(
// // "${transaction.date != null ? DateFormat('dd-MM-yyyy').format(transaction.date!) : transaction.date}",
// // style: const TextStyle(
// // color: Colors.indigoAccent,
// // fontSize: 12,
// // fontWeight: FontWeight.bold),
// // ),
// // ],
// // ),
// // ),
// // )
// //     : Container();
// // }),
// // const SizedBox(
// // height: 12,
// // ),
// // ]
// // else ...[
// // Column(
// // children: [
// // const SizedBox(height: 300),
// // Text(
// // "No Income available for this Month",
// // style: TextStyle(
// // fontWeight: FontWeight.bold,
// // fontSize: 22,
// // color: red),
// // ),
// // ],
// // )
// // ]
// // ],