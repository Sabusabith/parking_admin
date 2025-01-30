import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ChartController extends GetxController {
  // Rx variables to hold the data
  var bookedSlots = 27.obs;
  var freeSlots = 3.obs;
  var percentageBooked = 80.0.obs;

  // Function to fetch data from an API
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://your-api-endpoint.com/data'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      bookedSlots.value = data['bookedSlots'];
      freeSlots.value = data['freeSlots'];
      percentageBooked.value = (bookedSlots.value / (bookedSlots.value + freeSlots.value)) * 100;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
