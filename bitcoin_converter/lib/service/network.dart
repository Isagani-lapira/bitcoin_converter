import 'dart:convert';
import 'package:bitcoin_converter/model/crypto_data.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String assetIDBase;
  final String assetIdQuote;

  const NetworkHelper({required this.assetIDBase, required this.assetIdQuote});
  final String _baseURL = 'rest.coinapi.io';
  final String _pathUrl = '/v1/exchangerate/';
  final String _apiKey = '7A320769-E2D0-4D77-AD9A-9280F0C7E4DF';

  Future getExchangeRate() async {
    Uri uri = Uri.http(
      _baseURL,
      '$_pathUrl$assetIDBase/$assetIdQuote',
      {'apiKey': _apiKey},
    );

    http.Response response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        List<CryptoData> cryptoData = [];
        cryptoData.add(CryptoData(
          cryptoLabel: data['asset_id_base'],
          currency: data['asset_id_quote'],
          rateVal: data['rate'].toDouble().toStringAsFixed(5),
        ));

        return cryptoData;
      }
    } catch (e) {
      print(e);
    }
  }
}
  

// https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=7A320769-E2D0-4D77-AD9A-9280F0C7E4DF