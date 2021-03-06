import 'package:cuidapet_supplier_mobile/app/modules/register/data/datasources/register_user_datasource_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/domain/repositories/register_user_repository.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/domain/usecases/check_supplier_email_exists_usecase_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/infra/datasources/register_user_datasource.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/infra/repositories/register_user_repository_impl.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/controller/register_controller.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/presenter/usecases/check_supplier_email_exists_usecase.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/register_page.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/one/controller/register_step_one_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {

   @override
   final List<Bind> binds = [
     Bind.lazySingleton((i) => RegisterController()),
     Bind.lazySingleton<RegisterUserDataSource>((i) => RegisterUserDataSourceImpl(
       logger: i(),
       restClient: i(),
     )),
     Bind.lazySingleton<RegisterUserRepository>((i) => RegisterUserRepositoryImpl(
       logger: i(),
       registerUserDataSource: i(),
     )),
     Bind.lazySingleton<CheckSupplierEmailExistsUsecase>((i) => CheckSupplierEmailExistsUsecaseImpl(
       registerUserRepository: i(),
     )),
     Bind.factory((i) => RegisterStepOneController(
       checkEmailExists: i(),
       registerController: i(),
     )),
   ];

   @override
   final List<ModularRoute> routes = [
     ChildRoute(
       Modular.initialRoute, 
       child: (_, args) => RegisterPage(
         controller: Modular.get(),
         registerStepOneController: Modular.get(),
       )
      )
   ];

}