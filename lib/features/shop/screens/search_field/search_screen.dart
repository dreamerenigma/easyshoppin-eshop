import 'package:flutter/material.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container_screen.dart';
import '../../../../generated/l10n/l10n.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_sizes.dart';

class SearchScreen extends StatefulWidget {
  final String searchText;

  const SearchScreen({super.key, required this.searchText});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late String searchText;
  late FocusNode _focusNode;
  final TextEditingController _controller = TextEditingController();
  List<String> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    searchText = widget.searchText;
    Future.delayed(Duration(milliseconds: 100), () {
      if (_focusNode.canRequestFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
          Padding(
            padding: EdgeInsets.only(right: TSizes.spaceBtwItemsSmall),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TSearchContainerScreen(
                    text: S.of(context).whatAreWeGoingLookFor,
                    showBorder: false,
                    showBackground: false,
                    padding: EdgeInsets.zero,
                    onChanged: _onSearchTextChanged,
                    controller: _controller,
                    focusNode: _focusNode,
                    textStyle: const TextStyle(color: TColors.blue, fontSize: TSizes.fontSizeMd),
                  ),
                ),
              ],
            ),
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
                  Text(S.of(context).searchHistory, style: Theme.of(context).textTheme.bodyMedium),
                  GestureDetector(
                    onTap: _clearSearchHistory,
                    child: Text(S.of(context).clear, style: TextStyle(color: TColors.blue)),
                  ),
                ],
              ),
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
