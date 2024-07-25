import 'package:flutter/material.dart';
import 'package:joke_app/main.dart';
import 'package:joke_app/service/hive.dart';
import 'package:joke_app/utility/colors.dart';
import 'package:joke_app/utility/strings.dart';
import 'package:joke_app/view/widgets/common_text_widget.dart';
import 'package:joke_app/view/widgets/loader_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String joke = "";
  Future<void>? future;

  @override
  void initState() {
    super.initState();
    homeVM?.addListener(homeListener);
    setState(() {
      future = homeVM?.getJoke(context);
    });
  }

  @override
  dispose() {
    homeVM?.removeListener(homeListener);
    super.dispose();
  }

  homeListener() {
    if (homeVM?.joke != null) {
      if (homeVM!.joke != joke) {
        setState(() {
          joke = homeVM!.joke;
        });
      }
    } else {
      var offline_joke = AppHive.get_joke();
      if (offline_joke != "") {
        setState(() {
          joke = offline_joke;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.secondary,
        title: CommonTextWidget(
          text: Strings.app_name,
          fontsize: 18,
          fontweight: FontWeight.bold,
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Container(
        color: BrandColors.primary,
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(25),
        child: FutureBuilder(
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(
                  children: [
                    Container(
                      height: size.height / 3,
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          color: BrandColors.secondary,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: BrandColors.shadow,
                                blurRadius: 10,
                                spreadRadius: 3)
                          ]),
                      child: SingleChildScrollView(
                        child: CommonTextWidget(
                            text: joke,
                            fontsize: 15,
                            fontweight: FontWeight.w600),
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            future = homeVM?.getJoke(context);
                          });
                        },
                        child: CommonTextWidget(text: Strings.get_joke)),
                    
                  ],
                );
              default:
                return const LoaderWidget();
            }
          },
          future: future,
        ),
      ),
    );
  }
}
