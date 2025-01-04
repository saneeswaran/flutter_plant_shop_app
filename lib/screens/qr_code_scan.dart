// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class QrCodeScan extends StatefulWidget {
  const QrCodeScan({super.key});
  @override
  State<QrCodeScan> createState() => _ScanPageState();
}

class _ScanPageState extends State<QrCodeScan> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green.withOpacity(.15),
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('favorite');
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green.withOpacity(.15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/code-scan.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tap to Scan',
                      style: TextStyle(
                        color: Colors.green.withOpacity(.80),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
