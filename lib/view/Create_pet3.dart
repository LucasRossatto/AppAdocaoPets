import 'package:flutter/material.dart';

class Create_Pet3 extends StatelessWidget {
  const Create_Pet3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Upload video, photo",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Image_input(),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              width: 295,
              child: Text(
                "The application does not yet have access to your camera, please allow to get started",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Create_Pet3(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(364, 60),
                      backgroundColor: Color(0xFF5250E1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      'Allow Access to library',
                      style: TextStyle(
                        fontSize: 16, // Tamanho da fonte
                        fontWeight: FontWeight.bold, // Negrito
                        color: Colors.white, // Cor do texto
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Cancel",
              style: TextStyle(color: Color(0xFFFC7171), fontSize: 16,fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class Image_input extends StatelessWidget {
  const Image_input({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Container(
          width: 108,
          height: 108,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Color(0xFFEBF0F0),
          ),
          child: IconButton(
              iconSize: 48,
              onPressed: () {},
              icon: Icon(Icons.image_outlined),
              color: Colors.grey)),
    );
  }
}
