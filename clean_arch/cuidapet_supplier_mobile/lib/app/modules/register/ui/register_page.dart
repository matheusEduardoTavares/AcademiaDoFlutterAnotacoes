import 'package:cuidapet_supplier_mobile/app/core/extensions/screen_size_extensions.dart';
import 'package:cuidapet_supplier_mobile/app/core/extensions/theme_extensions.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/one/register_step_one_page.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/three/register_step_three_page.dart';
import 'package:cuidapet_supplier_mobile/app/modules/register/ui/steps/two/register_step_two_page.dart';
import 'package:flutter/material.dart';
import 'package:steps_indicator/steps_indicator.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 1.sw,
              height: .95.sh,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login_background.png',
                  ),
                  fit: BoxFit.fill
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1.statusBarHeight + 30,
                left: 10,
                right: 10,
              ),
              width: double.infinity,
              child: Form(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150.w,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(height: 15,),
                    StepsIndicator(
                      selectedStep: 0,
                      lineLength: 120.w,
                      doneStepColor: context.primaryColorDark,
                      doneLineColor: context.primaryColorDark,
                      undoneLineColor: context.primaryColorDark,
                      selectedStepColorIn: context.primaryColor,
                      selectedStepColorOut: context.primaryColorDark,
                      unselectedStepColorIn: Colors.white,
                      unselectedStepColorOut: context.primaryColorDark,
                      selectedStepSize: 20,
                      unselectedStepSize: 15,
                      doneStepSize: 20,
                      nbSteps: 3,
                    ),
                    const SizedBox(height: 10,),
                    _showStep(3),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showStep(int step) {
    switch(step) {
      case 1:
        return const RegisterStepOnePage();
      case 2:
        return const RegisterStepTwoPage();
      case 3:
        return const RegisterStepThreePage();
      default: 
        return const Center(child: Text('Passo não encontrado'),);
    }
  }
}