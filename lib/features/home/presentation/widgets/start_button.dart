import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 0,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 120,
                height: 120,
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(100.0),
                  // border: Border.all(color: Colors.black, width: 4),
                ),
                child: IconButton(
                  onPressed: () {
                    // TODO: 문제 풀이 화면으로 이동
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    size: 60,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '문제 풀기',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
