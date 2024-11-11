import 'package:bloc/bloc.dart';
import './../../database/databaseManger.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DatabaseHelper _databaseHelper;

  // Constructor
  UserBloc(this._databaseHelper) : super(Initial()) {
    // Event handler for the Submit event
    on<Submit>((event, emit) async {
      try {
        // Validate user credentials
        final userId = await _databaseHelper.validateUser(event.email, event.password);
        if (userId != null) {
          emit(Success(userId)); // Emit Success state on valid login
        } else {
          emit(Error('Invalid email or password')); // Emit Error state for invalid credentials
        }
      } catch (e) {
        emit(Error('Login failed: ${e.toString()}')); // Emit Error state if an exception occurs
      }
    });

    // Event handler for the Logout event
    on<Logout>((event, emit) {
      emit(Initial()); // Reset state to Initial on logout
    });
  }
}
