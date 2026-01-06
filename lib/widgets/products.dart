import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/adaptive.dart';
import 'package:khingan_honey/widgets/animations.dart';

class ProductHeader extends StatelessWidget{
  const ProductHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Наша продукция",
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      width: double.infinity,
      height: 100,
      color: Colors.black,
      alignment: Alignment.center,
    );
  }
}

class ProductSection extends StatelessWidget{
  const ProductSection({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 530,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      mainAxisSpacing: 50, //между рядами
      crossAxisSpacing: 50,
      childAspectRatio: 0.88,
      children: [
        AnimatedAppearance(child: ProductCard(title: "Цветочный мёд", image_name: "flover_honey.jpg"),),
        AnimatedAppearance(child: ProductCard(title: "Липовый мёд", image_name: "light_honey.jpg")),
        AnimatedAppearance(child: ProductCard(title: "Крем-мёд", image_name: "cream_honey.jpg")),
        AnimatedAppearance(child: ProductCard(title: "Рамки с сотами", image_name: "frame.jpg")),
        AnimatedAppearance(child: ProductCard(title: "Прополис", image_name: "propolis.jpg")),
        AnimatedAppearance(child: ProductCard(title: "Пыльца", image_name: "pollen.jpg")),
      ],
    );
  }
}
class ProductCard extends StatefulWidget{
  const ProductCard({super.key, required this.title, required this.image_name});
  final String title;
  final String image_name;

  @override
  State<StatefulWidget> createState() => _ProductCardState();

}
class _ProductCardState extends State<ProductCard>{
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    String image_source = "assets/images/" + widget.image_name;
    return MouseRegion(
      onEnter: (_) => setState(() => isHover=true),
      onExit: (_) => setState(() => isHover=false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Появится позднее'),
            duration: const Duration(seconds: 2),
          ),
        ),
        child: AnimatedScale(
          scale: isHover ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.transparent,
                      shadows: [Shadow(
                          color: !isHover ? Colors.white : Color.fromRGBO(255, 255, 255, 0.7),
                          offset: Offset(0, -5)
                      )],
                      fontSize: Responsive.isDesktop(context) ? 28 :
                        (Responsive.isTablet(context) ? 26 : 24),
                      decoration: TextDecoration.underline,
                      decorationColor: !isHover ? Colors.white : Color.fromRGBO(255, 255, 255, 0.7),
                      decorationThickness: 2
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image_source,
                        fit: BoxFit.cover,
                      ),
                    )
                  )
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}