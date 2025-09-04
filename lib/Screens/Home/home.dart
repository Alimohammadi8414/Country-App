import 'package:arz8/Screens/Details/details.dart';
import 'package:arz8/services/methods.dart';
import 'package:arz8/main.dart';

import 'package:arz8/theme.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> pagestarted = ValueNotifier(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? dropdownvalue;
TextEditingController textColntroller = TextEditingController();
final formkey = GlobalKey<FormState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Homemethods.getcountry();
    pagestarted.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,

        actions: [
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: Text(
              'Where In The World ?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              iconSize: 20,
            ),
            onPressed: () {
              isthemDark.value = !isthemDark.value;
              sharedPreferences.setBool('isdark', isthemDark.value);
            },
            child: Row(
              children: [
                Icon(
                  isthemDark.value
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
                SizedBox(width: 5),
                Text(
                  isthemDark.value ? 'light mode' : 'dark mode',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: ValueListenableBuilder(
        valueListenable: pagestarted,
        builder: (context, value, child) {
          return SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25),
                    Form(
                      key: formkey,
                      child: Material(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                        elevation: 5,
                        child: TextFormField(
                          onChanged: (value) {
                            if (value.trim().isEmpty) {
                              Homemethods.getcountry();
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "this box shouldn't be null";
                            }
                            return null;
                          },
                          controller: textColntroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),

                            hintText: ' Search for a country...',
                            hintStyle: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 14),

                            prefixIcon: IconButton(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    Homemethods.getcountrybyname(
                                      textColntroller.text,
                                    );
                                  });
                                }
                              },
                              icon: Icon(Icons.search_outlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //  Drop down
                    SizedBox(height: 30),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 60,
                        width: 190,
                        alignment: Alignment.center,
                        child: Material(
                          color: Theme.of(context).colorScheme.primary,
                          elevation: 3,
                          borderRadius: BorderRadius.circular(8),
                          child: DropdownButton(
                            dropdownColor:
                                Theme.of(context).colorScheme.primary,
                            items: [
                              DropdownMenuItem(
                                value: 'All',
                                child: Text(
                                  'All',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Africa',
                                child: Text(
                                  'Africa',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Americas',
                                child: Text(
                                  'Americas',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Asia',
                                child: Text(
                                  'Asia',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Europe',
                                child: Text(
                                  'Europe',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'Oceania',
                                child: Text(
                                  'Oceania',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                            value: dropdownvalue,
                            onChanged: (value) {
                              setState(() {
                                dropdownvalue = value!;
                                switch (value) {
                                  case 'All':
                                    Homemethods.getcountry();
                                    break;
                                  case 'Africa':
                                    Homemethods.dropdown(dropdownvalue!);
                                    break;
                                  case 'Americas':
                                    Homemethods.dropdown(dropdownvalue!);
                                    break;
                                  case 'Asia':
                                    Homemethods.dropdown(dropdownvalue!);
                                    break;

                                  case 'Europe':
                                    Homemethods.dropdown(dropdownvalue!);
                                    break;
                                  case 'Oceania':
                                    Homemethods.dropdown(dropdownvalue!);
                                    break;

                                  default:
                                }
                              });
                            },

                            hint: Text(
                              'Filter by region  ',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),

                            elevation: 20,

                            borderRadius: BorderRadius.circular(8.0),
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 20,
                            ),

                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w600),
                            alignment: Alignment.center,
                            menuWidth: 250,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: Homemethods.countryList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          var country = Homemethods.countryList[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DetailsScreen(
                                      countryDetail: country,
                                    );
                                  },
                                ),
                              );
                            },
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 25),
                              height: 360,

                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 20,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: 360,
                                    width: 290,

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          country.name!,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Text(
                                              'Population:',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 10),

                                            Text(
                                              country.population!.toString(),
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              'Region:',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 10),

                                            Text(
                                              country.region!,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              'Capital:',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 10),

                                            Text(
                                              country.capital!.first,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    fit: BoxFit.fitHeight,
                                    height: 190,
                                    width: 290,
                                    country.flagPng!,
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
          );
        },
      ),
    );
  }
}
