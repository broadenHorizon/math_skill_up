import 'package:flutter/material.dart';

class SlidingToggleButton<T extends Enum> extends StatefulWidget {
  final String title; // 제목
  final List<T> values; // Enum 값 리스트
  final void Function(T selectedOption) onOptionSelected; // 선택된 옵션 콜백

  const SlidingToggleButton({
    super.key,
    required this.title,
    required this.values,
    required this.onOptionSelected,
  });

  @override
  State<SlidingToggleButton<T>> createState() => _SlidingToggleButtonState<T>();
}

class _SlidingToggleButtonState<T extends Enum>
    extends State<SlidingToggleButton<T>> {
  int _selectedIndex = 0; // 선택된 버튼의 인덱스

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final buttonWidth =
                      constraints.maxWidth / widget.values.length;

                  return Stack(
                    children: [
                      // Animated background for the selected button
                      AnimatedPositioned(
                        left: _selectedIndex * buttonWidth,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        child: Container(
                          width: buttonWidth,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      // Options (foreground text)
                      Row(
                        children: List.generate(widget.values.length, (index) {
                          final isSelected = _selectedIndex == index;
                          final option = widget.values[index];

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                                widget.onOptionSelected(option);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                child: Text(
                                  (option as dynamic).displayName ??
                                      option.toString(),
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
