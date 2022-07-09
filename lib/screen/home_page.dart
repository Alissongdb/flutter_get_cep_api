import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:with_api/model/zip_code.dart';
import 'package:with_api/service/rest_client.dart';

import '../widget/default_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _zipCodeText = '';
  final _restClient = RestClient(Dio());
  ZipCode? _zipCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar CEP'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 8,
                decoration: InputDecoration(
                  labelText: 'Informe o CEP',
                ),
                onChanged: (zipcode) {
                  setState(() {
                    _zipCodeText = zipcode;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            DefaultButton(
              textColor: Colors.white,
              buttonColor: Colors.blue,
              text: 'Buscar CEP',
              function: () async {
                await _getCep();
                setState(() {});
              },
            ),
            SizedBox(
              height: 50,
            ),
            if (_zipCode != null) _zipCodeWidget(_zipCode),
          ],
        ),
      ),
    );
  }

  Widget _zipCodeWidget(ZipCode? zipCode) {
    return Column(
      children: [
        ListTile(
          title: Text('CEP'),
          subtitle: Text(zipCode!.zipcode ?? "-"),
        ),
        ListTile(
          title: Text('Rua'),
          subtitle: Text(zipCode.street ?? "-"),
        ),
        ListTile(
          title: Text('Bairro'),
          subtitle: Text(zipCode.district ?? "-"),
        ),
        ListTile(
          title: Text('Cidade'),
          subtitle: Text(zipCode.location ?? "-"),
        ),
        ListTile(
          title: Text('UF'),
          subtitle: Text(zipCode.uf ?? "-"),
        ),
      ],
    );
  }

  Future<void> _getCep() async {
    try {
      _zipCode = await _restClient.getCep(_zipCodeText);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
