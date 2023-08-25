// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:homesefty/controller/user/allwork/selectwork.dart';
import 'package:homesefty/model/User/homepage/totalworks/usershowtotalworkmodel.dart';
import 'package:homesefty/view/User/designPage/setDatenadtime.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class homeScreeenTotalWork extends StatelessWidget {
  const homeScreeenTotalWork({
    super.key,
    required this.mediaqury,
  });

  final MediaQueryData mediaqury;

  @override
  Widget build(BuildContext context) {
     final workpage = Provider.of<SelectWorkPage>(context,listen: false);
    return SizedBox(
      width: mediaqury.size.width * 9,
      // color: Colors.red,
      height: mediaqury.size.height * .35,
      child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: [
            GestureDetector(
              onTap: ()async {
                
                await workpage.addData('Electronics');
               await Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Electronics',
                  lottie: Lottie.asset(
                      'asset/animation/animation_llly0n3m (1).json')),
            ),
            GestureDetector(
              onTap: ()async {
                 await workpage.addData('Plumber');
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Painter',
                  lottie:
                      Lottie.asset('asset/animation/animation_lllxttwv.json')),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Plumber',
                  lottie:
                      Lottie.asset('asset/animation/animation_lllxn377.json')),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Driver',
                  lottie:
                      Lottie.asset('asset/animation/animation_llly3tmr.json')),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Gardener',
                  lottie:
                      Lottie.asset('asset/animation/animation_llly9coj.json')),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const ScheduleTimeAndDate();
                  },
                ));
              },
              child: UserHomePageWorks(
                  mediaqury: mediaqury,
                  workname: 'Cook',
                  lottie:
                      Lottie.asset('asset/animation/animation_lllyfa08.json')),
            ),
          ]),
    );
  }
}
