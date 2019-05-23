import 'package:flutter/material.dart';
import 'package:flutter_wan_android/blocs/app_bloc.dart';
import 'package:flutter_wan_android/blocs/bloc_provider.dart';
import 'package:flutter_wan_android/model/protocol/search_resp.dart';
import 'package:flutter_wan_android/utlis/object_util.dart';
import 'package:flutter_wan_android/views/widgets/search_item.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final AppBloc bloc = BlocProvider.of<AppBloc>(context);
    bloc.searchList('书籍');
    return StreamBuilder(
        stream: bloc.searchSubject.stream,
        builder: (context, snapshot) {
          return SearchList(snapshot.data);
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

class SearchList extends StatelessWidget {
  final List<SearchResp> _list;

  SearchList(this._list);

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmptyList(_list)) {
      return Container(height: 0.0);
    }
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return SearchItem(_list[index]);
      },
    );
  }
}
