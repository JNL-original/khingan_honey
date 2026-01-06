import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/animations.dart';

class FAQSection extends StatelessWidget{

  const FAQSection({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedAppearance(
      child: Card(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2,
                  )
                )
              ),
              child: Text("Часто задаваемы вопросы", style: Theme.of(context).textTheme.displayLarge, ),
            ),
            SizedBox(height: 20,),
            _Question(question: _FAQData.list[0]['question']!, answer: _FAQData.list[0]['answer']!),
            _Question(question: _FAQData.list[1]['question']!, answer: _FAQData.list[1]['answer']!),
            _Question(question: _FAQData.list[2]['question']!, answer: _FAQData.list[2]['answer']!),
            _Question(question: _FAQData.list[3]['question']!, answer: _FAQData.list[3]['answer']!),
            _Question(question: _FAQData.list[4]['question']!, answer: _FAQData.list[4]['answer']!),
            _Question(question: _FAQData.list[5]['question']!, answer: _FAQData.list[5]['answer']!),
            _Question(question: _FAQData.list[6]['question']!, answer: _FAQData.list[6]['answer']!),
            _Question(question: _FAQData.list[7]['question']!, answer: _FAQData.list[7]['answer']!),
            _Question(question: _FAQData.list[8]['question']!, answer: _FAQData.list[8]['answer']!),
            _Question(question: _FAQData.list[9]['question']!, answer: _FAQData.list[9]['answer']!, isLast: true,),
            SizedBox(height: 20,)
          ],
        )
      ),
    );
  }
}

class _Question extends StatelessWidget {
  const _Question({super.key, required this.question, required this.answer, this.isLast=false});
  final String answer;
  final String question;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ExpansionTile(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: width < 850 ? 20 : 50),
        child: Text(question, style: Theme.of(context).textTheme.bodyLarge,),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width < 850 ? 50 : 100, vertical: 20),
          child: Text(answer, style: TextStyle(fontSize: 20, color: Colors.white),),
        ),
      ],
      shape: Border(
        bottom: isLast ? BorderSide.none : BorderSide(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      trailing: const SizedBox.shrink(),
    );
  }
}


class _FAQData{
  static final List<Map<String, String>> list = [
    {
      'question': 'Почему мед засахаривается (кристаллизуется) и значит ли это, что он испортился?',
      'answer' : 'Кристаллизация — это абсолютно естественный процесс для натурального меда. Это превращение глюкозы в кристаллы, которое не влияет на полезные свойства или качество продукта. Напротив, если мед не кристаллизуется в течение года (кроме акациевого), это может быть признаком того, что его перегрели или он ненатуральный.'
    },
    {
      'question': 'Как правильно хранить мед дома?',
      'answer' : 'Мед лучше всего хранить в стеклянной или керамической таре с плотно закрытой крышкой. Идеальное место — сухое и темное (шкаф), подальше от прямых солнечных лучей и продуктов с резким запахом (мед их впитывает). Оптимальная температура — от +5°C до +20°C. Холодильник не обязателен, но допустим.'
    },
    {
      'question': 'Можно ли добавлять мед в горячий чай?',
      'answer' : 'Если вы хотите сохранить все лечебные ферменты и витамины, мед не стоит нагревать выше 40°C. В крутом кипятке большая часть полезных веществ разрушается. Рекомендуется добавлять мед в уже слегка остывший напиток или есть его «вприкуску».'
    },
    {
      'question': 'Какой мед самый полезный?',
      'answer' : 'Каждый сорт полезен по-своему. Гречишный богат железом и помогает при анемии. Липовый незаменим при простуде и ангине. Акациевый считается самым гипоаллергенным и долго остается жидким. Выбирайте тот, который больше нравится вам по вкусу и аромату.'
    },
    {
      'question': 'С какого возраста можно давать мед детям?',
      'answer' : 'Педиатры настоятельно рекомендуют вводить мед в рацион детей не ранее 1 года, а лучше после 2–3 лет. Это связано с риском детского ботулизма (организм младенца еще не готов справляться с определенными бактериями, которые могут быть в меде) и высокой вероятностью аллергии.'
    },
    {
      'question': 'Как проверить мед на натуральность в домашних условиях?',
      'answer' : 'Один из простых способов: капните мед на бумагу. Натуральный мед не оставит мокрого водянистого пятна вокруг себя. Также можно растворить ложку меда в воде — натуральный продукт даст мутный раствор без осадка на дне.'
    },
    {
      'question': 'Почему мед иногда расслаивается на жидкий и густой слои?',
      'answer' : 'Это часто происходит, если мед был собран слишком рано («незрелый» мед с высоким содержанием влаги) или хранился в слишком теплом месте. Также это может быть особенностью некоторых сортов. Если постороннего запаха брожения нет, такой мед можно употреблять, но лучше съесть его быстрее.'
    },
    {
      'question': 'Чем мед лучше обычного сахара?',
      'answer' : 'В отличие от «пустых» калорий сахара, мед содержит более 300 полезных соединений: аминокислоты, витамины группы B, минералы и антиоксиданты. Кроме того, мед обладает антибактериальным эффектом, а его гликемический индекс ниже, чем у сахара.'
    },
    {
      'question': 'Бывает ли аллергия на мед?',
      'answer' : 'Да, мед является сильным аллергеном. Чаще всего реакция возникает не на сам мед, а на пыльцу растений, из которой он собран. Если у вас есть аллергия на цветение определенных трав или деревьев, стоит пробовать новые сорта меда с осторожностью, начиная с половины чайной ложки.'
    },
    {
      'question': 'Что такое крем-мед?',
      'answer' : 'Это обычный натуральный мед, который долго перемешивали при низкой температуре по специальной технологии (метод кримирования). В процессе крупные кристаллы разрушаются, и мед приобретает нежную кремовую текстуру, похожую на масло. При этом все полезные свойства полностью сохраняются.'
    },
  ];
}