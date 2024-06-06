import 'package:flutter/material.dart';

import 'package:mhi/core/helper/spacing.dart';

import 'package:mhi/features/patient/home/presentation/widgets/patient_topbar_card.dart';
import 'package:mhi/features/patient/home/presentation/widgets/search_for_doctor_card.dart';

class PatientHomeView extends StatelessWidget {
  const PatientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const PatientHomeCard(),
        verticleSpace(60),
        const SearchForDoctorsHomeView(),
      ],
    ));
  }
}








// class AppointmentHomeScreen extends StatefulWidget {
//   const AppointmentHomeScreen({
//     super.key,
//   });

//   static PageController controller = PageController();

//   @override
//   State<AppointmentHomeScreen> createState() => _AppointmentHomeScreenState();
// }

// class _AppointmentHomeScreenState extends State<AppointmentHomeScreen> {
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         padding: EdgeInsets.only(top: 10.h),
//         height: 200.h,
//         width: 335.w,
//         decoration: BoxDecoration(
//             color: Theme.of(context).cardColor,
//             borderRadius: const BorderRadius.only(
//               topRight: Radius.circular(20),
//               bottomRight: Radius.circular(20),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 blurRadius: 2,
//                 spreadRadius: 0,
//               )
//             ]),
//         child: Column(
//           children: [
//             verticleSpace(30),
//             SizedBox(
//               width: 350.w,
//               height: 110.h,
//               child: ListView.builder(
//                 controller: AppointmentHomeScreen.controller,
//                 physics: const BouncingScrollPhysics(),
//                 reverse: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 1,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 18.0),
//                     child: Row(
//                       children: [
//                         AppointmentInsiderHome(
//                           buttontext: "التخصصات",
//                           image: Assets.docImage,
//                           onTap: () async {
//                             // customPushNavigation(
//                             //     context, Routes.specializesView);
//                             //     BlocProvider.of<GetAllSpecializesCubit>(context).getSpecializes();
//                           },
//                           secondColor: AppColors.lightRed,
//                           text: "اختر احد التخصصات",
//                         ),
//                         AppointmentInsiderHome(
//                           buttontext: "حجز موعد",
//                           image: Assets.hospitalView,
//                           onTap: () async {
//                             // customPushNavigation(
//                             //     context, Routes.mhiBookingHospitalsView);
//                             // BlocProvider.of<MhiGetAllHospitalsCubit>(context)
//                             //     .getAllHospitals();
//                           },
//                           secondColor: AppColors.lightGreen,
//                           text: "احجز الأن ",
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SmoothPageIndicator(
//               controller: AppointmentHomeScreen.controller,
//               count: 1,
//               effect: ExpandingDotsEffect(
//                 dotHeight: 3.h,
//                 dotWidth: 80.w,
//                 dotColor: Colors.grey,
//                 activeDotColor: AppColors.lightGreen,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AppointmentInsiderHome extends StatelessWidget {
//   const AppointmentInsiderHome({
//     super.key,
//     required this.buttontext,
//     required this.image,
//     required this.onTap,
//     required this.secondColor,
//     required this.text,
//   });
//   final String image;
//   final String text;
//   final String buttontext;
//   final Color secondColor;
//   final void Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: EdgeInsets.only(left: 10.w),
//         //make the container has
//         child: Container(
//           width: 220.w,
//           height: 100.h,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 begin: Alignment.centerRight,
//                 end: Alignment.centerLeft,
//                 colors: [Colors.black, secondColor]),
//             borderRadius: const BorderRadius.all(Radius.circular(12)),
//             image: DecorationImage(
//                 image: AssetImage(image), fit: BoxFit.cover, opacity: 0.5),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(right: 12.w),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   text,
//                   style: AppTextStyles.jannat18BoldWhite,
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.lightGreen,
//                       shape: ContinuousRectangleBorder(
//                           borderRadius: BorderRadius.circular(20))),
//                   onPressed: onTap,
//                   child: Text(
//                     buttontext,
//                     style: AppTextStyles.jannat20BoldWhite,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
