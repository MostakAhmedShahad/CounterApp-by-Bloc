import 'package:app_10/bloc/list_view/bloc/list_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listview extends StatefulWidget {
  const Listview({super.key});

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    print('under override mathod');

    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: BlocBuilder<ListViewBloc, ListViewState>(
        builder: (context, state) {
          return state.num == 0
              ? Center(
                  child: Text(
                    "Here is no item on the list!!",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              : ListView.builder(
                  itemCount: state.num,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              index.toString(),
                              style: TextStyle(fontSize: 22.0),
                            ),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<ListViewBloc>()
                                      .add(DeleteList());
                                  print('under card mathod');
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListViewBloc>().add(AddList());
          print('under floting mathod');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
