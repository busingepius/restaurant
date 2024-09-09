import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/models.dart';

// FutureProvider to fetch data from the Google Drive file
final dataProvider = FutureProvider<List<Menu>>((ref) async {
  const fileUrl =
      'https://drive.google.com/uc?export=download&id=1uN_gk2oJ5F4JMAsbjThTmER3LffulsZ2';

  final response = await http.get(Uri.parse(fileUrl));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List;

    return jsonData.map((item) => Menu.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load data');
  }
});


// Search screen to implement the search functionality
final searchProvider = StateProvider<String>((ref) => '');

final filteredDataProvider = Provider<List<Menu>>((ref) {
  final searchQuery = ref.watch(searchProvider).toLowerCase();
  final dataList = ref.watch(dataProvider).asData?.value ?? [];

  // Filter the data based on the search query
  return dataList
      .where((data) => data.name.toLowerCase().contains(searchQuery))
      .toList();
});