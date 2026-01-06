import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/adaptive.dart';

import '../tools.dart';

class HeaderSection extends StatelessWidget{
  const HeaderSection({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      expandedHeight:  width > 490 ? 125 : (125/490*width),
      pinned: true,
      backgroundColor: Colors.black,
      toolbarHeight: width > 490 ? 80 : (80/490*width),
      automaticallyImplyLeading: false,


      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        centerTitle: true,
        expandedTitleScale: (width < 1150 && width >= 1024) || (width < 900) ? 1 : 1.5,

        title: AdaptiveForSmallPhones(
          child: Align(
            alignment: (width < 1150 && width >= 1024) || (width < 900) ? Alignment.center : Alignment.bottomCenter,
            child: Container(
              height: 80,
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1800),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Responsive(mobile: SizedBox(width: 20,), tablet: SizedBox(width: 40,), desktop: SizedBox(width: 100,)),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => scrollController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                            child: Image.asset("assets/images/logo.png", height: 50,),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text("Хинганский мёд",
                            style: Theme.of(context).textTheme.displayMedium),
                      ],
                    ),
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => Tools.makePhoneCall('+79622847980'),
                            child: Row(
                              children: [
                                Icon(Icons.phone,
                                    color: Colors.white,
                                    size: Theme.of(context).textTheme.displayMedium?.fontSize),
                                const SizedBox(width: 15),
                                Text("+7(962)284-79-80",
                                    style: Theme.of(context).textTheme.displayMedium),
                              ],
                            ),
                          ),
                        ),

                        Responsive(mobile: SizedBox(width: 20,), tablet: SizedBox(width: 40,), desktop: SizedBox(width: 100,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
        ),
    );
  }
}
