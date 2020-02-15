import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/subjects.dart';
import 'package:search_app_bar/searcher.dart';

class SearchHomeBloc extends BlocBase implements Searcher<String>{
  final _filteredData = BehaviorSubject<List<String>>();

  final dataList = [
    'test',
    'testing',
    'awake',
    'wake',
    'sleep',
    'deep'
  ];

  Stream<List<String>> get filteredData => _filteredData.stream;

  SearchHomeBloc(){
    _filteredData.add(dataList);
  }

  @override
  get onDataFiltered => _filteredData.add;

  @override
  get data => dataList;

  @override
  void dispose(){
    _filteredData.close();
    super.dispose();
  }

}