import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget{
  static const ROUTENAME = "/editproducts";
  @override
  State<StatefulWidget> createState() {
    return EditProductScreenState();
  }
}
class EditProductScreenState extends State<EditProductScreen>{
  FocusNode _priceFocusNode = FocusNode();
  FocusNode _descriptionFocusNode = FocusNode();
  TextEditingController _iMageUrlController = TextEditingController();
  FocusNode _iMageUrlFocusNode = FocusNode();
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _iMageUrlFocusNode.removeListener(onFocusReMoved);
    _iMageUrlFocusNode.dispose();
    super.dispose();
  }
  void onFocusReMoved(){
    if(!_iMageUrlFocusNode.hasFocus){
      setState(() {

      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iMageUrlFocusNode.addListener(onFocusReMoved);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
        child: ListView(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Title"),
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value){
            print("value is " + value);
            FocusScope.of(context).requestFocus(_priceFocusNode);
          },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Price"),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            focusNode: _priceFocusNode,
            onFieldSubmitted: (value){
              FocusScope.of(context).requestFocus(_descriptionFocusNode);
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Description"),
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            focusNode: _descriptionFocusNode,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                margin: EdgeInsets.only(top: 10, right: 10),
                child: _iMageUrlController.text.isEmpty ? Text("Enter iMage url") : FittedBox(
                  child: Image.network(_iMageUrlController.text),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: TextFormField(
                keyboardType: TextInputType.url,
                decoration: InputDecoration(labelText: "IMage Url"),
                textInputAction: TextInputAction.done,
                controller: _iMageUrlController,
                    focusNode: _iMageUrlFocusNode,
              )
              )
            ],
          )
        ],),
      ),
    )
    );
  }
}