// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:mobx/mobx.dart';
// import 'package:up_clean/app/modules/core/authentication_enum/auth_status.dart';
// // import 'package:up_clean/app/modules/core/domain/entities/user.dart';
// import 'package:up_clean/app/modules/core/domain/usecases/get_auth.dart';
// import 'package:up_clean/app/modules/core/presentation/stores/authentication_store.dart';

// class MockGetAuth extends Mock implements GetAuth {}

// class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

// class MockFirebaseUser extends Mock implements User {}

// void main() {
//   late AuthenticationStore store;
//   late GetAuth usecase;
//   late FirebaseFirestore db;

//   setUp(() {
//     usecase = MockGetAuth();
//     db = MockFirebaseFirestore();
//     store = AuthenticationStore(usecase: usecase);
//   });

//   test('Deve iniciar a store com o status de loading', () {
//     expect(store.authStatus, AuthStatus.loading);
//   });

//   test('Deve setar o usuário corretamente', () {
//     final user = MockFirebaseUser();

//     when(usecase.getuser()).thenAnswer((_) => Future.value(user));

//     store.setUser(user);

//     expect(store.user, user);
//     expect(store.authStatus, AuthStatus.logged);
//   });

//   test('Deve setar o usuário como null e o status como logoff', () {
//     store.setUser(null);

//     expect(store.user, null);
//     expect(store.authStatus, AuthStatus.logoff);
//   });

//   test('Deve criar um usuário com sucesso e salvar no Firestore', () async {
//     final email = 'test@test.com';
//     final password = 'test123';
//     final uid = '1234abcd';
//     final expectedUser = MockFirebaseUser();

//     when(usecase.createUserWithEmailAndPasswrod(email: email, password: password))
//         .thenAnswer((_) => Future.value(expectedUser));

//     when(expectedUser.uid).thenReturn(uid);

//     await store.createUserWithEmailAndPassword(email: email, password: password);

//     verify(usecase.createUserWithEmailAndPasswrod(email: email, password: password)).called(1);

//     verify(db.collection('Users').doc(uid).set({'email': email, 'password': password})).called(1);
//   });
// }
