import 'package:flutter/material.dart';
import 'package:tasks/app/constants/strings.dart';

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget({
    super.key,
    required this.values,
    this.dropDownValue,
    required this.onChanged,
    this.textColor,
  });

  final List<DropdownMenuItem<Object?>> values;
  final dynamic dropDownValue;
  final Function(Object?) onChanged;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier valueNotifier = ValueNotifier(dropDownValue);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, dropDownValue, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: DropdownButton(
                value: dropDownValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 24.0,
                  color: Colors.black,
                ),
                isExpanded: true,
                dropdownColor: Colors.grey.shade100,
                elevation: 5,
                underline: const SizedBox(),
                onChanged: (value) {
                  dropDownValue = value;
                  onChanged(value);
                },
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text(
                      AppStrings.dropdownText,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ...values
                ],
              ),
            );
          }),
    );
  }
}
