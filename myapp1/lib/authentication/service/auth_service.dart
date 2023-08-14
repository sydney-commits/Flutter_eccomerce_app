
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:myapp1/authentication/service/auth_user_model.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

 

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }

    return User(user.uid, user.email);
  }

  

  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  currentUser1() {
    return _firebaseAuth.currentUser;
  }

   currentUserId() async{
    return   _firebaseAuth.currentUser!.uid.toString();
  }

     currentUserMail() async{
    return   _firebaseAuth.currentUser!.email.toString();
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    return _userFromFirebase(credential.user);
  }

  //This method is used to create the user in firestore

  // Future createUser(String userId, String fname, String lname, String email,
  //     String phone) async {
  //   final docUser = FirebaseFirestore.instance.collection('myUsers').doc();
  //   userId = docUser.id;
  //   fname = 'Tony';
  //   lname = 'Tony';
  //   email = 'Tony@gmail.com';
  //   phone = 'Tony';


  // }

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

  
     //Create the user in firestore with the user data
   

    return _userFromFirebase(credential.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
