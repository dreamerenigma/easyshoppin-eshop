import 'package:flutter/material.dart';

class FeedbackDropdown extends StatelessWidget {
  const FeedbackDropdown({
    super.key,
    required this.dropdownValue,
    required this.onChanged,
  });

  final String? dropdownValue;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return InputDecorator(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.only(right: 8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          isExpanded: true,
          style: TextStyle(
            color: isDarkTheme ? Colors.grey : Colors.black,
            fontSize: 16,
          ),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: onChanged,
          items: <String>[
            'Сообщить о неполадке',
            'Предложить новую функцию',
            'Сообщить о проблеме с заказом',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(fontSize: 16)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
