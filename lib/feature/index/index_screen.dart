import 'dart:async';

import 'package:flutter/material.dart';
import 'package:surf_mad_teacher_training/feature/index/colored_text_box.dart';
import 'package:surf_mad_teacher_training/feature/task_description/task_description_screen.dart';
import 'package:surf_mad_teacher_training/uikit/tasks_difficulty_widget.dart';

/// {@template index_screen.class}
/// ЛР1: Концепция приложения и вёрстка виджетов.
/// {@endtemplate}
class IndexScreen extends StatelessWidget {
  /// {@macro index_screen.class}
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Лабораторная работа 1')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Text('ЛР1: Концепция приложения и вёрстка виджетов', style: TextStyle(fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),
            Text(
              'Познакомимся с приложением, концепцией виджетов, в практической части будет необходимо выполнить одно из заданий.',
            ),
            const SizedBox(height: 12),
            ColoredTextBox(text: 'Flutter', color: Colors.orange),
            const SizedBox(height: 12),
            Text('Выберите задание по уровню сложности.'),
            const SizedBox(height: 12),

            TasksDifficultyWidget(),

            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                unawaited(
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => TaskDescriptionScreen(
                            title: 'Задание 1',
                            description:
                                'Сверстать виджет нижней панели навигации. Отобразить виджет на экране.\nПри необходимости, запросите доступ к макетам Figma у преподавателя.',
                          ),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.green),
              child: Text('Задание 1'),
            ),

            FilledButton(
              onPressed: () {
                unawaited(
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => TaskDescriptionScreen(
                            title: 'Задание 2',
                            description:
                                'Сверстать виджет текстового поля поиска. Отобразить виджет на экране.\nПри необходимости, запросите доступ к макетам Figma у преподавателя.',
                          ),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.yellow),
              child: Text('Задание 2'),
            ),

            FilledButton(
              onPressed: () {
                unawaited(
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => TaskDescriptionScreen(
                            title: 'Задание 3',
                            description:
                                'Сверстать виджет карточки интересного места. Отобразить виджет на экране.\nПри необходимости, запросите доступ к макетам Figma у преподавателя.',
                          ),
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.red),
              child: Text('Задание 3'),
            ),
          ],
        ),
      ),
    );
  }
}
