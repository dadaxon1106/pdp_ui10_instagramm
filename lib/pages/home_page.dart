import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Center(
                  child: const Text(
                    "txt_flutter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ).tr(),
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Colors.green,
                        onPressed: () {
                          context.setLocale(const Locale('en', 'US'));
                        },
                        child: const Text("English"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.red,
                        onPressed: () {
                          context.setLocale(const Locale('ko', 'KOR'));
                        },
                        child: const Text("Korean"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          context.setLocale(const Locale('ja', 'JPN'));
                        },
                        child: const Text("Japanese"),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
