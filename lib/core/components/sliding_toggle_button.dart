import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SlidingToggleButton<T extends Enum> extends HookWidget {
  final String title; // 제목
  final T value; // 현재 값
  final List<T> values; // Enum 값 리스트
  final void Function(T selectedOption) onOptionSelected; // 선택된 옵션 콜백

  const SlidingToggleButton({
    super.key,
    required this.title,
    required this.value,
    required this.values,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    // 상태 관리: 현재 선택된 인덱스
    final selectedIndex = useState(values.indexOf(value));

    // value가 변경될 때 selectedIndex를 업데이트
    useEffect(() {
      selectedIndex.value = values.indexOf(value);
      return null;
    }, [value]);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
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
                  final buttonWidth = constraints.maxWidth / values.length;

                  return Stack(
                    children: [
                      // Animated background for the selected button
                      AnimatedPositioned(
                        left: selectedIndex.value * buttonWidth,
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
                        children: List.generate(values.length, (index) {
                          final isSelected = selectedIndex.value == index;
                          final option = values[index];

                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                selectedIndex.value = index;
                                onOptionSelected(option);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 48,
                                child: Text(
                                  (option as dynamic).displayName ??
                                      option.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          color: isSelected
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary
                                              : null),
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
