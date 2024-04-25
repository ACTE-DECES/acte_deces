import 'package:devoir/home_page.dart';
import 'package:devoir/DeathRegistrationPage.dart';
import 'package:flutter/material.dart';

// ignore_for_file: file_names


 import 'package:fluttertoast/fluttertoast.dart';





 void main() {
   runApp(const Enregistrement());
 }

 TextEditingController emailController = TextEditingController();
 TextEditingController emailController2 = TextEditingController();
 TextEditingController nomControle = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController passwordController2 = TextEditingController();
 TextEditingController passwordController3 = TextEditingController();
 bool passwordsMatch = false;
 bool nameMatch = false;
 bool emailMatch = false;
 bool emailMatch2 = false;
 bool passMatch = false;
 bool emailMatchConn = false;
 bool emailMatchConn2 = false;
 bool passMatchConne = false;

 class Enregistrement extends StatefulWidget {
  const Enregistrement({super.key});

   @override
   // ignore: library_private_types_in_public_api
   _EnregistrementState createState() => _EnregistrementState();
 }

 class _EnregistrementState extends State<Enregistrement> {
  
  

   @override
   Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 2, // Nombre d'onglets
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
          body: Center(
            child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // TabBar pour basculer entre les onglets
                  const TabBar(
                    tabs: [
                      Tab(text: "Inscription"),
                      Tab(text: "Connexion"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Contenu de l'onglet "Créer"
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // ViewPage avec deux parties: "Creer" et "Connection"
                            const Text("Créer un nouveau compte", style: TextStyle(fontSize: 20)),
                            const SizedBox(height: 20),
                            // Deux EditText en vertical pour l'adresse mail et le mot de passe
                            EditText("Nom d'utilisteur ", Icons.account_circle_outlined,nomControle),
                            if (nameMatch)
                              const Text("Ce chant ne doit pas etre vide", style: TextStyle(color: Colors.red),),
                            const SizedBox(height: 10)
                            ,EditText("Adresse Mail", Icons.email,emailController),
                            if (emailMatch)
                              const Text("Ce chant ne doit pas etre vide", style: TextStyle(color: Colors.red),),
                            if (emailMatch2)
                              const Text("Veuillez entrer une adresse email valide", style: TextStyle(color: Colors.red),),
                            const SizedBox(height: 10),
                            EditText("Mot de Passe", Icons.lock,passwordController),
                            if (passMatch)
                              const Text("Ce chant ne doit pas etre vide", style: TextStyle(color: Colors.red),),
                            const SizedBox(height: 10),

                            EditText("Confirmer mot de Passe", Icons.lock,passwordController2),
                            if (passwordsMatch)
                            const Text("Les mots de passe doivent être identiques", style: TextStyle(color: Colors.red),),
                            // Bouton "Valider"
                            const SizedBox(height: 20),

                            ElevatedButton(
                               
                              onPressed: () {
                                final String email = emailController.text.trim();
                                final String nom = nomControle.text.trim();
                                final String password = passwordController.text.trim();
                                final String password2 = passwordController2.text.trim();

                                if (nom.isEmpty) {
                                  setState(() {
                                    nameMatch = true;
                                  });

                                } else {
                                  setState(() {
                                    nameMatch = false;
                                  });

                                if (email.isEmpty) {
                                  setState(() {
                                    emailMatch = true;
                                  });
                                } else{
                                  setState(() {
                                    emailMatch = false;
                                  });

                                if (!isValidEmail(email)) {
                                  setState(() {
                                    emailMatch2 = true;
                                  });
                                } else {
                                  setState(() {
                                    emailMatch2 = false;
                                  });


                                  if (password.isEmpty) {
                                  setState(() {
                                    passMatch = true;
                                  });
                                } else{
                                    setState(() {
                                      passMatch = false;
                                    });


                                if(password2!=password) {
                                  setState(() {
                                    passwordsMatch = true;
                                  });
                                }else {
                                  setState(() {
                                    passwordsMatch = false;
                                  });
                                  // Le formulaire est valide, vous pouvez effectuer d'autres actions ici
                                  showToast("Formulaire valide, effectuez des actions supplémentaires si nécessaire");
                                
                                   Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
                                  creation(context, email, nom , password);

                                  }
                                  }}}}

                              

                              },

                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Couleur du texte du bouton
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0), // Bordure arrondie du bouton
                                ),
                                minimumSize: const Size(200, 50), // Taille minimale du bouton
                              ),


                              child: const Text(
                                "Valider",
                                style: TextStyle(fontSize: 18), // Taille du texte du bouton
                              ),

                            ),
                          ],
                        ),

                        // Contenu de l'onglet "Connexion"
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            // ViewPage avec deux parties: "Creer" et "Connection"
                            const Text("Se connecter", style: TextStyle(fontSize: 20)),
                            const SizedBox(height: 20),

                            // Deux EditText en vertical pour l'adresse mail et le mot de passe
                            EditText("Adresse Mail", Icons.email,emailController2),
                            if (emailMatchConn)
                              const Text("Ce chant ne doit pas etre vide", style: TextStyle(color: Colors.red),),
                            if (emailMatchConn2)
                              const Text("Veuillez entrer une adresse email valide", style: TextStyle(color: Colors.red),),
                            const SizedBox(height: 10),
                            EditText("Mot de Passe", Icons.lock,passwordController3),
                            // Bouton "Valider"
                            const SizedBox(height: 20),

                            ElevatedButton(

                                onPressed: () {

                                  final String email = emailController2.text.trim();
                                  final String password = passwordController3.text.trim();


                                if (email.isEmpty) {
                                  setState(() {
                                    emailMatchConn = true;
                                  });

                                } else {
                                  setState(() => emailMatchConn = false);

                                  if (!isValidEmail(email)) {
                                    setState(() => emailMatchConn2 = true);
                                  } else{
                                    setState(() => emailMatchConn2 = false);


                                  if(password.isEmpty) {
                                    setState(() => passMatchConne = true);
                                  }else {
                                    setState(() => passMatchConne = false);

                                    // Le formulaire est valide, vous pouvez effectuer d'autres actions ici
                                    showToast("Formulaire valide, effectuez des actions supplémentaires si nécessaire");}
                                       valide(email, password);
                                      
                                  }
                                  }
                                  },



                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.green, // Couleur du texte du bouton
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0), // Bordure arrondie du bouton
                                ),
                                minimumSize: const Size(200, 50), // Taille minimale du bouton
                              ),
                              child: const Text(
                                "Valider",
                                style: TextStyle(fontSize: 18), // Taille du texte du bouton
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void valide(String email, String password) {
   
   
}








   showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  bool isValidEmail(String email) {
    // Utilisez une expression régulière pour valider le format de l'adresse email
    // Ceci est une validation simple et ne garantit pas l'existence de l'adresse email.
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }




void creation(BuildContext context, String email, String name, String password) async {
 

}


// Fonction pour mettre à jour les informations de l'utilisateur
void updateUserInfo(String name, String email, BuildContext context, ProgressDialog progressDialog) {
  // Mettre à jour les informations de l'utilisateur ici (si nécessaire)
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Compte créé avec succès pour $name ($email)'),

    ),
  );

  
  // Obtenir le timestamp actuel
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  
 
  


  // Référence à la base de données
  // ignore: deprecated_member_use
  
}




class ProgressDialog {
  final BuildContext context;
  ProgressDialog(this.context);

 void setMessage(String message) {
  // Affichage du message de progression
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200), // Définir une taille maximale
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(),
              const SizedBox(height: 10.0),
              Text(message),
            ],
          ),
        ),
      );
    },
  );
}

  void dismiss() {
    // Dismiss du dialog
    Navigator.of(context).pop();
  }

}




 class EditText extends StatelessWidget {
   final String hintText;
   final IconData? icon;
   final TextEditingController controller;

   const EditText(this.hintText, this.icon, this.controller, {super.key});

   @override
   Widget build(BuildContext context) {
     return SizedBox(
       width: 250, // Largeur de l'EditText
       child: TextFormField(
         controller: controller,
         decoration: InputDecoration(
           hintText: hintText,
           prefixIcon: icon != null ? Icon(icon) : null, // Ajout de l'icône
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10), // Bordure arrondie pour l'EditText
           ),
           contentPadding: const EdgeInsets.all(10),
         ),
       ),
     );
   }
 }



 