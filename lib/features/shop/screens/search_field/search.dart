import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container_screen.dart';

class SearchScreen extends StatefulWidget {
  final String searchText;

  const SearchScreen({super.key, required this.searchText});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late String searchText;
  final TextEditingController _controller = TextEditingController();
  List<String> _searchResults = [];

  void _onSearchTextChanged(String text) {
    setState(() {
      searchText = text;
      _searchResults = _performSearch(text);
    });
  }

  List<String> _performSearch(String query) {
    if (query.isEmpty) {
      return [];
    }
    return ["Product 1", "Product 2", "Product 3"]
        .where((product) => product.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void _clearSearchHistory() {
    setState(() {
      searchText = "";
      _controller.clear();
      _searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        backArrowColor: Theme.of(context).iconTheme.color,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Align items to the center
            children: [
              TSearchContainerScreen(
                text: "Search...",
                showBorder: false,
                showBackground: false,
                padding: EdgeInsets.zero,
                onChanged: _onSearchTextChanged,
                controller: _controller,
                width: 300,
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontSize: 16.0,
                  // Add more text styles as needed
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_searchResults.isNotEmpty) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'История поиска',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: _clearSearchHistory,
                    child: const Text(
                      'Очистить',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              // Display the search results here
              ..._searchResults.map((result) => ListTile(
                title: Text(result),
              )),
            ],
          ],
        ),
      ),
    );
  }
}
