import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/common/appcolors.dart';

class BusSeatSelection extends StatefulWidget {
  const BusSeatSelection({Key? key}) : super(key: key);

  @override
  State<BusSeatSelection> createState() => _BusSeatSelectionState();
}

class _BusSeatSelectionState extends State<BusSeatSelection> {
  final Set<SeatNumber> selectedSeats = {};
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 368,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xffEFF3FB)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Parking Map - 2D",
                      style: GoogleFonts.publicSans(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    ),
                    Spacer(),
                    Container(
                      width: 114,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          SvgPicture.asset(
                            "assets/icons/filter.svg",
                            height: 12,
                            width: 12,
                          ),
                          Spacer(),
                          Text(
                            "Ev- Charging",
                            style: GoogleFonts.publicSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w100,
                                color: Colors.grey.shade900),
                          ),
                          Spacer(),
                          SvgPicture.asset(
                            "assets/icons/downarrow.svg",
                            height: 14,
                            width: 12,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.grey.shade300,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildLegend(kgreencolor, 'Available'),
                    SizedBox(
                      width: 10,
                    ),
                    _buildLegend(ksecndrycolor, 'Reserved'),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // Stack for arrows and scrollable seats
              Container(
                  height: 220,
                  child: Stack(
                    children: [
                      // Horizontal Scrollview
                      Positioned.fill(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          child: SeatLayoutWidget(
                            onSeatStateChanged: (row, col, state) {
                              setState(() {
                                if (state == SeatState.selected) {
                                  selectedSeats
                                      .add(SeatNumber(rowI: row, colI: col));
                                } else {
                                  selectedSeats
                                      .remove(SeatNumber(rowI: row, colI: col));
                                }
                              });
                            },
                            stateModel: SeatLayoutStateModel(
                              rows: 4, // Ensure rows = 10
                              cols: 10, // Ensure cols = 7
                              seatSvgSize: 50,
                              pathSelectedSeat: 'assets/icons/car1.svg',
                              pathDisabledSeat: 'assets/icons/car1.svg',
                              pathSoldSeat: 'assets/icons/car2.svg',
                              pathUnSelectedSeat: 'assets/icons/car1.svg',
                              currentSeatsState: [
                                [
                                  SeatState.empty,
                                  SeatState.empty,
                                  SeatState.empty,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.disabled,
                                  SeatState.empty,
                                  SeatState.empty,
                                ],
                                [
                                  SeatState.unselected,
                                  SeatState.selected,
                                  SeatState.selected,
                                  SeatState.selected,
                                  SeatState.selected,
                                  SeatState.disabled,
                                  SeatState.selected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                ],
                                [
                                  SeatState.unselected,
                                  SeatState.disabled,
                                  SeatState.unselected,
                                  SeatState.disabled,
                                  SeatState.unselected,
                                  SeatState.disabled,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.disabled,
                                  SeatState.unselected,
                                ],
                                [
                                  SeatState.empty,
                                  SeatState.empty,
                                  SeatState.empty,
                                  SeatState.empty,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                  SeatState.unselected,
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Centering the Arrows
                      Align(
                        alignment: Alignment
                            .center, // Centers the arrows horizontally and vertically
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Arrow
                            GestureDetector(
                              onTap: () {
                                _scrollLeft();
                              },
                              child: SvgPicture.asset(
                                "assets/icons/left.svg",
                                height: 30,
                              ),
                            ),
                            SizedBox(width: 20), // Add space between the arrows
                            // Right Arrow
                            GestureDetector(
                              onTap: () {
                                _scrollRight();
                              },
                              child: SvgPicture.asset(
                                "assets/icons/right.svg",
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (_) => AlertDialog(
              //         title: const Text('Selected Seats'),
              //         content: Text(selectedSeats.join(', ')),
              //         actions: [
              //           TextButton(
              //             onPressed: () => Navigator.pop(context),
              //             child: const Text('OK'),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              //   child: Text(
              //     'Show Selected Seats',
              //     style: GoogleFonts.publicSans(color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      );
    
  }

  Widget _buildLegend(Color color, String label) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          width: 20,
          height: 20,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: GoogleFonts.publicSans(
              fontSize: 10, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.position.pixels - 200,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.position.pixels + 200,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) =>
      other is SeatNumber && rowI == other.rowI && colI == other.colI;

  @override
  int get hashCode => rowI.hashCode ^ colI.hashCode;

  @override
  String toString() => '[Row $rowI, Col $colI]';
}