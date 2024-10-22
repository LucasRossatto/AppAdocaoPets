import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_Categorie_model.dart';

class CardCategoriePet extends StatefulWidget {
  final PetCategorieModel categorie;
  const CardCategoriePet({super.key, required this.categorie});

  @override
  State<CardCategoriePet> createState() => _CardCategoriePetState();
}
  Color _disableContainer = Color(0xFFEBF0F0);
  Color _disableIconText = Colors.black;

class _CardCategoriePetState extends State<CardCategoriePet> {
  void changeColor(){
    setState((){
      _disableContainer = _disableContainer == Color(0xFF5250E1) ? Color(0xFFEBF0F0) : Color(0xFF5250E1);
      _disableIconText = _disableIconText == Colors.white ? Colors.black : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeColor,
      child: Container(
        width: 114,
        height: 109,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: _disableContainer,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  widget.categorie.Icon,
                  width: 26,
                  height: 26,
                  color: _disableIconText
                ),
              ),
            ),
            Text(
              widget.categorie.nomeCategorie,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _disableIconText),
            ),
          ],
        ),
      ),
    );
  }
}