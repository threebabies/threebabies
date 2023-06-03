import 'package:flutter/material.dart';

class OrderFormPage extends StatefulWidget {
  @override
  _OrderFormPageState createState() => _OrderFormPageState();
}

class _OrderFormPageState extends State<OrderFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _size = "";
  String _brand = "";
  int _quantity = 0;
  DateTime _arrivalDate = DateTime.now();
  String _remark = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
                validator: (value) {
                  if (value == null) return null;
                  if (value.isEmpty) {
                    return 'Please enter the quantity';
                  }
                  return null;
                },
                onSaved: (value) {
                  _quantity = int.parse(value ?? "0");
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Size',
                ),
                validator: (value) {
                  if (value == null) return null;
                  if (value.isEmpty) {
                    return 'Please enter the size';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value == null) return;
                  _size = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Brand',
                ),
                validator: (value) {
                  if (value == null) return null;
                  if (value.isEmpty) {
                    return 'Please enter the brand';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value == null) return;
                  _brand = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Arrival Date',
                ),
                validator: (value) {
                  if (value == null) return null;
                  if (value.isEmpty) {
                    return 'Please enter the arrival date';
                  }
                  return null;
                },
                onTap: () async {
                  final now = DateTime.now();
                  final date = await showDatePicker(
                    context: context,
                    initialDate: now,
                    firstDate: now,
                    lastDate: now.add(Duration(days: 365)),
                  );
                  if (date != null) {
                    setState(() {
                      _arrivalDate = date;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  text: _arrivalDate != null
                      ? '${_arrivalDate.day}/${_arrivalDate.month}/${_arrivalDate.year}'
                      : '',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Remark (Optional)',
                ),
                onSaved: (value) {
                  if (value == null) return null;
                  _remark = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   _formKey.currentState.save();
                    //   // Submit the form data to the server
                    // }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}