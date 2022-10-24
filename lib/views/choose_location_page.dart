import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_page.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({Key? key}) : super(key: key);

  @override
  State<ChooseLocationPage> createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şehir Seç")),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Şehir',
                  hintText: 'Şehir Seçiniz',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WeatherPage(location: _textController.text,)));
              },
              icon: Icon(Icons.search))
        ],
      )),
    );
  }
}
