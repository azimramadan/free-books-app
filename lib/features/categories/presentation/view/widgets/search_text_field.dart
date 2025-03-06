import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.shouldFocusSearch});
  final bool shouldFocusSearch;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // إذا كان البحث يجب أن يكون نشطًا، نفعل الـ FocusNode تلقائيًا
    if (widget.shouldFocusSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      // validator: validator,
      // obscureText: obscureText ?? false,
      focusNode: focusNode,
      cursorColor: kSecondaryColor,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(Icons.search, color: kSecondaryColor),
        ),
        filled: true,
        fillColor: const Color(0xffDEDEDE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
        ),

        hintText: 'Search title/author/ISBN no',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: kSecondaryColor,
        ),
      ),
    );
  }
}
