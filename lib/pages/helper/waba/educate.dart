import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wabayetu/resource/color.dart';
import 'package:wabayetu/resource/string.dart';

class Educate extends StatefulWidget {
  const Educate({Key? key}) : super(key: key);

  @override
  State<Educate> createState() => _EducateState();
}

class _EducateState extends State<Educate> {
  bool bool1 = false;
  bool bool2 = false;
  bool bool3 = false;
  bool bool4 = false;
  bool bool5 = false;
  bool bool6 = false;
  bool bool7 = false;
  bool bool8 = false;
  bool bool9 = false;
  bool bool10 = false;
  bool bool11 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList.white,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          itemFaq1(
              title: 'Gutters and Downspouts Water Collection',
              about:
                  'This is always the first step when starting to harvest rainwater. This method involves installing gutters on the roof of a building and maximizing the surface area of the roof to collect rainwater. If your house or building does not have this already, you should consider installing them. Gutters and downspout can direct water to storage water systems near the house. They can also be used to direct water to a garden. Let us look into this options.',
              mainBool: bool1, image: '', imageStatus: false),
          itemFaq2(
              title: 'Rain Barrels Water Collection',
              about:
              'A rain barrel is a medium sized to a large container which collects water like a big bucket. The barrel can be customised with fittings such as a lid to prevent objects from getting in and sometimes a tap. A water barrel can be made from an old or unused trash can and even a drum. This is a simple and affordable way to store rainwater. Although this method is short term, one can choose to invest in many connecting drums or several drums around the homestead.',
              mainBool: bool2, image: 'https://www.nyikasilika.org/wp-content/uploads/2018/03/52HarvestRainWater-lge.jpg', imageStatus: true),
          itemFaq3(
              title:
                  'Water Tank',
              about:
                  'For large roofs, buildings can have water tanks which will store rainwater in thousands of litres. This can be outside water tanks or underground water tanks. A water tank does not have to be the conventional plastic one. They can also be built from concrete underground or above ground. Due to its large size, a water tank should be placed on a stable ground to prevent unwanted damage.',
              mainBool: bool3, image: 'https://www.nyikasilika.org/wp-content/uploads/2018/03/SAM_1619-800x500.jpg', imageStatus: true),
          itemFaq4(
              title: 'Bladder Tank',
              about:
                  'Much like a rural biogas collector, we can use this large tubes to store rainwater that falls on our roofs.',
              mainBool: bool4, image: 'https://www.nyikasilika.org/wp-content/uploads/2018/03/WC19.jpg', imageStatus: true),
          itemFaq5(
              title: 'Rain Reservoir System',
              about:
                  'This system will benefit huge enterprises such as apartments and hotels. Consider collecting the rainwater that falls on the rooftop, whether a flat roof or a slanted one, run through pipes to a storage facility like a tank. This water is then filtered to purify the larger particles then stored in designated rainwater harvest tanks. This stored rainwater can be used for washing cars, watering gardens and even flushing toilets, minimising the use of underground water. Both the economy and the environment will benefit from this system as the energy bill will be minimised and energy saved respectively.',
              mainBool: bool5, image: '', imageStatus: false),
          itemFaq6(
              title: 'Create a rain garden',
              about:
                  'Do you have space in your compound? Use this space to create a rain garden. This is a sunken landscape that uses local plants, local soil, and mulch to remove pollutants from water, and allows it to percolate into the ground. Not only will it look good all year round, it will also have a positive impact on the environment. If every homestead had a rain garden, think of the water that will infiltrate into the ground and add to the groundwater system.',
              mainBool: bool6, image: 'https://www.nyikasilika.org/wp-content/uploads/2018/03/j.jpg', imageStatus: true),
          itemFaq7(
              title: 'Rain Saucer',
              about:
                  'A rain saucer is a free-standing rain collection system. A roof is not required for this, neither are gutters. All you need is a drum and a saucer-like collection system much like an upside-down umbrella unfolding to form a funnel. This is very effective in rural areas or a farm with limited roofs. This can be a self-made project to work on during this raining season. No excuses.',
              mainBool: bool7, image: 'https://www.nyikasilika.org/wp-content/uploads/2018/03/WC20.jpg', imageStatus: true),
          itemFaq8(
              title: 'Borewells and recharge pits',
              about:
                  'A borewell is an open dug well which can be used to replenish underground aquifers ensuring the continuous supply of water during the dry season. We can replenish our Aquifers through Recharge. This is achieved by artificially constructed chambers known as Recharge Pits which facilitate the percolation of water back to the water table. Aquifers, springs and other water-bearing formations are identified and recharge pits are built around them to specially replenish their water content through rainfall and seepage.',
              mainBool: bool8, image: '', imageStatus: false),
          itemFaq9(
              title: 'Green roof',
              about: 'Green roof systems or living roofs are roofs that are able to manage stormwater runoff by reducing and delaying the water flow. This system is also able to keep the rainwater clean.For a roof garden, one needs to put down a liner to protect the roof, and install a drainage system for excess runoff which is diverted into a barrel or storage tank. The plants to be planted should be of low-maintenance plants.',
              mainBool: bool9, image: '', imageStatus: false),
          itemFaq10(
              title: 'Ponds and pans',
              about:
                  'An excavated pond and pan are small reservoirs not more than 3 m deep which are usually dug of-stream with raised and compacted banks all around. They purpose to collect and store runoff water from various surfaces including from hillsides, roads, rocky areas and open rangeland. Ponds are constructed where there is some groundwater contribution or a high water table while pans receive their water wholly from surface runoff while. This two methods of water harvesting are essential in national parks and reserves as well as farms and grazing regions for domestic animals.',
              mainBool: bool10, image: '', imageStatus: false),
        ],
      ),
    );
  }

  Widget itemFaq1(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool1);
                  setState(() {
                    if (bool1 == false) {
                      setState(() {
                        bool1 = true;
                      });
                    } else {
                      setState(() {
                        bool1 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool1 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool1,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq2(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool2);
                  setState(() {
                    if (bool2 == false) {
                      setState(() {
                        bool2 = true;
                      });
                    } else {
                      setState(() {
                        bool2 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool2 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool2,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq3(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool3);
                  setState(() {
                    if (bool3 == false) {
                      setState(() {
                        bool3 = true;
                      });
                    } else {
                      setState(() {
                        bool3 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool3 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool3,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq4(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool4);
                  setState(() {
                    if (bool4 == false) {
                      setState(() {
                        bool4 = true;
                      });
                    } else {
                      setState(() {
                        bool4 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool4 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool4,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq5(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool5);
                  setState(() {
                    if (bool5 == false) {
                      setState(() {
                        bool5 = true;
                      });
                    } else {
                      setState(() {
                        bool5 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool5 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool5,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq6(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool6);
                  setState(() {
                    if (bool6 == false) {
                      setState(() {
                        bool6 = true;
                      });
                    } else {
                      setState(() {
                        bool6 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool6 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool6,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq7(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool7);
                  setState(() {
                    if (bool7 == false) {
                      setState(() {
                        bool7 = true;
                      });
                    } else {
                      setState(() {
                        bool7 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool7 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool7,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq8(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool8);
                  setState(() {
                    if (bool8 == false) {
                      setState(() {
                        bool8 = true;
                      });
                    } else {
                      setState(() {
                        bool8 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool8 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool8,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq9(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool9);
                  setState(() {
                    if (bool9 == false) {
                      setState(() {
                        bool9 = true;
                      });
                    } else {
                      setState(() {
                        bool9 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool9 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool9,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq10(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool10);
                  setState(() {
                    if (bool10 == false) {
                      setState(() {
                        bool10 = true;
                      });
                    } else {
                      setState(() {
                        bool10 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool10 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool10,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemFaq11(
      {required String title, required String about, required bool mainBool, required String image, required bool imageStatus}) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      decoration: BoxDecoration(
        color: ColorList.blue.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: ColorList.blue,
                      fontSize: 13),
                ),
              ),
              InkWell(
                onTap: () {
                  print("object");
                  print(bool11);
                  setState(() {
                    if (bool11 == false) {
                      setState(() {
                        bool11 = true;
                      });
                    } else {
                      setState(() {
                        bool11 = false;
                      });
                    }
                  });
                },
                child: Icon(
                  bool11 == false
                      ? CupertinoIcons.arrow_down_circle_fill
                      : CupertinoIcons.arrow_up_circle_fill,
                  size: 24,
                  color: ColorList.blue,
                ),
              )
            ],
          ),
          Visibility(
            visible: bool11,
            child: Column(
              children: [
                Text(
                  about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w100,
                      color: ColorList.blue,
                      fontSize: 8),
                ),
                imageStatus == true ? Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      //decoration for the outer wrapper
                      color: ColorList.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ) : const Text(""),
              ],
            ),
          )
        ],
      ),
    );
  }
}
