import 'package:flutter/material.dart';
import 'package:native_darbar/Darbar1.dart';
import 'package:native_darbar/Menu1.dart';

DartState myDartState =
    DartState(); // initialize here to make it global variable

// I want 10 instances of table and add it to tables i.e. myDartState.tables.add(10 instances of table)
// But first we have to initialize the empty array because presently it is null so myDartState.tables =[];
// Everything in the myDartState is presently null;
// to make 10 instances of table i have to make a loop in voidmain()
stateBuilder() {
  for (int i = 0; i < 10; i++) {
    DartTable table = DartTable();
    table.tableno = (i + 1);
    table.active = false;
    table.items = [];

//-----------creating static values for testing-------------

    if (i == 0) {
      Item item = Item();
      item.dish = "paneer tikka";
      item.rate = 100;
      item.qty = 1;
      item.amount = 100;

      table.items?.add(item);
    }

//---------------------------------------------------------

    table.getTotal();
    if (myDartState.tables == null) {
      myDartState.tables = [];
    }
    myDartState.tables?.add(table);
  }
}

// Darbar state = Darbar();
// Menu menu = Menu();
// bool clicked = false;
late int tableno;
List<Item> sortedList = [];
// int count = 0;

// this is value notifier i.e. we can listen to changes.
// to get the value use clicked.value i.e. getter.
// to set use assign clicked.calue i.e. setter.
// Now we can setState of any stateful widget by adding listener
// clicke.addListener(setState(){ comments})
// Method is on the flutter website.

ValueNotifier<bool> clicked = ValueNotifier<bool>(false);

// List myState = state.getState();
// List list = menu.getList();
// var dipatch = state.dispatch();

