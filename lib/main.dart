import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/models/productos_model.dart';
import 'package:shop_app/pages/otra_pagina.dart';
import 'package:shop_app/pages/pedido_lista.dart';

// Future<void> main() async{
void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

//SHA1: 51:05:08:81:9D:90:72:57:D7:E0:C2:93:1D:8F:DE:3A:3D:3D:F0:1A

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.redAccent),
      home: MyHomePage(
        title: 'AYDREE',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductosModel> _productosModel = <ProductosModel>[];

  List<ProductosModel> _listaCarro = <ProductosModel>[];

  @override
  void initState() {
    super.initState();
    _productosDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Icon(Icons.shopping_cart_outlined,
                      size: 33.0,
                      color: Colors.white,
                    ),
                  ),
                  if(_listaCarro.length > 0)
                    Padding(padding: const EdgeInsets.only(left: 35.0),
                    child: CircleAvatar(
                      radius: 10.0,
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.red,
                      child: Text(
                        _listaCarro.length.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                      ),
                    ),)
                ],
              ),
              onTap: (){
                if(_listaCarro.isNotEmpty)
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Cart(_listaCarro),
                  ));
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          // width: MediaQuery.of(context).size.width*0.5,
          color: Colors.white,
          child: new ListView(
            padding: EdgeInsets.only(top: 50.0),
            children: <Widget>[
              Container(
                height: 120,
                child: UserAccountsDrawerHeader(
                  accountName: Text(''),
                  accountEmail: Text(''),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/PORTADA.png'),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Productos',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Acme',
                    fontSize: 19.0,
                  ),
                ),
                trailing: Icon(
                  Icons.shop_outlined,
                  size: 30.0,
                  color: Colors.redAccent,
                ),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => MyHomePage(title: 'AYDREE'),     //OBSERVACION <!>
                )),
              ),
              ListTile(
                title: Text(
                  'Carrito de compras',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Acme',
                    fontSize: 19.0,
                  ),
                ),
                trailing: Icon(
                  Icons.shopping_cart_outlined,
                  size: 30.0,
                  color: Colors.redAccent,
                ),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => Cart(_listaCarro),
                )),
              ),
              ListTile(
                title: Text(
                  'Usuario',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Acme',
                    fontSize: 19.0,
                  ),
                ),
                trailing: Icon(
                  Icons.person_outline_outlined,
                  size: 30.0,
                  color: Colors.redAccent,
                ),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => OtraPagina(),
                )),
              ),
              ListTile(
                title: Text(
                  'Ubicanos',
                  style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Acme',
                    fontSize: 19.0,
                  ),
                ),
                trailing: Icon(
                  Icons.location_on_outlined,
                  size: 30.0,
                  color: Colors.redAccent,
                ),
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => OtraPagina(),
                )),
              ),
            ],
          ),
        ),
      ),
      body: _cuadroProductos(),
    );
  }

  GridView _cuadroProductos(){
    return GridView.builder(
      padding: const EdgeInsets.all(4.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2
      ),
      itemCount: _productosModel.length,
      itemBuilder: (context, index){
        final String imagenes = _productosModel[index].imagen;
        var item = _productosModel[index];
        return Card(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0, top: 10.0),
          elevation: 4.0,
          shadowColor: Colors.redAccent,
          child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/images/$imagenes',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    item.nombre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'Acme',
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        item.precio.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8.0,
                          bottom: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            child: (!_listaCarro.contains(item))
                            ? Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.blueGrey,
                              size: 30,
                            ) :
                            Icon(
                              Icons.add_shopping_cart_outlined,
                              color: Colors.green,
                              size: 30,
                            ),
                            onTap: (){
                              setState(() {
                                if(!_listaCarro.contains(item))
                                  _listaCarro.add(item);
                                else
                                  _listaCarro.remove(item);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        );
      },
    );
  }


  //INICIO BASE DE DATOS LOCAL
  void _productosDb(){
    var list = <ProductosModel>[
      ProductosModel(
          nombre: 'Mouse Optico',
          precio: 15.00,
          imagen: 'mouse.jpg',
          color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Celular Samsung',
        precio: 759.95,
        imagen: 'cel_samsung_galaxy_m12.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Celular Umidigi',
        precio: 450.00,
        imagen: 'cel_umidigi_bison.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Laptop Lenovo 81w',
        precio: 3200.00,
        imagen: 'lap_lenovo_81w.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Laptop Lenovo Yoga',
        precio: 4000.00,
        imagen: 'lap_lenovo_yoga.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Play Station 5',
        precio: 2455.00,
        imagen: 'play_5.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Camara Web Uby',
        precio: 60.00,
        imagen: 'camara_uby.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Camara Web Oem',
        precio: 84.19,
        imagen: 'camara_oem.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Auricular Xiaomi',
        precio: 85.29,
        imagen: 'auricular_xiaomi_true.jpg',
        color: Colors.black,
      ),
      ProductosModel(
        nombre: 'Auricular Skullcandy',
        precio: 154.89,
        imagen: 'auricular_skullcandy.jpg',
        color: Colors.black,
      ),
    ];

    setState(() {
      _productosModel = list;
    });
  }//FIN DE LA BASE DE DATOS LOCAL

}
