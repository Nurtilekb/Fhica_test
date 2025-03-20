import 'package:appp/describe_card.dart';
import 'package:appp/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart'; // Импортируем Hive
import 'package:appp/create_trip.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Trip_creat extends StatefulWidget {
  const Trip_creat({super.key, this.nametoTriptext});
  final nametoTriptext;

  @override
  State<Trip_creat> createState() => _Trip_creatState();
}

class _Trip_creatState extends State<Trip_creat> {
  List<Trip> trips = [];
  late Box<Trip> tripBox;

  @override
  void initState() {
    super.initState();
    _loadTrips();
    tripBox = Hive.box<Trip>('trips');
  }

  Future<void> _loadTrips() async {
    var box = Hive.box<Trip>('trips');
    print("    ${trips.length}    ");
    setState(() {
      trips = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: tripBox.listenable(),
        builder: (context, Box<Trip> box, _) {
          if (box.isEmpty) {
            return __buildEmptyTripsUI(trips, context);
          } else {
            return buildTripsCard(box);
          }
        },
      ),
    );
  }

  Widget buildTripsCard(Box<Trip> box) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 631.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.h),
                    child: Text(
                      'Trips Created',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'interTight',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    width: 343.w,
                    child: Column(
                      children: List.generate(box.length, (index) {
                        final trip = box.getAt(index);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DescribeCard(
                                      cityies: trip.cities,
                                      title: trip.name,
                                    ),
                              ),
                            );
                          },
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/pngs/planes.png', // Любая ссылка на картинку
                                    fit: BoxFit.cover, // Заполняет весь Card
                                  ),
                                ),
                                Container(
                                  height: 160.h,
                                  width: 343.w,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          trip!.name,
                                          style: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontFamily: 'interTight',
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.all(4.w),
                                              height: 23.h,

                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                  59,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "  Places to visit: 39  ",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(4.w),
                                              height: 23.h,
                                              width: 68.w,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                  59,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Cities: ${trip.cities.length.toString()}",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00a5df),
                minimumSize: Size(343.w, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.r),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTrip()),
                ).then((_) => _loadTrips());
              },
              child: Text(
                'Create a trip',
                style: TextStyle(
                  color: Color(0xFFEDFAFF),
                  fontSize: 16.sp,
                  fontFamily: "interTight",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget __buildEmptyTripsUI(dynamic trips, BuildContext context) {
    return Center(
      child: Container(
        color: Color.fromARGB(0, 19, 221, 232),
        padding: EdgeInsets.only(top: 90.h),
        margin: EdgeInsets.symmetric(vertical: 15.h),
        width: 343.w,
        height: 594.h,
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/pngs/roadmap.png', width: 164.w),
            SizedBox(height: 15.h),
            Text(
              "You didn't create the trip",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "interTight",
                color: Color(0xFF07242F),
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                height: 66.h,
                width: 280.w,
                child: Text(
                  "Create your first trippy inter-city trip!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "interTight",
                    color: Color(0xFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: 70.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00a5df),
                minimumSize: Size(343.w, 56.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.r),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTrip()),
                ).then((_) => _loadTrips());
              },
              child: Text(
                'Create a trip',
                style: TextStyle(
                  color: Color(0xFFEDFAFF),
                  fontSize: 16.sp,
                  fontFamily: 'interTight',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ImageCard extends StatelessWidget {
//   final String narmer;
//   final String citys;

//   const ImageCard({super.key, required this.narmer, required this.citys});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.antiAlias, // Обрезает изображение по границам Card
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16), // Закругленные углы
//       ),
//       elevation: 1, // Тень
//       child: Stack(
//         children: [
//           // Фоновое изображение
//           Positioned.fill(
//             child: Image.asset(
//               'assets/pngs/planes.png', // Любая ссылка на картинку
//               fit: BoxFit.cover, // Заполняет весь Card
//             ),
//           ),
//           // Затемнение фона для читаемости текста (опционально)

//           // Текст по центру
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   narmer,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Белый текст для контраста
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 Text(
//                   citys,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white, // Белый текст для контраста
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