//---------------------Menu List---------------------------------------------------------------------------->
Map<String, dynamic> jsonList = {
  "items": [
    {"dish": "Chicken Tikka (H)", "rate": 160},
    {"dish": "Chicken Tikka (F)", "rate": 300},
    {"dish": "Chicken Tangri (Q)", "rate": 110},
    {"dish": "Chicken Tangri (H)", "rate": 220},
    {"dish": "Chicken Tangri (F)", "rate": 420},
    {"dish": "Chicken Kabab (Q)", "rate": 130},
    {"dish": "Chicken Kabab (H)", "rate": 220},
    {"dish": "Chicken Kabab (F)", "rate": 440},
    {"dish": "Chicken Fry (Q)", "rate": 140},
    {"dish": "Chicken Fry (H)", "rate": 260},
    {"dish": "Chicken Fry (F)", "rate": 500},
    {"dish": "Chicken Tandoori (Q)", "rate": 150},
    {"dish": "Chicken Tandoori (H)", "rate": 270},
    {"dish": "Chicken Tandoori (F)", "rate": 530},
    {"dish": "Chicken Burra (Q)", "rate": 160},
    {"dish": "Chicken Burra (H)", "rate": 290},
    {"dish": "Chicken Burra (F)", "rate": 550},
    {"dish": "Chicken M Tikka (Q)", "rate": 180},
    {"dish": "Chicken M Tikka (H)", "rate": 340},
    {"dish": "Chicken M Tikka (F)", "rate": 650},
    {"dish": "Chicken Afghani (Q)", "rate": 180},
    {"dish": "Chicken Afghani (H)", "rate": 350},
    {"dish": "Chicken Afghani (F)", "rate": 650},
    {"dish": "Tandoori Chap (Q)", "rate": 130},
    {"dish": "Tandoori Chap (H)", "rate": 250},
    {"dish": "Tandoori Chap (F)", "rate": 360},
    {"dish": "Afghani Chap (Q)", "rate": 150},
    {"dish": "Afghani Chap (H)", "rate": 260},
    {"dish": "Afghani Chap (F)", "rate": 380},
    {"dish": "Paneer Tikka (H) ", "rate": 200},
    {"dish": "Paneer Tikka (F) ", "rate": 350},
    {"dish": "Mutton Kabab (H)", "rate": 250},
    {"dish": "Mutton Kabab (F)", "rate": 480},
    {"dish": "Mutton Boti (H)", "rate": 280},
    {"dish": "Mutton Boti (F)", "rate": 500},
    {"dish": "Mutton Burra (H)", "rate": 480},
    {"dish": "Mutton Burra (F)", "rate": 900},
    {"dish": "Chicken Curry (H)", "rate": 220},
    {"dish": "Chicken Curry (F)", "rate": 420},
    {"dish": "Chicken Korma (H)", "rate": 280},
    {"dish": "Chicken Korma (F)", "rate": 530},
    {"dish": "Chicken Kadhai (H)", "rate": 300},
    {"dish": "Chicken Kadhai (F)", "rate": 550},
    {"dish": "Chicken Stew (H)", "rate": 280},
    {"dish": "Chicken Stew (F)", "rate": 530},
    {"dish": "Chicken Masala (H)", "rate": 300},
    {"dish": "Chicken Masala (F)", "rate": 550},
    {"dish": "Chicken T Masala (H)", "rate": 350},
    {"dish": "Chicken T Masala (F)", "rate": 620},
    {"dish": "Chicken K Mirch (H)", "rate": 300},
    {"dish": "Chicken K Mirch (F)", "rate": 580},
    {"dish": "Chicken Achari (H)", "rate": 280},
    {"dish": "Chicken Achari (F)", "rate": 530},
    {"dish": "Butter Chicken (H)", "rate": 320},
    {"dish": "Butter Chicken (F)", "rate": 580},
    {"dish": "Butter Ch M (H)", "rate": 280},
    {"dish": "Butter Ch M (F)", "rate": 530},
    {"dish": "Chicken Handi (H)", "rate": 380},
    {"dish": "Chicken Handi (F)", "rate": 740},
    {"dish": "Chicken Angara (H)", "rate": 380},
    {"dish": "Chicken Angara (F)", "rate": 690},
    {"dish": "Chicken Lababdar (H)", "rate": 350},
    {"dish": "Chicken Lababdar (F)", "rate": 660},
    {"dish": "Chicken Jahangiri (H)", "rate": 350},
    {"dish": "Chicken Jahangiri (F)", "rate": 660},
    {"dish": "Chicken Changezi (H)", "rate": 350},
    {"dish": "Chicken Changezi (F)", "rate": 550},
    {"dish": "Yellow Dal Tadka (Q)", "rate": 120},
    {"dish": "Jeera Aloo Dry (H)", "rate": 150},
    {"dish": "Egg Curry (H)", "rate": 150},
    {"dish": "Egg Curry (F)", "rate": 290},
    {"dish": "Dal Makhni (H)", "rate": 120},
    {"dish": "Dal Makhni (F)", "rate": 180},
    {"dish": "Mix Veg (H)", "rate": 180},
    {"dish": "Mix Veg (F)", "rate": 320},
    {"dish": "Matar Paneer (H)", "rate": 180},
    {"dish": "Matar Paneer (F)", "rate": 320},
    {"dish": "Dum Aloo (H)", "rate": 160},
    {"dish": "Shahi Paneer (H)", "rate": 180},
    {"dish": "Shahi Paneer (F)", "rate": 320},
    {"dish": "Kadhai Paneer (H)", "rate": 180},
    {"dish": "Kadhai Paneer (F)", "rate": 320},
    {"dish": "Paneer B Masala (H)", "rate": 180},
    {"dish": "Paneer B Masala (F)", "rate": 320},
    {"dish": "Paneer Lababdar (H)", "rate": 180},
    {"dish": "Paneer Lababdar (F)", "rate": 320},
    {"dish": "Soya Chap Masala (H)", "rate": 180},
    {"dish": "Soya Chap Masala (F)", "rate": 320},
    {"dish": "Malai Chap (H)", "rate": 180},
    {"dish": "Malai Chap (F)", "rate": 320},
    {"dish": "Kadhai Soya Chap (H)", "rate": 180},
    {"dish": "Kadhai Soya Chap (F)", "rate": 320},
    {"dish": "Paneer Bhurji (H)", "rate": 200},
    {"dish": "Paneer Bhurji (F)", "rate": 340},
    {"dish": "Chilli Paneer (H)", "rate": 180},
    {"dish": "Chilli Paneer (F)", "rate": 320},
    {"dish": "Mutton Stew (Q)", "rate": 230},
    {"dish": "Mutton Stew (H)", "rate": 500},
    {"dish": "Mutton Stew (F)", "rate": 700},
    {"dish": "Mutton Korma (Q)", "rate": 230},
    {"dish": "Mutton Korma (H)", "rate": 450},
    {"dish": "Mutton Korma (F)", "rate": 650},
    {"dish": "Mutton Kadhai Gosht (Q)", "rate": 230},
    {"dish": "Mutton Kadhai Gosht (H)", "rate": 450},
    {"dish": "Mutton Kadhai Gosht (F)", "rate": 650},
    {"dish": "Mutton Rog Josh (Q)", "rate": 230},
    {"dish": "Mutton Rog Josh (H)", "rate": 450},
    {"dish": "Mutton Rog Josh (F)", "rate": 650},
    {"dish": "Mutton Handi (Q)", "rate": 240},
    {"dish": "Mutton Handi (H)", "rate": 450},
    {"dish": "Mutton Handi (F)", "rate": 650},
    {"dish": "Mutton Nihari (Q)", "rate": 250},
    {"dish": "Mutton Nihari (H)", "rate": 500},
    {"dish": "Mutton Nihari (F)", "rate": 700},
    {"dish": "Shahi Biryani Ch. (Q)", "rate": 80},
    {"dish": "Shahi Biryani Ch. (H)", "rate": 150},
    {"dish": "Shahi Biryani Ch. (F)", "rate": 250},
    {"dish": "Hyd Biryani Ch. (Q)", "rate": 70},
    {"dish": "Hyd Biryani Ch. (H)", "rate": 140},
    {"dish": "Hyd Biryani Ch. (F)", "rate": 240},
    {"dish": "Egg Biryani (Q)", "rate": 70},
    {"dish": "Egg Biryani (H)", "rate": 140},
    {"dish": "Egg Biryani (F)", "rate": 240},
    {"dish": "Jeera Rice (Q)", "rate": 60},
    {"dish": "Jeera Rice (H)", "rate": 120},
    {"dish": "Tandoori Roti", "rate": 15},
    {"dish": "Plain Naan", "rate": 30},
    {"dish": "Tandoori B Roti", "rate": 20},
    {"dish": "Khameeri Roti", "rate": 20},
    {"dish": "Laccha Paratha", "rate": 30},
    {"dish": "Mirchi Paratha", "rate": 30},
    {"dish": "Dhania Paratha", "rate": 30},
    {"dish": "Podina Paratha", "rate": 30},
    {"dish": "Butter Naan", "rate": 40},
    {"dish": "Garlic Naan", "rate": 50},
    {"dish": "Aloo Paratha", "rate": 40},
    {"dish": "Aloo Pyaz Paratha", "rate": 50},
    {"dish": "Paneer Paratha", "rate": 60},
    {"dish": "Qeema Paratha", "rate": 80},
    {"dish": "Rumali Roti", "rate": 10},
    {"dish": "Shahi Kheer", "rate": 70},
  ]
};
MenuList menuObj = MenuList.fromJson(jsonList);

