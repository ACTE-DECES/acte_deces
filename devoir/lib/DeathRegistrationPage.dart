import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:open_file/open_file.dart';

class DeathRegistrationPage extends StatefulWidget {
  const DeathRegistrationPage({Key? key}) : super(key: key);

  @override
  _DeathRegistrationPageState createState() => _DeathRegistrationPageState();
}

class _DeathRegistrationPageState extends State<DeathRegistrationPage> {
  late DateTime date;

  TextEditingController nom_deces = TextEditingController();
  TextEditingController prenom_deces = TextEditingController();
  TextEditingController lieu = TextEditingController();
  TextEditingController nee_le = TextEditingController();
  TextEditingController sexe = TextEditingController();
  TextEditingController situation_matri = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController domicile = TextEditingController();
  TextEditingController fils_de = TextEditingController();
  TextEditingController dresser_le = TextEditingController();

  Future<void> generatePDF() async {
    final pdfLib.Document pdf = pdfLib.Document();

    pdf.addPage(
      pdfLib.Page(
        build: (pdfLib.Context context) {
          return pdfLib.Column(
            crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
            children: <pdfLib.Widget>[
              pdfLib.Text('Nom: ${nom_deces.text}'),
              pdfLib.Text('Prénom: ${prenom_deces.text}'),
              pdfLib.Text('Date de décès: ${date.toString()}'),
              pdfLib.Text('Lieu de décès: ${lieu.text}'),
              pdfLib.Text('Né le: ${nee_le.text}'),
              pdfLib.Text('Sexe: ${sexe.text}'),
              pdfLib.Text('Situation matrimoniale: ${situation_matri.text}'),
              pdfLib.Text('Profession: ${profession.text}'),
              pdfLib.Text('Domicile: ${domicile.text}'),
              pdfLib.Text('Fils de: ${fils_de.text}'),
              pdfLib.Text('Dressé le: ${dresser_le.text}'),
            ],
          );
        },
      ),
    );

    final String dir = (await getExternalStorageDirectory())!.path;
    final String path = '$dir/decès.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());
    OpenFile.open(path);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> textFields = [
      EditText("Nom d'utilisateur", nom_deces),
      EditText("Prénom d'utilisateur", prenom_deces),
      EditText("Lieu de décès", lieu),
      EditText("Né le", nee_le),
      EditText("Sexe", sexe),
      EditText("Situation matrimoniale", situation_matri),
      EditText("Profession", profession),
      EditText("Domicile", domicile),
      EditText("Fils de", fils_de),
      EditText("Dressé le", dresser_le),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrement du décès'),
      leading: const ImageIcon(
  AssetImage('image/hank.png'),
  size: 24,
  
),


        actions: [
          IconButton(
            icon: const Icon(Icons.ice_skating_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: textFields.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: textFields[index],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: generatePDF,
              child: const Text('Générer le PDF'),
            ),
          ],
        ),
      ),
    );
  }
}



 class EditText extends StatelessWidget {
   final String hintText;
  
   final TextEditingController controller;

   const EditText(this.hintText,  this.controller, {super.key});

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width: 250, // Largeur de l'EditText
       child: TextFormField(
         controller: controller,
         decoration: InputDecoration(
           hintText: hintText,
           // Ajout de l'icône
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10), // Bordure arrondie pour l'EditText
           ),
           contentPadding: const EdgeInsets.all(10),
         ),
       ),
     );
   }
 }





