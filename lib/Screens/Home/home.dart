// ignore_for_file: unused_import

import 'package:arz8/Screens/Details/bloc/detail_screen_bloc.dart';
import 'package:arz8/Screens/Details/details.dart';
import 'package:arz8/Screens/Home/bloc/homebloc_bloc.dart';
import 'package:arz8/model/country.dart';
import 'package:arz8/services/methods.dart';
import 'package:arz8/main.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

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
    BlocProvider.of<HomeblocBloc>(context).add(HomeStarted(CountryModel()));
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

      body: SingleChildScrollView(
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
                    elevation: 3,
                    child: TextFormField(
                      onChanged: (value) {
                        if (value.trim().isEmpty) {
                          BlocProvider.of<HomeblocBloc>(
                            context,
                          ).add(HomeStarted(CountryModel()));
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
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),

                        hintText: ' Search for a country...',
                        hintStyle: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 14),

                        prefixIcon: IconButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              BlocProvider.of<HomeblocBloc>(
                                context,
                              ).add(SearchByName(textColntroller.text));
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
                    margin: EdgeInsets.only(left: 15),
                    height: 60,
                    width: 190,
                    alignment: Alignment.centerLeft,
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      elevation: 3,
                      borderRadius: BorderRadius.circular(8),
                      child: DropdownButton(
                        dropdownColor: Theme.of(context).colorScheme.primary,
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
                            dropdownvalue = value;
                            textColntroller.clear();
                          });
                          if (value == 'All') {
                            BlocProvider.of<HomeblocBloc>(
                              context,
                            ).add(HomeStarted(CountryModel()));
                          } else {
                            BlocProvider.of<HomeblocBloc>(
                              context,
                            ).add(DropdownClicked(dropdownvalue!));
                          }
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
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 20,
                        ),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        menuWidth: 200,
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        underline: SizedBox.shrink(),
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                Expanded(
                  child: BlocBuilder<HomeblocBloc, HomeblocState>(
                    builder: (context, state) {
                      if (state is Homesuccess) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.countries.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DetailsScreen(
                                        countryModel: state.countries[index],
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
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.countries[index].name!,
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              SizedBox(width: 10),

                                              Text(
                                                state
                                                    .countries[index]
                                                    .population
                                                    .toString()
                                                    .seRagham(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                'Region:',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              SizedBox(width: 10),

                                              Text(
                                                state.countries[index].region!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Text(
                                                'Capital:',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                              SizedBox(width: 10),

                                              Text(
                                                state.countries[index].capital!
                                                    .join(', '),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w300,
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
                                      state.countries[index].flagPng!,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if (state is HomeError) {
                        return Center(child: Text('Error'));
                      }
                      return CupertinoActivityIndicator();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