//-----------------------Menu List End----------------------------------------------------------------------->

void main() {
  stateBuilder();
  print(myDartState.tables?[0]?.items?[0]?.dish);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    super.key,
    required this.title,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  final searchController = TextEditingController();

  // void _searchContentCallback(){
  // for(int i=0;i<list.length;i++){
  //   if(list[i]["dish"].indexOf(searchController.text)>-1){
  //     print(list[i]["dish"]);
  //   }
  // }
  // print(searchController.text);
  // }

//    @override
// void initState() {
//   super.initState();

//   // Start listening to changes.
//   searchController.addListener(_searchContentCallback);
// }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the
  //   // widget tree.
  //   searchController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: Padding(
      //   // padding to stick bottom bar to keyboard
      //   padding: MediaQuery.of(context).viewInsets,
      //   child: buildBottomAppBar(),
      // ),
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(widget.title),
      ),
      body: clicked.value
          // clicked
          ? GetOrder(
              tableno: tableno,
            )
          : getTablesPage(),
    );
  }

  Center getTablesPage() {
    return Center(
        child: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: (myDartState.tables?[index]?.active)!
                      ? MaterialStateProperty.all(Colors.green[400])
                      : MaterialStateProperty.all(Colors.purple[400]),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () {
                // print("hello");
                // !(myDartState.tables?[index]?.active)!;

                if ((myDartState.tables?[index]?.active) == false) {
                  setState(() {
                    myDartState.tables?[index]?.active = true;
                  });
                }
                tableno = index;
                clicked.value = true;
                // print(clicked.value);
                clicked.addListener(() {
                  setState(() {
                    print(clicked.value);
                  });
                });
                // For changing page to getorder.
              },
              child:
                  Text('T ${myDartState.tables?[index]?.tableno.toString()}')),
        );
      },
      itemCount: myDartState.tables?.length,
      padding: EdgeInsets.all(10),
    ));
  }
}

