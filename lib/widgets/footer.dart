import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/adaptive.dart';

import '../tools.dart';

class FooterSection extends StatelessWidget{
  const FooterSection({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1300),
            child: Column(
              children: [
                Responsive(
                  mobile: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _logo(scrollController: scrollController),
                      const SizedBox(height: 30,),
                      _slogans(context: context),
                      const SizedBox(height: 30,),
                      _phone(context: context),
                    ],
                  ),
                  tablet: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        //mainAxisSize: MainAxisSize.min,
                        alignment: WrapAlignment.center,
                        children: [
                          _logo(scrollController: scrollController),
                          const SizedBox(width: 50),
                          _slogans(context: context),

                        ],
                      ),
                      const SizedBox(height: 30,),
                      _phone(context: context),
                    ],
                  ),
                  desktop: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                      children: [
                        _logo(scrollController: scrollController),
                        SizedBox(width: 50,),
                        _slogans(context: context)
                        ],
                      ),
                      _phone(context: context)
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Text("© 2026 Все права защищены", style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),
          ),
        )
      ),
    );
  }
  Widget _logo({required ScrollController scrollController}){
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        child: Image.asset("assets/images/logo.png", height: 150,),
      ),
    );
  }
  Widget _slogans({required BuildContext context}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Хинганский мёд", style: Theme.of(context).textTheme.displayMedium),
        SizedBox(height: 15,),
        Text("Закажите мед прямо сейчас", style: Theme.of(context).textTheme.bodyMedium,),
        Text("Свыше 33 кг скидка", style: Theme.of(context).textTheme.bodyMedium,),
        Text("В Благовещенске доставка бесплатная", style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
  Widget _phone({required BuildContext context}){
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Tools.makePhoneCall('+79622847980'),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.phone, color: Colors.white, size: 30,),
            SizedBox(width: 20,),
            Text("+7(962)284-79-80", textAlign: TextAlign.right, style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}