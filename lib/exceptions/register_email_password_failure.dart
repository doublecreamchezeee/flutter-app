class RegisterEmailPasswordFailure {
  final String message;

  const RegisterEmailPasswordFailure([this.message = "An unknown error occured"]);

  factory RegisterEmailPasswordFailure.code(String code){
    switch(code){
      case 'weak-password': return const RegisterEmailPasswordFailure('Please enter a stronger password');
      case 'invalid-email': return const RegisterEmailPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use': return const RegisterEmailPasswordFailure('An account already exists for that');
      case 'operation-not-allowed': return const RegisterEmailPasswordFailure('This user has been disable. Please contact for help');
      case 'user-disabled': return const RegisterEmailPasswordFailure('');
      default: return const RegisterEmailPasswordFailure();
    }
  }
}