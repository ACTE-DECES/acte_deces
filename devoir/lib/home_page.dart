import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "yvan";
  String email = "dylane@gmailk";
 
  Stream? groups;
  bool _isLoading = false;
 

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  // Fonction pour extraire l'ID à partir d'une chaîne
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  // Fonction pour extraire le nom à partir d'une chaîne
  String getName(String res) {
    return res.substring(res.indexOf("_") + 1);
  }

  gettingUserData() async {
    // Mettre ici la logique pour récupérer les données utilisateur
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        actions: [
          
          IconButton(
            onPressed: () {
              // Mettre ici l'action à effectuer lors du clic sur l'icône de recherche
            },
            icon: const Icon(
              Icons.search,
            )
          )
        ],
        elevation: 0,
        centerTitle: true,
        
        title: const Text(
          "Acceuil administrateur",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27),
        ),
      ),
      drawer: Drawer(
       
        child: ListView(
          
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
           
           
            Icon(
              
              Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              
              userName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold , color: Colors.green),
            ),
            
            const SizedBox(
              height: 30,
            ),
            
            const Divider(
              thickness: 4,
              color: Colors.green,
              height: 2,
            ),
            ListTile(
              selectedTileColor: Color.fromARGB(255, 150, 255, 197),
              onTap: () {
                DeathRegistrationPage()
              },
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.document_scanner),
              title: const Text(
                "Créer un acte de décès",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () {
                // Mettre ici l'action à effectuer lors du clic sur le profil
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.search),
              title: const Text(
                "Rechercher un acte de décès",
                style: TextStyle(color: Colors.black),
              ),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Deconnection"),
                      content: const Text("Are you sure you want to logout?"),
                      actions: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            // Mettre ici l'action à effectuer lors de la déconnexion
                          },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                  }
                );
              },
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        )
      ),
      body: groupList(),
     
    );
  }



  groupList() {
   
}
 
}
