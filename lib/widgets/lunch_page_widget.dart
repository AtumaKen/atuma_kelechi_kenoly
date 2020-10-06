import 'package:atuma_kelechi_kenoly/providers/api_get.dart';
import 'package:atuma_kelechi_kenoly/screens/result_screen.dart';
import 'package:atuma_kelechi_kenoly/widgets/search_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LunchPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchList = Provider.of<APIGet>(context).terms;
    return ListView.builder(
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: searchList[i],
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            child: SearchTiles(),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ResultScreen.routeName, arguments: searchList[i]);
              print(searchList[i].countries);
            },
          ),
        ),
      ),
      itemCount: searchList.length,
    );
  }
}
