import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit/src/cubit/timer_cubit.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TimerCub(waitting: 10),
        child: BlocBuilder<TimerCub, TimerState>(
          builder: (BuildContext context, state) {
            return const _TimerPage();
          },
        ));
  }
}

class _TimerPage extends StatelessWidget {
  const _TimerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerCub, TimerState>(
        listener: (context, state) {},
        child: BlocBuilder<TimerCub, TimerState>(
          builder: (BuildContext context, state) {
            //final cubit = TimerCub.get(context);
            final cubit = context.read<TimerCub>();
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
                            //backgroundColor: Colors.blue.shade700,
                            onPressed: () {
                              cubit.isRun
                                  ? cubit.pauseaction()
                                  : cubit.startaction();
                            },
                            child: IconButton(
                              icon: cubit.isRun
                                  ? const Icon(Icons.pause)
                                  : const Icon(Icons.play_arrow),
                              onPressed: () {
                                //context.read<TimerCub>().startaction();
                                //cubit.startaction();

                                cubit.isRun
                                    ? cubit.pauseaction()
                                    : cubit.startaction();
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
                                  value:
                                      cubit.isRun ? null : cubit.curVal * 1.0,
                                  color: !cubit.isRun ? Colors.white : null,
                                  //backgroundColor: Colors.red[800],
                                  strokeWidth: 4,
                                ),
                                Text(
                                  "${(cubit.waitInSec * 10) - (cubit.curVal * 10)} %",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                          const Padding(padding: EdgeInsets.all(10)),
                          FloatingActionButton(
                            backgroundColor: Colors.green.shade400,
                            onPressed: () {
                              cubit.restartaction();
                              //context.read<TimerCub>().add(const RestartTimer());
                              cubit.restartaction();
                            },
                            child: IconButton(
                              icon: const Icon(Icons.restart_alt_rounded),
                              onPressed: () {
                                //context.read<TimerBloc>().add(const RestartTimer());
                                cubit.restartaction();
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
