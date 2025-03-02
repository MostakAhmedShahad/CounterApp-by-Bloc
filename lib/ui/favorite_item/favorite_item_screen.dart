import 'package:app_10/bloc/favorite_item/bloc/favorite_item_bloc.dart';
import 'package:app_10/bloc/favorite_item/bloc/favorite_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class FavoriteItemScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Name List')),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<FavoriteItemBloc, NameState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.names.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.names[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<FavoriteItemBloc>().add(DeleteName(state.names[index]));
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => DeletedItemsScreen()),
            ),
            child: Text('View Deleted Items',style: TextStyle(fontSize: 12,color: Colors.amber),),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Add Name'),
                content: TextField(controller: _controller),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<FavoriteItemBloc>().add(AddName(_controller.text));
                      _controller.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Add'),
                  )
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DeletedItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Deleted Items')),
      body: BlocBuilder<FavoriteItemBloc, NameState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.deletedNames.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(state.deletedNames[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


// class FavoriteItemScreen extends StatefulWidget {
//   const FavoriteItemScreen({super.key});

//   @override
//   State<FavoriteItemScreen> createState() => _FavoriteItemScreenState();
// }

// class _FavoriteItemScreenState extends State<FavoriteItemScreen> {
//   int num = 0;
//   List<String> name = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];

//   List<String> deletedItem = [];

//     _showAddItemDialog() {
//     TextEditingController textController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Enter a sentence"),
//           content: TextField(
//             controller: textController,
//             decoration: const InputDecoration(hintText: "Type here..."),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (textController.text.trim().isNotEmpty) {
//                   // Ensure non-empty input
//                   context
//                       .read<FavoriteItemBloc>()
//                       .add(Add_item(textController.text.trim()));
//                 }
//                 Navigator.pop(context);
//               },
//               child: const Text("Add"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "ListView With Select",
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//       body: BlocBuilder<FavoriteItemBloc, FavoriteItemState>(
//         buildWhen: (previous, current) {
//           return previous.name != current.name;
//         },
//         builder: (context, state) {
//           print(state.name);
//           print('Inside builder');
//           return state.name.isEmpty
//               ? const Center(
//                   child: Text(
//                     "No items in the list!",
//                     style: TextStyle(fontSize: 22),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: state.name.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: Text(state.name[index],
//                             style: const TextStyle(fontSize: 20)),
//                         trailing: IconButton(
//                           onPressed: () {
//                             context
//                                 .read<FavoriteItemBloc>()
//                                 .add(MoveItem(state.deletedItem.length, index));
//                           },
//                           icon: const Icon(Icons.delete, color: Colors.red),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//         },
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//             child: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DeletedItemsScreen(),
//                   ),
//                 );
//               },
//               child: const Icon(Icons.delete),
//             ),
//           ),
//           FloatingActionButton(
//             onPressed: _showAddItemDialog,
//             child: const Icon(Icons.add),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DeletedItemsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Deleted Items")),
//       body: BlocBuilder<FavoriteItemBloc, FavoriteItemState>(
//         builder: (context, state) {
//           return state.deletedItem.isEmpty
//               ? Center(child: Text("No deleted items"))
//               : ListView.builder(
//                   itemCount: state.deletedItem.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(state.deletedItem[index]),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
