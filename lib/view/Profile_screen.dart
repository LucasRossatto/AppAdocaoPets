import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/view/Home.screen.dart';
import 'package:flutter_adocaopets/view/MyPets.dart';

import '../constants/images_assets.dart';
import '../widgets/Swtich_Btn.dart';

class Profile_Screen extends StatelessWidget {
  const Profile_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 28),
            child: header(),
          ),
          Profile_image_usernames(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              child: Column(
                children: [
                  Divider(height: 0),
                  Edit(),
                  Divider(height: 0),
                  Notifications(),
                  Divider(height: 0),
                  info(),
                  Divider(height: 0),
                  Theme(),
                  Divider(height: 0),
                  Logout()
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/icons/Home.png',
                  width: 24,
                  height: 24,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Mypets(),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/icons/Paw.png',
                  width: 24,
                  height: 24,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/icons/Message.png',
                    width: 24, height: 24),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profile_Screen(),
                    ),
                  );
                },
                icon: Image.asset(
                  'assets/icons/Person.png',
                  width: 24,
                  height: 24,
                  color: Color(0xFF5250E1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Logout extends StatelessWidget {
  const Logout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.exit_to_app_rounded,
              size: 24, color: Color(0xFFFC7171))),
      title: Text(
        "Logout",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFC7171)),
      ),
    );
  }
}

class Theme extends StatelessWidget {
  const Theme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.remove_red_eye_outlined,
            size: 24,
          )),
      title: Text(
        "Ligth theme",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: SwtichBtn(),
    );
  }
}

class info extends StatelessWidget {
  const info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.info_outline,
            size: 24,
          )),
      title: Text(
        "Help",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.notifications_none_rounded,
            size: 24,
          )),
      title: Text(
        "Notifications",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Profile_image_usernames extends StatelessWidget {
  const Profile_image_usernames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
          Text(
            "@username",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  const header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Account",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_outlined),
                iconSize: 24,
                color: const Color.fromARGB(255, 0, 0, 0)))
      ],
    );
  }
}

class Edit extends StatelessWidget {
  const Edit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.edit_outlined,
            size: 24,
          )),
      title: Text(
        "Edit Account",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
