import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          hintText: "What do you do?",
          hintStyle: AppTextStyles.body.copyWith(
            color: Color(0xFF888C93)
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),

          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              CupertinoIcons.slider_horizontal_3,
              size: 20,
            ),
          ),

          filled: true,
          fillColor: AppColors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFFC9CEDA),
              width: 1,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFE5E5E5),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
