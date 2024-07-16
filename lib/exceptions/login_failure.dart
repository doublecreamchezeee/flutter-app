class LoginFailure {
  final String message;

  const LoginFailure([this.message = "An unknown error occured"]);

  factory LoginFailure.code(String code){
    switch(code){
      case '': return const LoginFailure();
      default: return const LoginFailure();
    }
  }
}