import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:UShealthcare/apps/view/cart/counter_bloc/counter_bloc.dart';
import 'package:UShealthcare/apps/view/cart/counter_bloc/counter_event.dart';
import 'package:UShealthcare/style/AppColor.dart';
import '../counter_bloc/counter_state.dart';

class ProductCounter extends StatelessWidget {
  final bool MoveToCart ;

  ProductCounter({Key? key, this.MoveToCart=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter=1;
    return BlocProvider<CounterBloc>(
      create: (_) => CounterBloc( CounterState(s1: 1)),
      child: BlocBuilder<CounterBloc, CounterState>(

          builder: (context, state) {

            print(state);
            print("csssssssssssssssssssssssssssssssssss");
            print(state.s1);
            return
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(Decrement());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),),
                          border: Border.all(
                              color: AppColor.appDivider, width: 2),
                        ),
                        child: Icon(Icons.remove),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(state.s1.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "AppMedium",
                      ),
                    ),
                    SizedBox(width: 5,),

                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(Increment());
                        print(counter);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),),
                          border: Border.all(
                              color: AppColor.appBgGray, width: 2),
                        ),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              );
          }),
      );
}
  }

