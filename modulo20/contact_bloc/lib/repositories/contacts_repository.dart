import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  static const _url = 'http://10.0.2.2:3031/contacts';

  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get(
      _url
    );

    return response.data?.map<ContactModel>
      ((contact) => ContactModel.fromMap(contact)).toList();
  }

  Future<void> create(ContactModel model) => 
    Dio().post(
      _url,
      data: model.toMap(),
    );

  Future<void> update(ContactModel model) => 
    Dio().put(
      '$_url/${model.id}',
      data: model.toMap(),
    );

  Future<void> delete(ContactModel model) => 
    Dio().delete(
      '$_url/${model.id}',
    );
}