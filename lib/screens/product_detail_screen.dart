import 'package:flutter/material.dart';
import 'package:formularios/ui/input_decoration.dart';
import 'package:formularios/widgets/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title:Text('Producto') ,),
      body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              ProductImage(),
              Positioned(
                  top: 60,
                  left: 20,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 40,
                        color: Colors.white,
                      ))),
              Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                        color: Colors.white,
                      ))),
            ],
          ),
          _ProductForm(),
          SizedBox(
            height: 100,
          )
        ],
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    floatingActionButton:FloatingActionButton(
      child: Icon(Icons.save_outlined),
      onPressed: (){
        
      },
    )

    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecorationForm(),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField( 
                decoration: InputDecorations.authInputDecoration(hinText: 'Nombre del Producto', labelText: 'Nombre'),),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(hinText: '\$150', labelText: 'Precio'),
                ),
              SizedBox(height: 10,),
              SwitchListTile.adaptive(
                value: true, 
                activeColor: Colors.indigo,
                title: Text('Disponible'),
                onChanged: (value){

              })


            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecorationForm() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,5),
            blurRadius: 15
          )
        ]

        );
  }
}
