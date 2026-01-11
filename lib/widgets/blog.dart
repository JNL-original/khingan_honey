import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:khingan_honey/widgets/adaptive.dart';
import 'package:khingan_honey/widgets/animations.dart';
import 'package:video_player/video_player.dart';

class BlogSection extends StatefulWidget{
  const BlogSection({super.key});

  @override
  State<StatefulWidget> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection>{
  int active = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if(width > 1340) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _textPart(context: context),
          _videoPart(context: context)
        ],
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _videoPart(context: context),
        const SizedBox(height: 50,),
        _textPart(context: context),
      ],
    );
  }

  Widget _textPart({required BuildContext context}){
    return AnimatedAppearance(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.white,
                            width: 2
                        )
                    )
                ),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: Text(_BlogData.blogs[active][0], style: Theme.of(context).textTheme.displayLarge),
              ),
              Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(_BlogData.blogs[active][1], style: TextStyle(color: Colors.white, fontSize: 20),)
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget _videoPart({required BuildContext context}){
    return Container(
      child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 5,
              children: [
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                  child: IconButton(
                    icon: Transform.translate(
                      offset: const Offset(0, 0), // Смещаем на 2 пикселя влево
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    onPressed: () {
                      _controller.previousPage(
                          duration: Duration(milliseconds: 300), curve: Curves.linear
                      );
                    },
                  ),
                ),
                Expanded(
                  child: CarouselSlider.builder(
                    carouselController: _controller,
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      viewportFraction: 1,
                      aspectRatio: Responsive.isMobile(context) ? 0.6 : 0.75,
                      onPageChanged: (index, reason) => setState(() {
                        active = index;
                      }),
                    ),
                    itemCount: _BlogData.blogs.length,
                    itemBuilder: (context, index, pageViewIndex) {
                      return _SingleVideoPlayer(
                          key: ValueKey("video_$index"),
                          videoUri: Uri.parse("https://khingan.jnl-x.run/assets/assets/videos/" + _BlogData.blogs[index][2])
                      );
                    },
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
                  child: IconButton(
                    icon: Transform.translate(
                      offset: const Offset(0, 0), // Смещаем на 2 пикселя влево
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    onPressed: () {
                      _controller.nextPage(
                          duration: Duration(milliseconds: 300), curve: Curves.linear
                      );
                    },
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class _SingleVideoPlayer extends StatefulWidget{
  const _SingleVideoPlayer({super.key, required this.videoUri,});
  final Uri videoUri;
  @override
  State<StatefulWidget> createState() => SingleVideoPlayerState();
}

class SingleVideoPlayerState extends State<_SingleVideoPlayer>{
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }
  @override
  void didUpdateWidget(_SingleVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.videoUri != widget.videoUri) {
      _chewieController?.dispose();
      _videoPlayerController.dispose();
      _initializePlayer();
    }
  }

  Future<void> _initializePlayer() async{
    _videoPlayerController = VideoPlayerController.networkUrl(widget.videoUri);
    await _videoPlayerController.initialize();
    await _videoPlayerController.setVolume(0.0);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      showControls: true,
      allowFullScreen: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,

      aspectRatio: _videoPlayerController.value.aspectRatio,
      placeholder: const Center(child: CircularProgressIndicator()),
    );
    if (mounted) {
      setState(() {});
    }
  }



  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_chewieController!= null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: AspectRatio(
            aspectRatio: _chewieController!.aspectRatio ?? 16/9,
            child: Chewie(controller: _chewieController!, ),
          ),
        ),
      );
    } else{
      return const Center(child: CircularProgressIndicator());
    }
  }

}

class _BlogData{
  static final List<List<String>> blogs = [
    [ 'Создание пчелиных ульев',
      '     Пчелиный улей состоит из крышки, подкрышника, корпуса и днища. \n     Каждый из этих элементов собирается вручную из заранее заготовленных материалов. Материалы представляют собой натуральную древисину, обработанную нами на специализированных станках. \n     При создании элементов улья очень важно рассчитать размеры, чтобы все его элементы идеально сошлись, дальнейшая сборка представляет собой залипательный процесс, напоминающий по своей сути конструктор "Lego".',
      'frames.mp4'
    ],
    [ 'Дорога в архаринские леса',
      '     Пасека находится в широколиственном лесу в Архаринском районе. От ближайшей деревни расстояние в 12 километров, 4 из которых представляют собой внедорожье. \n     Особые трудности возникают, когда необходимо добраться сразу после дождя, или после обильного снегопада.',
      'road.mp4'
    ],
    [ 'Обзор на пасеку',
      '     Находясь на холме, пасека открывает вид на долину Урила, сразу за которым находится Хинганский заповедник. \n     Количество ульев очень зависит от времени года, к примеру в середине лета их количество может превышать 150 штук, а зимой может падать до 80.',
      'bee_farm.mp4'
    ],
    [ 'Разгар работы',
      '     Процесс медокачки начинается с подготовки помещений и оборудования. Когда все готово, мы приступаем к осмотру ульев. Из ульев вынимаем медовые рамки и отправляем в специализированное помещение, в котором уже из рамки выкачивают мед',
      'get_frame.mp4'
    ],
    [ 'Медосбор',
      '     Медосбор начинается с середины весны и заканчивается с приходом холодов. Наиболее ценным для пасечников растениями являются липа и серпуха. Однако основную массу нектара в архаринских лесах получают с леспедицы.',
      'bee.mp4'
    ],
    [ 'Обработка медовых рамок',
      '     Поступая в специализированное помещение, рамки в первую очередь проходят сортировку. Если рамка не запечатана пчелами, она сразу отправляется в медогонку, если же в ней присутствует печатка, то в зависимости от масштаба она проходит либо через ручную обработки, либо проходит через распечатывающий станок, а уже после идет в медогонку.\n     В медогонке под действием центробежных сил мед "вылетает" из сотов (и да, правильно говорить сотов), и скапливается на дне центрифуге. \n     Последним этапом мед проходит фильтрацию от воска через стерильные сетки',
      'honey.mp4'
    ],
  ];
}