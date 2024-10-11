import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/constants/images_assets.dart';

class Pet_profile extends StatelessWidget {
  const Pet_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: 428,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(appImages.Cachorro2),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(26)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 24,
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color(0xFF5250E1),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      appImages.MessageIcon,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                  ),
                )
              ],
            ),
          ),
        ),
        Pet_profile_Image_name_location(),
        Btns(),
        Description(),
      ]),
    );
  }
}

class Btns extends StatelessWidget {
  const Btns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(182, 52),
              side: BorderSide(
                color: Color(0xFFFC7171),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16), // Altere o valor para ajustar o arredondamento
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xFFFC7171),
                  ),
                ),
                Text("Love(1,162)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(182, 52),
              side: BorderSide(
                color: Color(0xFF5250E1),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    16), // Altere o valor para ajustar o arredondamento
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.share,
                    color: Color(0xFF5250E1),
                  ),
                ),
                Text(
                  "Share(1,162)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 203,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF5BCF95),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            style: TextStyle(color: Colors.white, fontSize: 16),
            "There was never a patch of sun that Ginger wasn’t to be found sleeping in! I’ve never known such a lazy yet loving cat.6 incredible years we shared together, you knew me better than I knew myself. Thank you for all the endless love. Miss you already.",
          ),
        ),
      ),
    );
  }
}

class Pet_profile_Image_name_location extends StatelessWidget {
  const Pet_profile_Image_name_location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 108.0, // Largura do container
              height: 108.0, // Altura do container
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(appImages.DogProfile), // Imagem asset
                  fit: BoxFit.cover, // Como a imagem deve se ajustar
                ),
              ),
            ),
          ),
          Text(
            "Username",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Color(0xFFFC7171),
              ),
              Text(
                "New York City",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
