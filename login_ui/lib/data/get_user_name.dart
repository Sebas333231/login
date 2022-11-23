import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  
  const GetUserName({required this.documentId});
  

  @override
  Widget build(BuildContext context) {
    //lee la coleccion
    CollectionReference users = FirebaseFirestore.instance.collection('cuentas');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot){
        if (snapshot.connectionState == ConnectionState.done){
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('Nombre Usuario: ${data['first name']} ${data['last name']}, ${data['user profile']}');
        }
        return const Text('cargando..');
      })
    );
  }
}
