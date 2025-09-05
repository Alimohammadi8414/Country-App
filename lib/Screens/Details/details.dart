import 'package:arz8/Screens/Details/bloc/detail_screen_bloc.dart';
import 'package:arz8/main.dart';
import 'package:arz8/model/country.dart';
import 'package:arz8/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class DetailsScreen extends StatefulWidget {
  final CountryModel countryModel;
  const DetailsScreen({required this.countryModel, super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<DetailScreenBloc>(
      context,
    ).add(DetailScreenStarted(widget.countryModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 20,
        actions: [
          Container(
            margin: EdgeInsets.only(left: 16.0),
            child: Text(
              'Where in The world ?',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.darkBlue,
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
      body: BlocBuilder<DetailScreenBloc, DetailScreenState>(
        builder: (context, state) {
          if (state is DetialScreenSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 115,
                        height: 37,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            iconSize: 20,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Back',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70),
                    Image.network(
                      fit: BoxFit.fill,
                      state.countryModel.flagPng!,
                      height: 250,
                      width: MediaQuery.sizeOf(context).width,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 40),

                      alignment: Alignment.centerLeft,
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.countryModel.name!,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(height: 30),
                          Row(
                            children: [
                              Text(
                                'Native Name:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),

                              Text(
                                state.countryModel.name!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Population:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),

                              Text(
                                state.countryModel.population
                                    .toString()
                                    .seRagham(),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),

                              Text(
                                state.countryModel.region!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Sub Region:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                state.countryModel.subregion!,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                state.countryModel.capital!.join(', '),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Row(
                            children: [
                              Text(
                                'Top Level Domain:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                state.countryModel.tld!.join(', '),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Currencies:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                state
                                    .countryModel
                                    .currencies!
                                    .values
                                    .first['name'],
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                          Row(
                            children: [
                              Text(
                                'Languages:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                state.countryModel.languages!.values
                                    .take(4)
                                    .join(', '),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          state.countryModel.borders!.isEmpty
                              ? SizedBox()
                              : Text(
                                'Border Countries:',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                          SizedBox(height: 25),
                          state.countryModel.borders!.isEmpty
                              ? SizedBox()
                              : SizedBox(
                                height: 250,
                                width: MediaQuery.sizeOf(context).width,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.countryModel.borders!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 40,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 3,
                                      ),
                                  itemBuilder: (context, index) {
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        elevation: 3,

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        var countryCode =
                                            state.countryModel.borders![index];
                                        BlocProvider.of<DetailScreenBloc>(
                                          context,
                                        ).add(
                                          BorderCountryClicked(countryCode),
                                        );
                                      },
                                      child: Text(
                                        state.countryModel.borders![index],
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is DetialScreenError) {
            Center(child: Text('Something Went Wrong'));
          }
          return Center(child: CupertinoActivityIndicator());
        },
      ),
    );
  }
}