class GetOrder extends StatefulWidget {
  const GetOrder({Key? key, required this.tableno}) : super(key: key);
  final int tableno;
  @override
  State<GetOrder> createState() => _GetOrderState();
}

class _GetOrderState extends State<GetOrder> {
  void handleChange() {
    // print(text);
    // List tempList = [];
    // for (int i = 0; i < list.length; i++) {
    //   if (list[i]["dish"].toUpperCase().indexOf(text.toUpperCase()) > -1) {
    //     // print(list[i]["dish"]);
    //     tempList.add({
    //       "dish": list[i]["dish"].toString(),
    //       "rate": double.parse(list[i]["rate"])
    //     });
    //   }
    // }
    // setState(() {
    //   sortedList = [...tempList];
    // });
    // print(sortedList.toString());

    List<Item> tempList = [];
    for (int i = 0; i < (menuObj.items)!.length; i++) {
      if (((menuObj.items?[i]?.dish)!.toUpperCase())
          .contains((searchController.text.toString()).toUpperCase())) {
        // print((menuObj.items?[i]?.dish)!.toString());
        // we can add instance of item by constructor of Item itself as only type <Item> can be added to List <Item>
        tempList.add(
            Item(dish: menuObj.items?[i]?.dish, rate: menuObj.items?[i]?.rate));
      }
    }

    setState(() {
      sortedList = [...tempList];
    });
  }

