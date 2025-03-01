import 'dart:convert';

import 'package:app_10/ui/api/post_api/bloc/bloc/post_api_bloc.dart';
import 'package:app_10/ui/api/post_api/bloc/bloc/post_api_event.dart';
import 'package:app_10/ui/api/post_api/bloc/bloc/post_api_state.dart';
import 'package:app_10/ui/api/post_api/ui/json_to_dart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
 

class PostApiScreen extends StatelessWidget {
  const PostApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post API (BLoC)')),
      body: BlocProvider(
        create: (context) => PostApiBloc()..add(FetchPosts()),
        child: BlocBuilder<PostApiBloc, PostApiState>(
          builder: (context, state) {
            if (state is PostApiLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostApiLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(post.title ?? "No Title", style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(post.body ?? "No Body"),
                    ),
                  );
                },
              );
            } else if (state is PostApiError) {
              return Center(child: Text(state.message, style: TextStyle(color: Colors.red)));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}





// class PostApiScreen extends StatefulWidget {
//   const PostApiScreen({super.key});

//   @override
//   State<PostApiScreen> createState() => _PostApiScreenState();
// }

// class _PostApiScreenState extends State<PostApiScreen> {
//   List<PostApi> posts = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchPosts();
//   }

//   Future<void> fetchPosts() async {
//     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       List<dynamic> jsonData = json.decode(response.body);
//       setState(() {
//         posts = jsonData.map((data) => PostApi.fromJson(data)).toList();
//       });
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Post API')),
//       body: posts.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: posts.map((post) {
//                   return Card(
//                     margin: const EdgeInsets.all(10),
//                     child: ListTile(
//                       title: Text(post.title ?? "No Title", style: const TextStyle(fontWeight: FontWeight.bold)),
//                       subtitle: Text(post.body ?? "No Body"),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }