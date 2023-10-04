class SignUpWithEmailandPasswordFailure{
  final String message;

  const SignUpWithEmailandPasswordFailure([this.message="An unknown error occured."]);
  factory SignUpWithEmailandPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailandPasswordFailure('Password is weak');
      case 'invalid-email':
        return const SignUpWithEmailandPasswordFailure('Email format is not valid');
      case 'email-in-use':
        return const SignUpWithEmailandPasswordFailure('Email already in use');
      case 'user-disabled':
        return const SignUpWithEmailandPasswordFailure('This user has been disabled. Contact support');
      default: return SignUpWithEmailandPasswordFailure();
    }
  }
}