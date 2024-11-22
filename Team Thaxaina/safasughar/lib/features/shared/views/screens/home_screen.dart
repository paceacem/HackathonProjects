import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:safasughar/features/auth/providers/auth_provider.dart';
import 'package:safasughar/features/auth/views/screens/auth_screen.dart';
import 'package:safasughar/features/guideline_v2/views/screens/guidelines_screen_v2.dart';
import 'package:safasughar/features/map/views/screens/map_screen.dart';
import 'package:safasughar/features/recycle/views/screens/recycle_page.dart';
import 'package:safasughar/features/report/views/screens/reported_list_screen.dart';
import 'package:safasughar/features/shared/views/widgets/round_icon_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _activeTab = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(providerOfAuth.select((value) => null));

    _listenToSignOutState();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _tabViewBuilder(),
          ),
          _tabBuilder(),
        ],
      ),
    );
  }

  Widget _tabViewBuilder() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        GuidelinesScreenV2(),
        RecyclePage(),
        ReportedIssues(),
        MapScreen(),
      ],
    );
  }

  Widget _tabBuilder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.blue,
          ],
        ),
      ),
      padding: const EdgeInsets.only(
        top: 15.0,
        bottom: 10.0,
      ),
      child: SafeArea(
        top: false,
        child: TabBar(
          controller: _tabController,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              child: RoundIconButton(
                onPressed: () => _updateActiveTabIndex(0),
                bgColor: _activeTab == 0
                    ? Colors.blue
                    : Colors.white.withOpacity(0.1),
                shadow: _activeTab == 0
                    ? BoxShadow(
                        offset: const Offset(0.0, 0.0),
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10.0,
                      )
                    : null,
                icon: const Icon(
                  Icons.home_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: RoundIconButton(
                onPressed: () => _updateActiveTabIndex(1),
                bgColor: _activeTab == 1
                    ? Colors.blue
                    : Colors.white.withOpacity(0.1),
                shadow: _activeTab == 1
                    ? BoxShadow(
                        offset: const Offset(0.0, 0.0),
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10.0,
                      )
                    : null,
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: RoundIconButton(
                onPressed: () => _updateActiveTabIndex(2),
                bgColor: _activeTab == 2
                    ? Colors.blue
                    : Colors.white.withOpacity(0.1),
                shadow: _activeTab == 2
                    ? BoxShadow(
                        offset: const Offset(0.0, 0.0),
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10.0,
                      )
                    : null,
                icon: const Icon(
                  Icons.report_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              child: RoundIconButton(
                onPressed: () => _updateActiveTabIndex(3),
                bgColor: _activeTab == 3
                    ? Colors.blue
                    : Colors.white.withOpacity(0.1),
                shadow: _activeTab == 3
                    ? BoxShadow(
                        offset: const Offset(0.0, 0.0),
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10.0,
                      )
                    : null,
                icon: const Icon(
                  Icons.map_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listenToSignOutState() {
    ref.listen(
      providerOfAuth.select(
        (value) => value.signOutUserState,
      ),
      (prev, next) {
        if (prev != next) {
          next.maybeWhen(
            success: (_) => _gotoAuthScreen(),
            orElse: () {},
          );
        }
      },
    );
  }

  void _updateActiveTabIndex(final int index) {
    setState(() {
      _activeTab = index;
    });
    _tabController.animateTo(index);
  }

  void _gotoAuthScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      ),
    );
  }
}
