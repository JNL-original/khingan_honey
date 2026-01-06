import 'package:flutter/material.dart';

import 'adaptive.dart';

class InfoSection extends StatelessWidget{
  const InfoSection({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          "assets/images/bee-farm.jpg",
          width: double.infinity,
          fit: BoxFit.cover,
          height: Responsive.isDesktop(context) ? 800 : (Responsive.isTablet(context) ? 600 : 500),
          alignment: AlignmentGeometry.bottomCenter,
        ),
        IntrinsicWidth(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: width >= 1500 ? 900 : (width >= 1400 ? 800 : (width >= 1024 ? 750 : 700)),
              minHeight: Responsive.isDesktop(context) ? 800 : (Responsive.isTablet(context) ? 600 : 500)
            ),
            child: Card(
              margin: EdgeInsets.all(Responsive.isMobile(context) ? 40 : 70),
              color: Color.fromRGBO(0, 0, 0, 0.22),
              child: Padding(
                padding: (width >= 600 && width < 650 || width < 520) ? EdgeInsets.all(35) : EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Responsive.isDesktop(context) ? 40 : 20,
                  children: [
                    Text("Таёжный мёд", style: Theme.of(context).textTheme.displayLarge,),
                    _builderRow(Icons.check, "100% натуральный продукт", context),
                    _builderRow(Icons.location_on_outlined, "Собрано в Архаринских лесах", context),
                    _builderRow(Icons.handshake_outlined, "Гарантия качества", context),
                    _builderRow(Icons.family_restroom, "Собственная пасека семьи", context),
                    _builderRow(Icons.forest_outlined, "Дикие медоносы", context),
                    _builderRow(Icons.calendar_month_sharp, "Сбор 2025 года", context),
                  ]
                )
              ),
            ),
          )
        ),
      ],
    );
  }


  Widget _builderRow(IconData icon, String text, BuildContext context){
    return Row(
      children: [
        SizedBox(width: Responsive.isDesktop(context) ? 50 : 0,),
        Icon(icon, color: Colors.white,),
        const SizedBox(width: 30,),
        Text(text, style: Theme.of(context).textTheme.displayMedium),
      ],
    );
  }
}

