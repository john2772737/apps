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
        final userId =
            await _databaseHelper.validateUser(event.email, event.password);
        if (userId != null) {
          emit(Success(userId)); // Emit Success state on valid login
        } else {
          emit(Error(
              'Invalid email or password')); // Emit Error state for invalid credentials
        }
      } catch (e) {
        emit(Error(
            'Login failed: ${e.toString()}')); // Emit Error state if an exception occurs
      }
    });

    on<FetchUser>((event, emit) async {
      try {
        final userId = await _databaseHelper.getUserById(event.userId);
        if (userId!= null) {
          emit(UserFetched(userId)); // Emit UserFetched state with user details
        } else {
          emit(Error(
              'User not found')); // Emit Error state if user not found
        }
      } catch (e) {
        emit(Error(
            'Failed to fetch user: ${e.toString()}')); // Emit Error state if an exception occurs
      }
    });

    // Event handler for the Logout event
    on<Logout>((event, emit) {
      emit(Initial()); // Reset state to Initial on logout
    });
  }
}
