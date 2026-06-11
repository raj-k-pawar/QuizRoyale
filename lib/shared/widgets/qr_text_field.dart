import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:quiz_royale/core/theme/app_colors.dart';
import 'package:quiz_royale/core/theme/app_dimensions.dart';
import 'package:quiz_royale/core/theme/app_text_styles.dart';

class QrTextField extends StatefulWidget {
  const QrTextField({
    super.key,
    required this.hint,
    this.label,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.inputFormatters,
    this.prefixIcon,
    this.autofocus = false,
    this.enabled = true,
    this.focusNode,
    this.errorText,
  });

  final String hint;
  final String? label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final IconData? prefixIcon;
  final bool autofocus;
  final bool enabled;
  final FocusNode? focusNode;
  final String? errorText;

  @override
  State<QrTextField> createState() => _QrTextFieldState();
}

class _QrTextFieldState extends State<QrTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: AppTextStyles.labelMedium),
          const SizedBox(height: AppDimensions.xs),
        ],
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmitted,
          validator: widget.validator,
          obscureText: _obscure,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          style: AppTextStyles.bodyLarge,
          cursorColor: AppColors.crownGold,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            counterText: '',
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: AppColors.textSecondary,
                    size: AppDimensions.iconMD,
                  )
                : null,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
