import 'package:app_10/bloc/favorite_item/bloc/favorite_item_bloc.dart';
import 'package:app_10/bloc/favorite_item/bloc/favorite_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteItemScreen extends StatefulWidget {
  const FavoriteItemScreen({super.key});

  @override
  State<FavoriteItemScreen> createState() => _FavoriteItemScreenState();
}

class _FavoriteItemScreenState extends State<FavoriteItemScreen> {
  int num = 0;
  List<String> name = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> tempArray = [];

  // void _addItem() {
  //   setState(() {
  //     name.add("Item ${name.length + 1}"); // Adding a new item
  //   });
  // }

  _removeItem(int index) {
    setState(() {
      name.removeAt(index); // Removing the item at the given index
    });
  }

  void _showAddItemDialog() {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Enter a sentence"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Type here..."),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  context
                      .read<FavoriteItemBloc>()
                      .add(Add_item(textController.text)); // Add item
                }
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  setState(() {
                    name.add(textController.text); // Add user input to list
                  });
                }
                Navigator.pop(context); // Close the dialog
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView With Select",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: BlocBuilder<FavoriteItemBloc, FavoriteItemState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: name.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text(name[index].toString(),
                                  style: const TextStyle(fontSize: 20)),
                              trailing: SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: IconButton(
                                      onPressed: () =>_removeItem

                                        // setState(() {
                                        //   context.read<FavoriteItemBloc>().add(Delete_item(index));
                                          
                                        // });
                                        ,
                                      icon: Icon(Icons.delete))),
                            ),
                          ),
                          onTap: () {},
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   List<String> name = ['January','February','March','April','May','June','July','August','September'
//     ,'October','November','December'];

//   List<String> tempArray = [];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("ListView With Select" , style: TextStyle(fontStyle: FontStyle.italic,
//             fontSize: 30),),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Expanded(
//                child: ListView.builder(
//                    itemCount: name.length,
//                    itemBuilder: (context, index) {
//                      return InkWell(
//                        child: Card(
//                          child: ListTile(
//                            title: Text(name[index].toString(), style: TextStyle(fontStyle: FontStyle.italic,
//                                fontSize: 20)),
//                            trailing: Container(
//                              height: 50,
//                              width: 100,
//                              decoration: BoxDecoration(
//                                color: tempArray.contains(name[index].toString()) ? Colors.red : Colors.green
//                              ),
//                              child: Center(
//                                child: Text(tempArray.contains(name[index].toString()) ? 'REMOVE' : 'ADD',
//                                    style: TextStyle(fontStyle: FontStyle.italic,
//                                    fontSize: 20)),
//                              ),
//                            ),
//                          ),
//                        ),
//                        onTap: () {
//                         setState(() {
//                           if(tempArray.contains(name[index].toString())) {
//                             tempArray.remove(name[index].toString());
//                           } else {
//                             tempArray.add(name[index].toString());
//                           }
//                         });
//                        },
//                      );
//                    }),
//              )
//           ],
//         ),
//       ),
//     );
//   }
// }
