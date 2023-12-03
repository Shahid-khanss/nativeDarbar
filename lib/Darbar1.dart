/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
// Map<String, dynamic> json = {
//   "tables": [
//     {
//       "active": false,
//       "tableno": "1",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "2",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "3",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         },
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "4",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "5",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "6",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "7",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "8",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "9",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//     {
//       "active": false,
//       "tableno": "10",
//       "items": [
//         {
//           "dish": "",
//           "rate": "",
//           "qty": 1,
//         }
//       ],
//       "total": ""
//     },
//   ]
// };

class Item {
  String? dish;
  int? rate;
  int? qty;
  int? amount;

  Item({this.dish, this.rate, this.qty, this.amount});

  Item.fromJson(Map<String, dynamic> json) {
    dish = json['dish'];
    rate = json['rate'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dish'] = dish;
    data['rate'] = rate;
    data['qty'] = qty;
    return data;
  }
}

class DartState {
  List<DartTable?>? tables;

  DartState({this.tables});

  DartState.fromJson(Map<String, dynamic> json) {
    if (json['tables'] != null) {
      tables = <DartTable>[];
      json['tables'].forEach((v) {
        tables!.add(DartTable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['tables'] =
        tables != null ? tables!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class DartTable {
  bool? active;
  int? tableno;
  List<Item?>? items;
  int total = 0;

  DartTable({this.active, this.tableno, this.items});

  DartTable.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    tableno = json['tableno'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    total = json['total'];
  }

  getTotal() {
    total = 0;
    if (items != null) {
      items?.forEach((item) {
        total = (item?.amount)! + total;
      });
    } else {
      total = 0;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['active'] = active;
    data['tableno'] = tableno;
    data['items'] =
        items != null ? items!.map((v) => v?.toJson()).toList() : null;
    data['total'] = total;
    return data;
  }
}
