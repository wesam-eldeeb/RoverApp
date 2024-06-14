import 'package:flutter/material.dart';

class MyTripItemPassenger extends StatelessWidget {
  String date;
  String day;
  String time;
  String to;
  String from;
  String price;
  AssetImage image;

  MyTripItemPassenger(
      {required this.date,
      required this.day,
      required this.time,
      required this.to,
      required this.from,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.24,
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  image: DecorationImage(image: image),
                ),
              ),
              SizedBox(
                width: mediaQuary.width * 0.02,
              ),
              Container(
                // padding: EdgeInsets.only(top: 25),
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Day: $date',
                            style: const TextStyle(
                                color: Color(0xff707070),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.02),
                        Text('| $day |',
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xffE60024))),
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.02),
                        Text(time,
                            style: const TextStyle(
                                fontSize: 15.0, color: Color(0xffA8A8A8))),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/from.png'),
                        SizedBox(
                          width: mediaQuary.width * 0.02,
                        ),
                        Text(
                          from,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffE60024)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.28, left: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/ll.png'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/to.png'),
                        SizedBox(
                          width: mediaQuary.width * 0.01,
                        ),
                        Text(
                          to,
                          style:
                              TextStyle(fontSize: 15, color: Color(0xffA8A8A8)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuary.height * 0,
                    ),
                    Row(
                      children: [
                        Text(
                          "Price: $price",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: mediaQuary.height * 0.01,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle accept trip button press
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffD3D3D3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: Size(100, 35)),
                          child: const Text(
                            'Decline',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff030F09),
                            ),
                          ),
                        ),
                        SizedBox(width: mediaQuary.width * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            // Navigator.pushReplacementNamed(
                            //     context, DetailsPage.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE60024),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              minimumSize: Size(100, 35)),
                          child: const Text(
                            'Details',
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
        ));
  }
}
