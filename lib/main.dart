import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/adaptive.dart';
import 'package:khingan_honey/widgets/blog.dart';
import 'package:khingan_honey/widgets/faq.dart';
import 'package:khingan_honey/widgets/footer.dart';
import 'package:khingan_honey/widgets/header.dart';
import 'package:khingan_honey/widgets/products.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'widgets/info.dart';

void main() {
  VisibilityDetectorController.instance.updateInterval = Duration(milliseconds: 400);
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хинганский мёд',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
        ),
        textTheme: _textTheme(context),
        cardTheme: const CardThemeData(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
      home: MyHomePage(),
    );
  }

  TextTheme _textTheme(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    if(width < 600)  {
      return const TextTheme(
      displayLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ), //adaptive
      bodyLarge: TextStyle(fontSize: 24, color: Colors.white, ), //adaptive
      bodyMedium: TextStyle(fontSize: 22, color: Colors.white), //adaptive
      bodySmall: TextStyle(fontSize: 18, color: Colors.white),
      );
    }
    if(width >= 600 && width < 1024) {
      return const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        displayMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white,),
        bodyLarge: TextStyle(fontSize: 26, color: Colors.white,),
        bodyMedium: TextStyle(fontSize: 24, color: Colors.white),
        bodySmall: TextStyle(fontSize: 18, color: Colors.white),
      );
    }
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white,),
      bodyLarge: TextStyle(fontSize: 28, color: Colors.white,),
      bodyMedium: TextStyle(fontSize: 26, color: Colors.white),
      bodySmall: TextStyle(fontSize: 18, color: Colors.white),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final ScrollController mainController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/gex.jpg",
              repeat: ImageRepeat.repeat,
              scale: 0.05,
            )
          ),
          Positioned.fill(child: Container(color: Color.fromRGBO(0, 0, 0, 0.1),)),
          SelectionArea(
            child: Scrollbar(
            controller: mainController,
            thumbVisibility: true,
              trackVisibility: true,
              child: CustomScrollView(
                controller: mainController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  HeaderSection(scrollController: mainController,),
                  SliverToBoxAdapter(
                    child: AdaptiveForSmallPhones(
                      child: const InfoSection(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: const AdaptiveForSmallPhones(minWidth: 400, child: ProductHeader()),
                  ),
                  SliverToBoxAdapter(
                    child: AdaptiveForSmallPhones(minWidth: 435, child:
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 1300),
                            child: Column(
                              children: [
                                const SizedBox(height: 50,),
                                const ProductSection(),
                                const SizedBox(height: 50,),
                                const FAQSection(),
                                const SizedBox(height: 50,),
                                const BlogSection(),
                                const SizedBox(height: 50,)
                              ],
                            ),
                          ),
                        )
                      )
                    )
                  ),
                  SliverToBoxAdapter(
                    child: AdaptiveForSmallPhones(minWidth: 350, child: FooterSection(scrollController: mainController,)),
                  )
                ],
              ),
            ),
          ),
        ],
      //bottomNavigationBar: BottomNavigationBar(items: [      ]),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



