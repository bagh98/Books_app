import 'package:ebook_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:ebook_app/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'core/utils/service_loacator.dart';

void main() {
  setupServiceLocator();
  runApp(const Ebooks());
}

class Ebooks extends StatelessWidget {
  const Ebooks({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )),
        BlocProvider(
            create: (context) => NewsetBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
