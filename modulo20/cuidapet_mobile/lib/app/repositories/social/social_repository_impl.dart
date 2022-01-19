import 'package:cuidapet_mobile/app/core/exceptions/failure.dart';
import 'package:cuidapet_mobile/app/models/social_network_model.dart';
import 'package:cuidapet_mobile/app/repositories/social/social_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialRepositoryImpl implements SocialRepository {
  @override
  Future<SocialNetworkModel> googleLogin() async {
    final googleSignIn = GoogleSignIn();

    ///Importante para logar com contas diferentes
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null && googleUser != null) {
      return SocialNetworkModel(
        id: googleAuth.idToken ?? '', 
        name: googleUser.displayName ?? '', 
        email: googleUser.email, 
        type: 'Google', 
        avatar: googleUser.photoUrl,
        accessToken: googleAuth.accessToken ?? ''
      );
    } else {
      throw Failure(message: 'Erro ao realizar Login Google');
    }
  }
  
}