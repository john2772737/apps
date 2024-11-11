import 'package:bloc/bloc.dart';
import './../../database/databaseManger.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DatabaseHelper _databaseHelper;

  UserBloc(this._databaseHelper) : super(Initial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield* event.map(
      submit: (e) async* {
        try {
          final userId = await _databaseHelper.validateUser(e.email, e.password);
          if (userId!=null) {
            yield const Success();
            
          } else {
            yield const Error('Invalid email or password');
          }
        } catch (e) {
          yield Error('Login failed: ${e.toString()}');
        }
      },
      logout: (e) async* {
        // Handle logout logic here
        yield const Initial(); // You can yield a different state for logout
      },
    );
  }
}
