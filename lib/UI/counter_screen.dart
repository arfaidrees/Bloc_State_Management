import 'package:bloc_counter_app/bloc/counter/counter_event.dart';
import 'package:bloc_counter_app/bloc/counter/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter/counter_bloc.dart';

class counterclass extends StatefulWidget {
  const counterclass({super.key});

  @override
  State<counterclass> createState() => _counterclassState();
}

class _counterclassState extends State<counterclass> {
  @override
  Widget build(BuildContext context) {
    print('Entire Scaffold is build');
    return Scaffold(
      appBar: AppBar(
       title: const Text('Counter Example'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context,state){
              print('Only this widget is build');
              return Center(child: Text(state.counter.toString(), style: TextStyle(fontSize: 70),));
            }
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(IncrementCounter());
            }, child: const Text('Increment')),
            const SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              context.read<CounterBloc>().add(DecrementCounter());
            }, child: const Text('Decrement')),
          ],
          ),
      ]
    ),
    );
  }
}
