import 'package:flutter/material.dart';
import 'package:flutter_adocaopets/models/Pet_Categorie_model.dart';

class CardCategoriePet extends StatefulWidget {
  final PetCategorieModel categorie;
  final bool isSelected;
  final VoidCallback onTap;

  const CardCategoriePet({
    super.key,
    required this.categorie,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CardCategoriePet> createState() => _CardCategoriePetState();
}

class _CardCategoriePetState extends State<CardCategoriePet> {
  @override
  Widget build(BuildContext context) {
    Color containerColor =
        widget.isSelected ? Color(0xFF5250E1) : Color(0xFFEBF0F0);
    Color iconTextColor = widget.isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 114,
        height: 109,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26.0),
          color: containerColor,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: IconButton(
                onPressed: () {}, // Omitido, apenas para exibição
                icon: Image.asset(
                  widget.categorie.Icon,
                  width: 26,
                  height: 26,
                  color: iconTextColor,
                ),
              ),
            ),
            Text(
              widget.categorie.nomeCategorie,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: iconTextColor),
            ),
          ],
        ),
      ),
    );
  }
}