import 'package:fancy_dialog/FancyAnimation.dart';
import 'package:fancy_dialog/FancyGif.dart';
import 'package:fancy_dialog/FancyTheme.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/productos_model.dart';

class Cart extends StatefulWidget {
  final List<ProductosModel> _cart;

  Cart(this._cart);
  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enable = false;

  List<ProductosModel> _cart;

  Container pagoTotal(List<ProductosModel> _cart){
    return Container(
      height: 70,
      color: Colors.grey[200],
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'TOTAL',
              style: TextStyle(
                fontFamily: 'Acme',
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
                color: Colors.black45,
                letterSpacing: 2.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              '\S/  ${valorTotal(_cart)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
                fontFamily: 'Acme',
                color: Colors.redAccent,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String valorTotal(List<ProductosModel> listaProductos){
    double total = 0.0;

    for(int i=0; i<listaProductos.length; i++){
      total = total + listaProductos[i].precio * listaProductos[i].cantidad;
    }
    return total.toStringAsFixed(2);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'CARRITO DE COMPRA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21.0,
            color: Colors.white,
            fontFamily: 'Acme',
            letterSpacing: 2.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          icon: Icon(Icons.arrow_back,size:30.0),
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),

      body: GestureDetector(
        onVerticalDragUpdate: (details){
          if(_enable && _firstScroll){
            _scrollController.jumpTo(_scrollController.position.pixels - details.delta.dy);
          }
        },
        onVerticalDragEnd: (_){
          if(_enable) _firstScroll = false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index){
                  final String imagenes = _cart[index].imagen;
                  var item = _cart[index];
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 90,
                                  height: 90,
                                  child: Image.asset(
                                    'assets/images/$imagenes',
                                    fit:BoxFit.contain,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          item.nombre,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontFamily: 'Acme',
                                            letterSpacing: 1.0,
                                            color: Colors.black45,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Colors.blueGrey,
                                                    offset: Offset(0.0, 0.0),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(top: 20.0),
                                              child: new Row(
                                                children: <Widget>[
                                                  IconButton(
                                                    onPressed: (){
                                                      _removeProduct(index);
                                                      valorTotal(_cart);
                                                    },
                                                    icon: Icon(Icons.remove,size: 17.0,),
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    '${_cart[index].cantidad}',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 15.0,
                                                      color: Colors.blueGrey,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: (){
                                                      _addProduct(index);
                                                      valorTotal(_cart);
                                                    },
                                                    icon: Icon(Icons.add, size: 17.0,),
                                                    color: Colors.grey,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                new Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    child: Text(
                                      'S/  ${item.precio.toString()}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Acme',
                                        fontSize: 20.0,
                                        letterSpacing: 1.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.purple,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              pagoTotal(_cart),
              SizedBox(
                width: 20.0,
              ),
              Container(
                height: 100,
                width: 200,
                padding: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('PAGAR'),
                  onPressed: () => {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => FancyDialog(
                          title: "¿ACEPTAS LA COMPRA?",
                          descreption: "en buena hora ^.^",
                          animationType: FancyAnimation.BOTTOM_TOP,
                          theme: FancyTheme.FANCY,
                          gifPath: FancyGif.MOVE_FORWARD,
                          ok: "PAGAR",
                          cancel: "CANCELAR",
                          okFun: () => {print('Todo en orden!')},
                        )
                    )
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _addProduct(int index){
    setState(() {
      _cart[index].cantidad++;
    });
  }

  _removeProduct(int index){
    setState(() {
      _cart[index].cantidad--;
    });
  }

}
