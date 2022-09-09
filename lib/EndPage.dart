import 'package:flutter/material.dart';

class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Icon(
              Icons.done_all_outlined,
              size: 250,
              color: Colors.green,
            ),
            const SizedBox(
              height: 300,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints.tightFor(
                  width: double.infinity, height: 50),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 18, 50, 107)),
                  ),
                  child: const Text('QUAY LẠI TRANG ĐĂNG NHẬP')),
            ),
          ],
        ),
      ),
    );
  }
}
