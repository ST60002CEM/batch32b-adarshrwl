import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:snapdwell/core/failure/failure.dart';
import 'package:snapdwell/features/auth/domain/entity/auth_entity.dart';
import 'package:snapdwell/features/auth/domain/usecases/auth_usecase.dart';
import 'package:snapdwell/features/auth/presentation/navigator/login_navigator.dart';
import 'package:snapdwell/features/auth/presentation/viewmodel/auth_view_model.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<LoginViewNavigator>(),
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthUsecase;
  late ProviderContainer container;
  late LoginViewNavigator mockLoginViewNavigator;

  setUp(
    () {
      mockAuthUsecase = MockAuthUseCase();
      mockLoginViewNavigator = MockLoginViewNavigator();
      container = ProviderContainer(
        overrides: [
          authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockLoginViewNavigator, mockAuthUsecase),
          )
        ],
      );
    },
  );

  test('check for the inital state in Auth state', () {
    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
    expect(authState.error, isNull);
  });

  // Login test
  test('login test with valid username and password', () async {
    // Arrange
    when(mockAuthUsecase.loginUser('kiran', 'kiran123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    when(mockAuthUsecase.loginUser('kiran', 'kiran1234'))
        .thenAnswer((_) => Future.value(
              Left(
                Failure(error: 'Invalid Credentails'),
              ),
            ));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('kiran', 'kiran123');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('login test with valid username and password', () async {
    // Arrange
    const correctUsername = 'kiran';
    const correctPassword = 'kiran123';

    when(mockAuthUsecase.loginUser(any, any)).thenAnswer((invocation) {
      final username = invocation.positionalArguments[0] as String;
      final password = invocation.positionalArguments[1] as String;
      return Future.value(
          username == correctUsername && password == correctPassword
              ? const Right(true)
              : Left(Failure(error: 'Invalid')));
    });

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('kiran', 'kiran123');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('login test with invalid username and password', () async {
    // Arrange
    when(mockAuthUsecase.loginUser('kiran', 'wrongpassword')).thenAnswer(
        (_) => Future.value(Left(Failure(error: 'Invalid Credentials'))));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('kiran', 'wrongpassword');

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, 'Invalid Credentials');
  });

  test('Register User', () async {
    // Arrange
    const user = AuthEntity(
      email: 'test@example.com',
      username: 'testuser',
      firstname: 'Test',
      lastname: 'User',
      password: 'password123',
      accountType: 'standard',
    );

    when(mockAuthUsecase.registerUser(user))
        .thenAnswer((_) => Future.value(const Right(true)));

    // Act
    await container.read(authViewModelProvider.notifier).registerUser(user);

    final authState = container.read(authViewModelProvider);

    // Assert
    expect(authState.error, isNull);
  });

  test('login navigates to home view on success', () async {
    // Arrange
    when(mockAuthUsecase.loginUser('kiran', 'kiran123'))
        .thenAnswer((_) => Future.value(const Right(true)));

    // Act
    await container
        .read(authViewModelProvider.notifier)
        .loginUser('kiran', 'kiran123');

    // Assert
    verify(mockLoginViewNavigator.openHomeView()).called(1);
  });

  tearDown(
    () {
      container.dispose();
    },
  );
}
