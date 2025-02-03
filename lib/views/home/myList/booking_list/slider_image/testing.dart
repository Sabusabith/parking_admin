import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';

class BusSeatSelection extends StatelessWidget {
  const BusSeatSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Seat Selection'),
        backgroundColor: Colors.indigo,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SeatLayoutWidget(
              onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                print(
                    "Tapped Seat -> Row: $rowIndex, Col: $colIndex, State: $updatedSeatState");
              },
              stateModel: SeatLayoutStateModel(
                rows: 12, // Number of rows
                cols: 15, // Number of columns
                seatSvgSize: 30, // Size of each SVG seat icon
                pathUnSelectedSeat: 'assets/icons/Eye.svg', // Unselected seat SVG path
                pathSelectedSeat: 'assets/icons/Eye.svg', // Selected seat SVG path
                pathSoldSeat: 'assets/icons/Eye.svg', // Sold seat SVG path
                pathDisabledSeat: 'assets/icons/Eye.svg', // Disabled seat SVG path
                currentSeatsState: List.generate(
                  12, // Rows
                  (row) => List.generate(
                    15, // Columns
                    (col) => (row + col) % 4 == 0
                        ? SeatState.sold // Mark as sold for every 4th seat
                        : SeatState.unselected, // Mark as available for others
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
