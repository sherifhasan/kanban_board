import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kanban_board/application/features/history/completed_tasks_cubit.dart';
import 'package:kanban_board/domain/models/task.dart';
import 'package:kanban_board/presentation/history/completed_tasks_screen.dart';

class MockCompletedTasksCubit extends MockCubit<CompletedTasksState>
    implements CompletedTasksCubit {}

class FakeCompletedTasksState extends Fake implements CompletedTasksState {}

void main() {
  late MockCompletedTasksCubit mockCompletedTasksCubit;

  setUpAll(() {
    registerFallbackValue(FakeCompletedTasksState());
  });

  setUp(() {
    mockCompletedTasksCubit = MockCompletedTasksCubit();
  });

  Widget createTestMaterialAppWidget() {
    return MaterialApp(
      home: BlocProvider<CompletedTasksCubit>(
        create: (_) => mockCompletedTasksCubit,
        child: const CompletedTasksScreen(),
      ),
    );
  }

  testWidgets('displays loading indicator when state is loading',
      (tester) async {
    when(() => mockCompletedTasksCubit.state)
        .thenReturn(const CompletedTasksState.loading());

    await tester.pumpWidget(createTestMaterialAppWidget());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('displays no completed tasks message when state is initial',
      (tester) async {
    when(() => mockCompletedTasksCubit.state)
        .thenReturn(const CompletedTasksState.initial());

    await tester.pumpWidget(createTestMaterialAppWidget());

    expect(find.text('No completed tasks'), findsOneWidget);
  });

  testWidgets('displays error message when state is error', (tester) async {
    when(() => mockCompletedTasksCubit.state)
        .thenReturn(const CompletedTasksState.error('Error loading tasks'));

    await tester.pumpWidget(createTestMaterialAppWidget());

    expect(find.text('Error loading tasks'), findsOneWidget);
  });

  testWidgets('displays list of completed tasks when state is loaded',
      (tester) async {
    final tasks = [
      Task(
          id: '1',
          content: 'Task 1',
          createdAt: DateTime.now(),
          timeSpent: 120),
      Task(
          id: '2', content: 'Task 2', createdAt: DateTime.now(), timeSpent: 90),
    ];

    when(() => mockCompletedTasksCubit.state)
        .thenReturn(CompletedTasksState.loaded(tasks));

    await tester.pumpWidget(createTestMaterialAppWidget());

    expect(find.byType(ListTile), findsNWidgets(2));
    expect(find.text('Task 1'), findsOneWidget);
    expect(find.text('Task 2'), findsOneWidget);
    expect(find.text('Completed at: 120.00 min'), findsOneWidget);
    expect(find.text('Completed at: 90.00 min'), findsOneWidget);
  });
}
