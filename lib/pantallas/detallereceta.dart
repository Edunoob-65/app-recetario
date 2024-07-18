import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recetariopersonal/modelos/receta.dart';
import 'package:recetariopersonal/pantallas/editarReceta.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Receta receta;

  RecipeDetailScreen({required this.receta});

  get usuarioId => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receta.titulo),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditRecipeScreen(
                            usuarioId: usuarioId, receta: receta)));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (receta.rutaImagen.isNotEmpty)
              Image.file(
                File(receta.rutaImagen),
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16.0),
            Text(
              'Ingredientes:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(receta.ingredientes),
            SizedBox(height: 16.0),
            Text(
              'Pasos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(receta.pasos),
            SizedBox(height: 16.0),
            Text(
              'Categoría:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(receta.categoria),
          ],
        ),
      ),
    );
  }
}
