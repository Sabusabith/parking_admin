import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/common/appcolors.dart';

class Graphtile extends StatelessWidget {
  const Graphtile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Dummy data for the donut chart
    final List<ChartData> chartData = [
      ChartData('Booked Slots: 24', 75, kprimerycolor),
      ChartData('Free Slots: 3', 25, ksecndrycolor),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 223,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xffFDF0B7))),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          width: size.width,
          height: 215,
          decoration: BoxDecoration(
              color: kgraphtilecolor, borderRadius: BorderRadius.circular(28)),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "December-2024",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontSize: 11.84,
                          fontWeight: FontWeight.w600),
                    ),
                    SvgPicture.asset(
                      "assets/icons/arrowright.svg",
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Container(
                  child: Stack(children: [
                    SfCircularChart(
                      legend: Legend(
                          itemPadding: 15,
                          alignment: ChartAlignment.near,
                          width: "200",
                          textStyle: GoogleFonts.publicSans(
                              fontSize: 13.81,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900),
                          isVisible: true,
                          position: LegendPosition.right,
                          padding: 10,
                          title: LegendTitle(
                              text: "Available Space: 27",
                              textStyle: GoogleFonts.publicSans(
                                  fontSize: 13.81,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade900))),
                      series: <DoughnutSeries<ChartData, String>>[
                        DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          cornerStyle: CornerStyle.bothCurve,

                          endAngle: 180, startAngle: 180,
                          legendIconType: LegendIconType.circle,

                          xValueMapper: (ChartData data, _) => data.BookedSlots,
                          yValueMapper: (ChartData data, _) => data.FreeSlots,
                          pointColorMapper: (ChartData data, _) => data.color,
                          innerRadius: '54%', // For a donut-like appearance
                          radius: "68",
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                        ),
                      ],
                    ),
                    Positioned(
                        top: 57,
                        left: 65,
                        child: Text(
                          "88%",
                          style: GoogleFonts.publicSans(
                              fontSize: 19.73,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade900),
                        ))
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Transform(
                  transform: Matrix4.translationValues(0, -30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total Revenue: 12750/-",
                        style: GoogleFonts.publicSans(
                            color: Colors.grey.shade900,
                            fontSize: 13.81,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data model for the chart
class ChartData {
  final String BookedSlots;
  final double FreeSlots;
  final Color color;

  ChartData(this.BookedSlots, this.FreeSlots, this.color);
}
