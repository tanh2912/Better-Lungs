import 'package:fitness_flutter/core/const/color_constants.dart';
import 'package:fitness_flutter/core/const/path_constants.dart';
import 'package:fitness_flutter/core/const/text_constants.dart';
import 'package:fitness_flutter/screens/home/bloc/home_bloc.dart';
import 'package:fitness_flutter/screens/home/page/home_page.dart';
import 'package:fitness_flutter/screens/home/page/news_page.dart';
import 'package:fitness_flutter/screens/tab_bar/bloc/tab_bar_bloc.dart';
import 'package:fitness_flutter/screens/workouts/page/workouts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../settings/settings_screen.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomeBloc()
          ..add(HomeInitialEvent())
          ..add(ReloadDisplayNameEvent())
          ..add(ReloadImageEvent()),
        child: BlocProvider<TabBarBloc>(
          create: (BuildContext context) => TabBarBloc(),
          child: BlocConsumer<TabBarBloc, TabBarState>(
            listener: (context, state) {},
            buildWhen: (_, currState) =>
                currState is TabBarInitial ||
                currState is TabBarItemSelectedState,
            builder: (context, state) {
              final bloc = BlocProvider.of<TabBarBloc>(context);
              return Scaffold(
                body: _createBody(context, bloc.currentIndex),
                bottomNavigationBar: _createdBottomTabBar(context),
              );
            },
          ),
        ));
  }

  Widget _createdBottomTabBar(BuildContext context) {
    final bloc = BlocProvider.of<TabBarBloc>(context);
    return BottomNavigationBar(
      currentIndex: bloc.currentIndex,
      fixedColor: ColorConstants.primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Image(
            image: const AssetImage(PathConstants.home),
            color: bloc.currentIndex == 0 ? ColorConstants.primaryColor : null,
          ),
          label: TextConstants.homeIcon,
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: const AssetImage(PathConstants.workouts),
            color: bloc.currentIndex == 1 ? ColorConstants.primaryColor : null,
          ),
          label: TextConstants.workoutsIcon,
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: const AssetImage(PathConstants.news),
            color: bloc.currentIndex == 2 ? ColorConstants.primaryColor : null,
          ),
          label: TextConstants.newsIcon,
        ),
        BottomNavigationBarItem(
          icon: Image(
            image: const AssetImage(PathConstants.settings),
            color: bloc.currentIndex == 3 ? ColorConstants.primaryColor : null,
          ),
          label: TextConstants.settingsIcon,
        ),
      ],
      onTap: (index) {
        bloc.add(TabBarItemTappedEvent(index: index));
      },
    );
  }

  Widget _createBody(BuildContext context, int index) {
    final children = [
      const HomePage(),
      const WorkoutsPage(),
      const NewsPage(),
      const SettingsScreen()
      // Scaffold(
      //   body: Center(
      //     child: RawMaterialButton(
      //       fillColor: Colors.red,
      //       child: Text(
      //         TextConstants.signOut,
      //         style: TextStyle(
      //           color: ColorConstants.white,
      //         ),
      //       ),
      //       onPressed: () {
      //         AuthService.signOut();
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignInPage()),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ];
    return children[index];
  }
}
