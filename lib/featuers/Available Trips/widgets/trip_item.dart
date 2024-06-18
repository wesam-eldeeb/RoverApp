import 'package:Rover/featuers/Available%20Trips/models/available_model.dart';
import 'package:flutter/material.dart';

class TripItem extends StatelessWidget {
  TripItem(
    void print, {
    required this.availableTips,
    Key? key,
  }) : super(key: key);

  // String name;
  // String destination;
  // String travelTime;
  // String numPassengers;
  // String cost;
  // bool isAccepted;
  // AssetImage image;

  // TripItem(
  //     {required this.name,
  //     required this.destination,
  //     required this.travelTime,
  //     required this.numPassengers,
  //     required this.cost,
  //     required this.isAccepted,
  //     required this.image});
  AvailableModel availableTips;

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.22,
      width: MediaQuery.sizeOf(context).width * 0.88,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 0),
              color: Colors.grey.withOpacity(0.4),
            )
          ]),
      child: Container(
        padding: EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaQuary.width * 0.1,
              height: mediaQuary.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                image: DecorationImage(
                    image: AssetImage('${availableTips.driver_Picture}')),
              ),
            ),
            SizedBox(
              width: mediaQuary.width * 0.02,
            ),
            Container(
              // padding: EdgeInsets.only(top: 25),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${availableTips.driver_Name}',
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold)),
                      SizedBox(width: mediaQuary.width * 0.2),
                      Text('${availableTips.price.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(0xffE60024))),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuary.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/rate.png'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuary.height * 0.01,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Destination:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff030F09),
                        ),
                      ),
                      SizedBox(
                        width: mediaQuary.width * 0.01,
                      ),
                      Text(
                        '${availableTips.to}',
                        style: const TextStyle(color: Color(0xffE60024)),
                      ),
                      SizedBox(
                        width: mediaQuary.width * 0.01,
                      ),
                      // Text(
                      //   '|  ' '${availableTips.time}',
                      //   style: const TextStyle(color: Color(0xffA8A8A8)),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuary.height * 0.01,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/pepo.png'),
                        Text(
                          '${availableTips.seatsAvaliable}',
                          style: const TextStyle(
                            color: Color(0xffE60024),
                          ),
                        ),
                        Text(
                          '|  ' '${availableTips.time}',
                          style: const TextStyle(color: Color(0xffA8A8A8)),
                        ),
                      ]),
                  SizedBox(
                    height: mediaQuary.height * 0.001,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle accept trip button press
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffE60024),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            minimumSize: Size(250, 45)),
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
