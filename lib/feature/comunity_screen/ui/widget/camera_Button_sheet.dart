import 'package:flutter/material.dart';

class CameraModelBottonSheet extends StatelessWidget {
  const CameraModelBottonSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(20),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose..',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('camera'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      color: Colors.grey,
                    ),
                    title: Text('Add a photo'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Icon(Icons.camera_alt_outlined),
    );
  }
}
