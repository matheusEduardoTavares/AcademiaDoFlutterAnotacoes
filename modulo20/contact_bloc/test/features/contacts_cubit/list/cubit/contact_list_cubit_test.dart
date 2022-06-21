import 'package:bloc_test/bloc_test.dart';
import 'package:contact_bloc/features/contacts_cubit/list/cubit/contact_list_cubit.dart';
import 'package:contact_bloc/models/contact_model.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepository extends Mock implements ContactsRepository {}

void main() {
  // declaração
  late ContactsRepository repository;
  late ContactListCubit bloc;
  late List<ContactModel> contacts;
  final mockContact = ContactModel(
    id: '1',
    name: 'Rodrigo Rahman', 
    email: 'rodrigorahman@academiadoflutter.com.br'
  );

  // preparação
  setUp(() {
    repository = MockContactsRepository();
    bloc = ContactListCubit(
      repository: repository,
    );
    contacts = [
      mockContact,
      ContactModel(
        id: '2',
        name: 'Rodrigo Rahman Pessoal', 
        email: 'rodrigorahman@gmail.com'
      ),
    ];
  });

  // execução
  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve buscar os contatos',
    build: () => bloc,
    act: (bloc) => bloc.findAll(),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
    setUp: () {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
  );

  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve dar erro ao buscar os contatos',
    build: () => bloc,
    act: (bloc) => bloc.findAll(),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.error(error: 'Erro ao buscar contatos'),
    ],
  );

  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve deletar um contato corretamente',
    build: () => bloc,
    act: (bloc) => bloc.deleteByModel(mockContact),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
    verify: (cubit) {
      expect(cubit.state.maybeWhen(
        orElse: () => false,
        data: (contacts) => true,
      ), true);
      expect(cubit.state.maybeWhen(
        orElse: () => <ContactModel>[],
        data: (contacts) => contacts,
      ), hasLength(1));
    },
    setUp: () {
      when(() => repository.delete(mockContact)).thenAnswer((_) async {});
      when(() => repository.findAll()).thenAnswer((_) async => contacts..removeWhere((element) => element == mockContact));
    }
  );

  blocTest<ContactListCubit, ContactListCubitState>(
    'Deve dar erro ao deletar um contato',
    build: () => bloc,
    act: (bloc) => bloc.deleteByModel(mockContact),
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.error(error: 'Erro ao buscar contatos'),
    ],
    verify: (cubit) {
      expect(cubit.state.maybeWhen(
        orElse: () => false,
        error: (message) => true,
      ), true);
    },
    setUp: () {
      when(() => repository.delete(mockContact)).thenAnswer((_) async {});
    }
  );
}