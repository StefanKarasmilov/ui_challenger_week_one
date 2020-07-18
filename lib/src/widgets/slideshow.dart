import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  Slideshow({
    @required this.slides,
    this.puntosArriba     = false,
    this.colorPrimario    = Colors.blue,
    this.colorSecundario  = Colors.grey,
    this.bulletPrimario   = 15.0,
    this.bulletSecundario = 12.0,
  });

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder( // Construye primero el ChangeNotifier despues el resto
            builder: (BuildContext context) {

              Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;
              Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;

              return _CrearEstructuraSlideshow(puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );

  }

}

class _CrearEstructuraSlideshow extends StatelessWidget {
  const _CrearEstructuraSlideshow({
    @required this.puntosArriba,
    @required this.slides,
  });

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: <Widget>[
        if (this.puntosArriba) 
          _Dots(this.slides.length),
        _Slides(this.slides),
        if (!this.puntosArriba) 
          Align(
            child: _Dots(this.slides.length),
            alignment: Alignment.bottomCenter,
          ),
        _PageCount(slides: slides)
      ],
    );
  }
}

class _PageCount extends StatelessWidget {
  const _PageCount({
    @required this.slides,
  });

  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {

    final currentPage = Provider.of<_SlideshowModel>(context).currentPage.round() + 1;

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(right: 20, top: 100),
        alignment: Alignment.center,
        height: 50,
        width: 50,
        child: Text('$currentPage/${slides.length}', style: TextStyle(color: Colors.white, fontSize: 18),),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(121, 71, 144, 0.3)
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int totalSlides;

  _Dots(
    this.totalSlides,
  );

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 50),
      width: double.infinity,
      height: 90,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.totalSlides, (index) => _Dot(index))
      ),
    );

  }

}

class _Dot extends StatelessWidget {

  final int index;

  _Dot(
    this.index,
  );

  @override
  Widget build(BuildContext context) {

    final ssModel = Provider.of<_SlideshowModel>(context);
    double tamano;
    Color color;

    if (ssModel.currentPage >= index - 0.5 && ssModel.currentPage < index + 0.5) {
      tamano = ssModel.bulletPrimario;
      color = ssModel.colorPrimario;
    } else {
      tamano = ssModel.bulletSecundario;
      color = ssModel.colorSecundario;
    } 

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page;
    });

  }

  @override
  void dispose() { 
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );

  }
}

class _Slide extends StatelessWidget {

  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      // padding: EdgeInsets.all(30),
      child: slide,
    );

  }

}

class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color color) {
    this._colorPrimario = color;
    // notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color color) {
    this._colorSecundario = color;
    // notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
    // notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
    // notifyListeners();
  }

}

