import 'package:flutter/material.dart';
import 'package:stckshaper/style.dart';

class MyTile extends StatelessWidget {
  const MyTile({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
          ),
        ),
        elevation: 0,
      ),
      icon: Container(
        alignment: Alignment.centerLeft,
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: kMainColor,
              child: const FittedBox(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                      fontSize: 12,
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

