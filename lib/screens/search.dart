import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';



class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredData = ref.watch(filteredDataProvider); // Watch filtered data

    return Scaffold(
      appBar: AppBar(
        title:const Text('Search Restaurants by name'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                ref.read(searchProvider.notifier).state = value; // Update search query
              },
              decoration: const InputDecoration(
                labelText: 'Search Restaurant',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // Display the filtered list of restaurants
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final restaurant = filteredData[index];
                return ListTile(
                  title: Text(restaurant.name),
                  subtitle: Text(restaurant.cuisine),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
