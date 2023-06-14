import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import '../data/data.dart';
import '../size_config.dart';
import '../style/style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 17,
            ),
            child: Column(
              children: const [
                // User Info Area.
                UserInfo(),
                // SearchMedical Area.
                SearchMedical(),
                // Services Area.
                Services(),
                // Advertisement.
                Advertisement(),
              ],
            ),
          ),
          //Upcoming Appointments.
          const UpcomingAppointments(),
        ],
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        top: SizeConfig.blockSizeVertical! * 3,
        bottom: 16.0,
      ),
      title: const Padding(
        padding: EdgeInsets.only(
          bottom: 7,
          top: 7,
        ),
        child: Text("👋 Hello!"),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(
          bottom: SizeConfig.blockSizeVertical! * 0,
        ),
        child: Text(
          "Master Oogway",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      trailing: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStyle.profile),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 18.0,
              height: 18.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppStyle.primarySwatch,
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchMedical extends StatelessWidget {
  const SearchMedical({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal! * 1),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          prefixIcon: CupertinoButton(
            onPressed: () {},
            child: SvgPicture.asset(AppStyle.searchIcon),
          ),
          suffixIcon: CupertinoButton(
            onPressed: () {},
            child: SvgPicture.asset(AppStyle.filterIcon),
          ),
          hintText: "Search...",
          fillColor: AppStyle.inputFillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeConfig.blockSizeVertical! * 7,
          ),
          child: Text(
            "Services",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: servicesList
              .map(
                (e) => CupertinoButton(
                  onPressed: () {
                    if (e.route != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => e.route!),
                      );
                    }
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal! * 80,
                    height: SizeConfig.blockSizeVertical! * 40,
                    decoration: BoxDecoration(
                      color: e.color,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: SvgPicture.asset(e.image),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical! * 7,
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffDCEDF9),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 17),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Get the Best\nMedical Service",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                ),
                          ),
                          SizedBox(height: SizeConfig.blockSizeVertical! * 4),
                          Text(
                            "강동주 - 돌담병원\nDoldam Hospital",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  fontSize: 11,
                                  height: 1.5,
                                ),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical! * 8,
                        right: SizeConfig.blockSizeHorizontal! * 10),
                    child: Image.asset(AppStyle.image1),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UpcomingAppointments extends StatelessWidget {
  const UpcomingAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 17),
          child: Text(
            "Upcoming Appointments",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w700, letterSpacing: 1),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 2.0,
                bottom: 2.0,
                right: 20.0,
                left: 9.0,
              ),
              child: Row(
                children: upcomingAppointmentsList
                    .map(
                      (e) => CupertinoButton(
                        onPressed: () {},
                        padding: const EdgeInsets.only(
                          left: 14,
                        ),
                        child: Container(
                          height: SizeConfig.blockSizeVertical! * 50,
                          width: SizeConfig.blockSizeHorizontal! * 220,
                          decoration: BoxDecoration(
                            color: e.color,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                width: 71.46,
                                height: 93.03,
                                decoration: BoxDecoration(
                                  color: Colors.white12,
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                child: Center(
                                  child: Text(
                                    e.date,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    e.time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          letterSpacing: 1,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    e.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.white,
                                        ),
                                  ),
                                  Text(
                                    e.subTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                          color: Colors.white60,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ))
      ],
    );
  }
}
