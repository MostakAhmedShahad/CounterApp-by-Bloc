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

  // _removeItem(int index) {
  //   setState(() {
  //     name.removeAt(index); // Removing the item at the given index
  //   });
  // }

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
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  context.read<FavoriteItemBloc>().add(Add_item(textController.text));
                }
                Navigator.pop(context);
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
          return state.name.isEmpty
              ? const Center(
                  child: Text(
                    "No items in the list!",
                    style: TextStyle(fontSize: 22),
                  ),
                )
              : ListView.builder(
                  itemCount: state.name.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.name[index], style: const TextStyle(fontSize: 20)),
                        trailing: IconButton(
                          onPressed: () {
                            context.read<FavoriteItemBloc>().add(Delete_item(index));
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                    );
                  },
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


 