import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_lab/bolc/bloc/timer_bloc.dart';

class Timerpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(waitting: 10),
      child: Timerwidget(),
    );
  }
}

class Timerwidget extends StatelessWidget {
  const Timerwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(listener: (context, state) {
      if (state is StopTimerState) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Finished")));
      }
    }, child: BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Timer lab"),
              backgroundColor: Colors.pink.shade400,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      FloatingActionButton(
                        backgroundColor: Colors.blue.shade700,
                        onPressed: () {
                          state.isRunning
                              ? context.read<TimerBloc>().add(PauseTimer())
                              : context.read<TimerBloc>().add(StartTimer());
                        },
                        child: IconButton(
                          icon: state.isRunning
                              ? const Icon(Icons.pause)
                              : const Icon(Icons.play_arrow),
                          onPressed: () {
                            state.isRunning
                                ? context.read<TimerBloc>().add(PauseTimer())
                                : context.read<TimerBloc>().add(StartTimer());
                          },
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Container(
                          height:
                              150, //MediaQuery.of(context).size.height * 0.1,
                          width:
                              150, //MediaQuery.of(context).size.height * 0.1,
                          margin: const EdgeInsets.all(0),
                          child: Column(children: [
                            CircularProgressIndicator(
                              value: state.isRunning ? null : state.curVal,
                              color: !state.isRunning ? Colors.white : null,
                              //backgroundColor: Colors.red[800],
                              strokeWidth: 4,
                            ),
                            Text(
                              "${state.curVal} %",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ])),
                      const Padding(padding: EdgeInsets.all(10)),
                      FloatingActionButton(
                        backgroundColor: Colors.green.shade400,
                        onPressed: () {
                          context.read<TimerBloc>().add(RestartTimer());
                        },
                        child: IconButton(
                          icon: const Icon(Icons.restart_alt_rounded),
                          onPressed: () {
                            context.read<TimerBloc>().add(RestartTimer());
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    ));
  }
}
