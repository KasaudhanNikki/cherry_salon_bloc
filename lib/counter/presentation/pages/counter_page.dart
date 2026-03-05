import 'package:bloc_setup/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_event.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Text(
              '$count',
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "increment",
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().add(Increment()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "decrement",
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().add(Decrement()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            heroTag: "theme_toggle",
            child: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          ),
        ],
      ),
    );
  }
}
