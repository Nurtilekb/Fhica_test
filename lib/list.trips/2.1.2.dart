import 'package:appp/describe_card.dart';
import 'package:appp/trip_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:appp/create_trip.dart';
import 'package:appp/theme/app_theme.dart';

class Trip_creat extends StatefulWidget {
  const Trip_creat({super.key, this.nametoTriptext});
  final nametoTriptext;

  @override
  State<Trip_creat> createState() => _Trip_creatState();
}

class _Trip_creatState extends State<Trip_creat> {
  late Box<Trip> tripBox;

  @override
  void initState() {
    super.initState();
    tripBox = Hive.box<Trip>('trips');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: tripBox.listenable(),
        builder: (context, Box<Trip> box, _) {
          if (box.isEmpty) {
            return _buildEmptyTripsUI(context);
          } else {
            return _buildTripsCard(box);
          }
        },
      ),
    );
  }

  Widget _buildTripsCard(Box<Trip> box) {
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
                      style: AppTheme.headingMedium(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    width: 343.w,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final trip = box.getAt(index);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DescribeCard(
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
                                    'assets/pngs/planes.png',
                                    fit: BoxFit.cover,
                                    cacheHeight: 160,
                                    cacheWidth: 343,
                                  ),
                                ),
                                Container(
                                  height: 160.h,
                                  width: 343.w,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          trip!.name,
                                          style: TextStyle(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontFamily: AppTheme.fontFamily,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            _buildChip("Places to visit: 39"),
                                            _buildChip("Cities: ${trip.cities.length}"),
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
                      },
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
                backgroundColor: AppTheme.primaryColor,
                minimumSize: Size(AppTheme.buttonWidth, AppTheme.buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTrip()),
                );
              },
              child: Text(
                'Create a trip',
                style: AppTheme.buttonLabel(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label) {
    return Container(
      margin: EdgeInsets.all(4.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppTheme.overlayWhite,
        borderRadius: BorderRadius.circular(AppTheme.chipRadius),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          fontFamily: AppTheme.fontFamily,
        ),
      ),
    );
  }

  Widget _buildEmptyTripsUI(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 90.h),
        margin: EdgeInsets.symmetric(vertical: 15.h),
        width: 343.w,
        height: 594.h,
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/pngs/roadmap.png', width: 164.w, cacheHeight: 200),
            SizedBox(height: 15.h),
            Text(
              "You didn't create the trip",
              textAlign: TextAlign.center,
              style: AppTheme.headingLarge(),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.h),
                height: 66.h,
                width: 280.w,
                child: Text(
                  "Create your first trippy inter-city trip!",
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyLarge(),
                ),
              ),
            ),
            SizedBox(height: 70.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                minimumSize: Size(AppTheme.buttonWidth, AppTheme.buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.buttonRadius),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateTrip()),
                );
              },
              child: Text(
                'Create a trip',
                style: AppTheme.buttonLabel(),
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
