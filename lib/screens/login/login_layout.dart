import 'package:flutter/material.dart';
import 'package:lottonet/screens/login/widget/with_password/login_with_password.dart';
import 'package:lottonet/utils/constants.dart';

class LoginLayout extends StatefulWidget {
  const LoginLayout({super.key});

  @override
  State<LoginLayout> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends State<LoginLayout>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  Color tab1Color = const Color(0xFF282665);
  Color tab2Color = const Color(0x66000000);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          tab1Color = const Color(0xFF282665);
          tab2Color = const Color(0x66000000);
        } else {
          tab1Color = const Color(0x66000000);
          tab2Color = const Color(0xFF282665);
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: baseSize.height * 0.8,
              width: baseSize.width * 0.9,
              child: Column(
                children: [
                  SizedBox(height: baseSize.height * 0.05),
                  // Logo
                  Image.asset(
                    '${Constants.imagePath}/main_logo.png',
                    width: baseSize.width * 0.7,
                    height: baseSize.height * 0.13,
                  ),

                  SizedBox(height: baseSize.height * 0.02),

                  Expanded(
                      child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: baseSize.height * .058,
                            child: Row(
                              children: [
                                Container(
                                  height: baseSize.height * .65,
                                  width: baseSize.width * .45,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20)),
                                    color: tab1Color,
                                  ),
                                ),
                                Container(
                                  height: baseSize.height * .055,
                                  width: baseSize.width * .45,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(20)),
                                    color: tab2Color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            unselectedLabelColor: Colors.white,
                            labelColor: Colors.white,
                            indicatorColor: Colors.white,
                            controller: _tabController,
                            tabs: const [
                              Tab(text: "כניסה טלפונית"),
                              Tab(text: "התחברות באימייל"),
                            ],
                            overlayColor: WidgetStateColor.transparent,
                          ),
                        ],
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Container(
                              height: baseSize.height * .5,
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(80),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  LoginWithPassword(
                                      textFieldheight: baseSize.height * .1,
                                      textFieldwidth: baseSize.width * .8),
                                  LoginWithPassword(
                                      textFieldheight: baseSize.height * .1,
                                      textFieldwidth: baseSize.width * .8),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
