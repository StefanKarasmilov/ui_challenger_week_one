import 'package:flutter/material.dart';
import 'package:ui_challenger/src/widgets/slideshow.dart';


class DetallePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: size.height * 0.60,
              child: _pageView(),
            ),
            _buttonsUp(context),
            _purpleContainer(context),
            _contentContainer(context),
          ],
        ),
      ),
      floatingActionButton: _floatingButton()
    );

  }

  Widget _floatingButton() {

    return Container(
      margin: EdgeInsets.only(bottom: 80, right: 35),
      child: FloatingActionButton(
        elevation: 20,
        child: Icon(Icons.email),
        backgroundColor: Color.fromRGBO(240, 94, 100, 1),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
      ),
    );

  }

  Widget _pageView() {

    return Slideshow(
      colorPrimario: Color.fromRGBO(121, 71, 144, 1),
      colorSecundario: Colors.white,
      bulletPrimario: 15,
      puntosArriba: false,
      slides: <Widget> [
        Image(
          image: NetworkImage('https://casaydiseno.com/wp-content/uploads/2016/03/opciones-diseno-colorido-comedor-color-purpura-oscuro-pared.jpg'),
          fit: BoxFit.cover,
        ),
        Image(
          image: NetworkImage('https://i.pinimg.com/originals/59/61/87/596187d36846ad60320b24faff63f4ac.jpg'),
          fit: BoxFit.cover,
        ),
        Image(
          image: NetworkImage('https://s1.1zoom.me/b5050/534/Interior_Sofa_Violet_Pillows_553521_3840x2160.jpg'),
          fit: BoxFit.cover,
        ),
        Image(
          image: NetworkImage('https://3.bp.blogspot.com/_LeuXdrK8ksY/S0MOVoBXd2I/AAAAAAAAAkc/c9R9YShsmwQ/s400/cuartos+morados.jpg'),
          fit: BoxFit.cover,
        ),
      ]
    );

  }

  Widget _buttonsUp(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back), 
            color: Colors.white,
            iconSize: 35, 
            onPressed: () => Navigator.pop(context),
          ), 
          IconButton(
            icon: Icon(Icons.more_vert), 
            color: Colors.white,
            iconSize: 35, 
            onPressed: () {},
          ),
        ],
      ),
    );

  }

  Widget _purpleContainer(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: size.height * 0.45,
        decoration: BoxDecoration(
          color: Color.fromRGBO(121, 71, 144, 1),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _priceContainer('\$1,700', 'Stefan Karasmilov'),
            _options(Icons.move_to_inbox, Icons.favorite_border),
          ],
        ),
      ),
    );

  }

  Widget _options(IconData iconOne, IconData iconTwo) {

    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Icon(iconOne, color: Colors.white,),
          SizedBox(height: 15,),
          Icon(iconTwo, color: Colors.white,)
        ],
      ),
    );

  }

  Widget _priceContainer(String price, String text) {

    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Text(price, style: TextStyle(color: Colors.white, fontSize: 50),),
          SizedBox(height: 10,),
          Text(text, style: TextStyle(color: Colors.white, fontSize: 18),),
        ],
      ),
    );

  }

  Widget _contentContainer(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: size.height * 0.28,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
        ),
        child: Column(
          children: <Widget>[
            _upRow(),
            Divider(
              color: Color.fromRGBO(121, 71, 144, 0.8), 
              endIndent: 150, 
              indent: 50, 
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              alignment: Alignment.bottomLeft,
              child:Text(
                'Building',
                style: TextStyle(
                  color: Color.fromRGBO(121, 71, 144, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            _downRow(),
          ],
        ),
      ),
    );

  }

  Widget _upRow() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _serviceContainer(
          AssetImage('assets/icons/bed.png'), 
          '1 Bed'
        ),
        _serviceContainer(
          AssetImage('assets/icons/pool.png'), 
          'Pool'
        ),
        _serviceContainer(
          AssetImage('assets/icons/wifi.png'), 
          'Wifi'
        ),
        SizedBox(width: 40,)
      ],
    );

  }

  Widget _downRow() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _serviceContainer(
          AssetImage('assets/icons/elevator.png'), 
          'Elevator'
        ),
        _serviceContainer(
          AssetImage('assets/icons/washing_machine.png'), 
          'Laundry'
        ),
        _serviceContainer(
          AssetImage('assets/icons/gym.png'), 
          'Gym'
        ),
        _serviceContainer(
          AssetImage('assets/icons/safety_box.png'), 
          'Security'
        ),
      ],
    );

  }

  Widget _serviceContainer(AssetImage icon, String text) {

    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          ImageIcon(
            icon,
            color: Color.fromRGBO(121, 71, 144, 0.8),
            size: 30,
          ),
          SizedBox(height: 4,),
          Text(
            text,
            style: TextStyle(
              color: Color.fromRGBO(121, 71, 144, 0.8),
              fontSize: 15
            ),
          )
        ],
      ),
    );

  }

}