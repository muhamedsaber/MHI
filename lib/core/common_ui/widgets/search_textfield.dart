import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField(
      {super.key,
      required this.onSubmitted,
      required this.hintText,
      required this.isFocused,
      required this.isItArabic});
  final void Function(String)? onSubmitted;
  final String hintText;
  final bool isFocused;
  final bool isItArabic;
  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      child: TextField(
        autofocus: widget.isFocused,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          decorationThickness: 0,
          fontWeight: FontWeight.w600,
          fontSize: 25,
          letterSpacing: 1.2,
        ),
        textDirection:
            widget.isItArabic ? TextDirection.rtl : TextDirection.ltr,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintTextDirection: TextDirection.ltr,
          hintStyle: TextStyle(
              fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
          ),
          border: _borderBuilder(),
          enabledBorder: _borderBuilder(),
          focusedBorder: _borderBuilder(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 2,
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
