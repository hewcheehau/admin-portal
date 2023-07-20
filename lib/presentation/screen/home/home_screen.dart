import 'package:admin_portal/application/home/cubit/navigation_bar_cubit.dart';
import 'package:admin_portal/presentation/core/app_router.dart';
import 'package:admin_portal/presentation/screen/post/post_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    pageController = PageController();
    // Connect SideMenuController and PageController together
    sideMenu.addListener((index) {
      pageController?.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, cts) {
        return Row(
          children: [
            BlocBuilder<NavigationBarCubit, int>(builder: (context, state) {
              return SideMenu(
                // Page controller to manage a PageView
                controller: sideMenu,
                // Will shows on top of all items, it can be a logo or a Title text
                title: Image.asset('assets/image/app-ic.png'),
                // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
                footer: const Text('demo v1.0.0'),
                // Notify when display mode changed
                onDisplayModeChanged: (mode) {
                  print(mode);
                },
                // List of SideMenuItem to show them on SideMenu
                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Post',
                    onTap: (index, _) {
                      context.navigateTo(PostRoute());
                    },
                    icon: const Icon(Icons.person),
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Exit',
                    onTap: (index, _) {},
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ],
              );
            }),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: AutoRouter())
          ],
        );
      }),
    );
  }
}
