import 'package:flutter/material.dart';

class FipeDropdownButton extends StatelessWidget {
  const FipeDropdownButton({
    super.key,
    this.value,
    this.loading = false,
    required this.hint,
    required this.items,
    required this.onChangeFunc,
  });

  final bool loading;
  final String? value;
  final String hint;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?) onChangeFunc;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LinearProgressIndicator()
        : Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  underline: null,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  hint: Text(hint),
                  isExpanded: true,
                  value: value,
                  icon: const Icon(Icons.arrow_downward),
                  items: items,
                  onChanged: onChangeFunc,
                ),
              ),
            ),
          );
  }
}
