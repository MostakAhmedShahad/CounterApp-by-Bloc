import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../bloc/favorite_item/bloc/favorite_item_bloc.dart';
import '../bloc/image_peaker/image_peaker_bloc.dart';
import '../bloc/list_view/bloc/list_view_bloc.dart';
import '../bloc/slider_switch/switch_bloc.dart';
import '../bloc/timer/bloc/timer_bloc.dart';
import '../ui/api/photos_api/bloc/bloc/photos_api_bloc.dart';
import '../ui/api/photos_api/ui/photos_api_screen.dart';
import '../ui/api/post_api/bloc/bloc/post_api_bloc.dart';
import '../ui/api/post_api/ui/post_api_screen.dart';
import '../ui/api/top_news_api/bloc/bloc/top_news_api_bloc.dart';
import '../ui/api/top_news_api/ui/top_news_api_screen.dart';
import '../ui/favorite_item/favorite_item_screen.dart';
import '../ui/image_peaker/image_peaker_screen.dart';
import '../ui/list_view/list_view.dart';
import '../ui/timer/timer_screen.dart';
import '../ui/counter/counter_screen.dart';
import '../ui/switch/switch_screen.dart';
import '../ui/home_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/top-news',
      builder: (context, state) => BlocProvider(
        create: (context) => TopNewsApiBloc(),
        child: const TopNewsApiScreen(),
      ),
    ),
    GoRoute(
      path: '/photos',
      builder: (context, state) => BlocProvider(
        create: (context) => PhotosApiBloc(),
        child: const PhotosApiScreen(),
      ),
    ),
    GoRoute(
      path: '/posts',
      builder: (context, state) => BlocProvider(
        create: (context) => PostApiBloc(),
        child: const PostApiScreen(),
      ),
    ),
    GoRoute(
      path: '/timer',
      builder: (context, state) => BlocProvider(
        create: (context) => TimerBloc(),
        child: const TimerScreen(),
      ),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => BlocProvider(
        create: (context) => FavoriteItemBloc(),
        child: const FavoriteItemScreen(),
      ),
    ),
    GoRoute(
      path: '/list-view',
      builder: (context, state) => BlocProvider(
        create: (context) => ListViewBloc(),
        child: const ListViewScreen(),
      ),
    ),
    GoRoute(
      path: '/image-picker',
      builder: (context, state) => BlocProvider(
        create: (context) => ImagePeakerBloc(),
        child: const ImagePeakerScreen(),
      ),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterScreen(),
      ),
    ),
    GoRoute(
      path: '/switch',
      builder: (context, state) => BlocProvider(
        create: (context) => SwitchBloc(),
        child: const SwitchScreen(),
      ),
    ),
  ],
);
