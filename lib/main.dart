import 'package:app_10/bloc/counter/counter_bloc.dart';
import 'package:app_10/bloc/favorite_item/bloc/favorite_item_bloc.dart';
import 'package:app_10/bloc/image_peaker/image_peaker_bloc.dart';
import 'package:app_10/bloc/list_view/bloc/list_view_bloc.dart';
import 'package:app_10/bloc/slider_switch/switch_bloc.dart';
import 'package:app_10/bloc/timer/bloc/timer_bloc.dart';
import 'package:app_10/ui/api/post_api/bloc/bloc/post_api_bloc.dart';
import 'package:app_10/ui/api/post_api/ui/post_api_screen.dart';
import 'package:app_10/ui/favorite_item/favorite_item_screen.dart';
 
import 'package:app_10/ui/image_peaker/image_peaker_screen.dart';
import 'package:app_10/ui/list_view/list_view.dart';
import 'package:app_10/ui/timer/timer_screen.dart';
 
import 'package:app_10/utils/image_peaker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/image_peaker/image_peaker_screen.dart';
import 'utils/image_peaker_utils.dart';
import 'ui/list_view/list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePeakerBloc(ImagePeakerUtils()),
        ),
        BlocProvider(
          create: (context) => ListViewBloc( ),
        ),
         BlocProvider(
          create: (context) => FavoriteItemBloc( ),
        ),
         BlocProvider(
          create: (context) => TimerBloc( ),
        ),
         BlocProvider(
          create: (context) => PostApiBloc( ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  PostApiScreen(),
      ),
    );
  }
}


