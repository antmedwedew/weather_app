import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/forecast_card_view.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<Weather> snapshot;

  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '7-day weather forecast',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 15),
          child: ListView.separated(
            itemBuilder: (context, index) {
              final bool isFirst = index == 0;
              final bool isLast = index == snapshot.data!.list.length - 1;

              return Padding(
                padding: EdgeInsets.only(
                  left: isFirst ? 16 : 0,
                  right: isLast ? 16 : 0,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  color: Colors.blue,
                  child: ForecastCardView(snapshot: snapshot, index: index),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: snapshot.data!.list.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
