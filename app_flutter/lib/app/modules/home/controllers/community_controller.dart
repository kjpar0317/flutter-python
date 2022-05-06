import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CommunityController extends GetxController {
  final RxList<PlutoColumn> _columns = <PlutoColumn>[].obs;
  final RxList<PlutoRow> _rows = <PlutoRow>[].obs;

  RxList<PlutoColumn> get columns => _columns;
  RxList<PlutoRow> get rows => _rows;

  @override
  void onInit() {
    super.onInit();

    _columns.value = [
      /// Text Column definition
      PlutoColumn(
        title: '번호',
        field: 'no',
        width: 80,
        type: PlutoColumnType.number(),
      ),

      /// Number Column definition
      PlutoColumn(
        title: '제목',
        field: 'title',
        type: PlutoColumnType.text(),
      ),

      /// Select Column definition
      // PlutoColumn(
      //   title: 'select column',
      //   field: 'select_field',
      //   type: PlutoColumnType.select(<String>['item1', 'item2', 'item3']),
      // ),

      /// Datetime Column definition
      PlutoColumn(
        title: '날짜',
        field: 'date',
        width: 120,
        type: PlutoColumnType.date(),
      ),

      /// Time Column definition
      // PlutoColumn(
      //   title: 'time column',
      //   field: 'time_field',
      //   type: PlutoColumnType.time(),
      // ),
    ];

    _rows.value = [
      PlutoRow(
        cells: {
          'no': PlutoCell(value: 1),
          'title': PlutoCell(value: '나만 쓰고 싶은 앱'),
          'date': PlutoCell(value: '2020-08-06'),
        },
      ),
    ];
  }

  @override
  void onClose() {}
}