  late TextEditingController searchController;
  @override
  void initState() {
    // TODO: implement initState
    searchController = TextEditingController();
    searchController.addListener(handleChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * .35,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    clicked.value = false;
                    // print(clicked.value);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Home"),
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .70,
              // color: Colors.amberAccent,
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return
                        // Text(myState[tableno]["items"][index]["dish"].toString());
                        //
                        Container(
                      padding: EdgeInsets.all(8),
                      // color: Colors.green,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            // color: Colors.red,
                            child: Text(
                              (myDartState.tables?[widget.tableno]
                                      ?.items?[index]?.dish)
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          // SizedBox(
                          //   width: 5,
                          // ),
                          Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              width: 50,
                              // color: Colors.blue,
                              child: Center(
                                child: Text(
                                  (myDartState.tables?[widget.tableno]
                                          ?.items?[index]?.rate)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 80,
                              height: 35,
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            // count--;
                                            myDartState
                                                .tables?[widget.tableno]
                                                ?.items?[index]
                                                ?.qty = (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.qty)! -
                                                1;
                                            myDartState
                                                .tables?[widget.tableno]
                                                ?.items?[index]
                                                ?.amount = (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.qty)! *
                                                (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.rate)!;
                                            myDartState.tables?[widget.tableno]
                                                ?.getTotal();
                                          });
                                        },
                                        icon: Icon(Icons.remove)),
                                  ),
                                  Container(
                                    // width: 10,
                                    child: Center(
                                      child: Text(
                                        (myDartState.tables?[widget.tableno]
                                                ?.items?[index]?.qty)
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            // count++;
                                            myDartState
                                                .tables?[widget.tableno]
                                                ?.items?[index]
                                                ?.qty = (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.qty)! +
                                                1;
                                            myDartState
                                                .tables?[widget.tableno]
                                                ?.items?[index]
                                                ?.amount = (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.qty)! *
                                                (myDartState
                                                    .tables?[widget.tableno]
                                                    ?.items?[index]
                                                    ?.rate)!;
                                            myDartState.tables?[widget.tableno]
                                                ?.getTotal();
                                          });
                                        },
                                        icon: Icon(Icons.add)),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                              width: 50,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red)),
                              child: Center(
                                child: Text(
                                  (myDartState.tables?[widget.tableno]
                                          ?.items?[index]?.amount)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                          // SizedBox(
                          //   width: 1,
                          // ),
                          Expanded(
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    myDartState.tables?[widget.tableno]?.items
                                        ?.removeAt(index);
                                    myDartState.tables?[widget.tableno]
                                        ?.getTotal();
                                  });
                                },
                                icon: Icon(Icons.delete_forever)),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount:
                      myDartState.tables?[widget.tableno]?.items?.length),
            ),
            // Text((myDartState.tables?[widget.tableno]?.total).toString())
          ],
        ),
        Positioned(
          bottom: 65,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                  ),
                ],
                // border: Border.all(),
                borderRadius: BorderRadius.circular(50),
                color: Colors.green[100]),
            height: 50,
            width: MediaQuery.of(context).size.width * .30,
            // color: Colors.red,
            child: Center(
                child: Text(
              "Total: ${(myDartState.tables?[widget.tableno]?.total).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        Positioned(
          // left: 10,
          bottom: 0,
          // height: 200,
          // width: 300,
          child: Column(
            children: [
              sortedList.length > 0
                  ? Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return
                              // Text(sortedList[index].toString());
                              Container(
                            // color: Colors.blue[50],
                            // margin: EdgeInsets.all(5),
                            child: ListTile(
                              // tileColor: Colors.red,
                              // contentPadding: EdgeInsets.all(5),
                              leading: Icon(Icons.local_dining),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      myDartState.tables?[widget.tableno]?.items
                                          ?.add(Item(
                                              dish: sortedList[index].dish,
                                              rate: sortedList[index].rate,
                                              qty: 1,
                                              amount: sortedList[index].rate));
                                      myDartState.tables?[widget.tableno]
                                          ?.getTotal();
                                      searchController.text = "";
                                      sortedList = [];
                                    });
                                  },
                                  icon: Icon(Icons.add)),
                              title: Text(sortedList[index].dish.toString()),
                              subtitle: Text(
                                  'Rs. ${sortedList[index].rate.toString()}'),
                            ),
                          );
                        },
                        itemCount: sortedList.length,
                      ))
                  : SizedBox(),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.blueAccent,
                height: 55,
                padding: EdgeInsets.only(left: 50, right: 50),
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: TextField(
                    controller: searchController,
                    // onChanged: handleChange,
                    style: TextStyle(
                        fontSize: 20.0, height: 1, color: Colors.black),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              searchController.text = "";
                              sortedList = [];
                            });
                          },
                          icon: Icon(Icons.delete)),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search Items',
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//-----------------------Slider Button Widget------------------------------------------------------------------------->>>>
class SlideToContinueButton extends StatefulWidget {
  @override
  _SlideToContinueButtonState createState() => _SlideToContinueButtonState();
}

class _SlideToContinueButtonState extends State<SlideToContinueButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _showOrderText = false;
  bool _hideSlideText = false;
  late Offset _dragStart;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(1.0, 0.0),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _showOrderText = true;
            _hideSlideText = true;
          });
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final dx = details.globalPosition.dx - _dragStart.dx;
    double slidePercent = dx / context.size!.width;
    slidePercent = slidePercent.clamp(0.0, 1.0);
    _controller.value = slidePercent;
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (_controller.value < 1.0) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragDown: (details) {
        _dragStart = details.globalPosition;
      },
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!_hideSlideText)
              ClipRect(
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Text(
                    'slide to continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            AnimatedOpacity(
              opacity: _showOrderText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 250),
              child: Text(
                'Order',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
 //-----------------------Slider Button Widget-------------------------------------->>>>



