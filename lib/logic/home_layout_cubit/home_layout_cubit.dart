import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constance/string.dart';
import 'package:movies/constance/theme.dart';
import 'package:movies/models/popular_model.dart';
import 'package:movies/models/top_rated_model.dart';
import 'package:movies/models/up_coming_model.dart';
import 'package:movies/models/videos_model.dart';
import 'package:movies/models/wish_list_model.dart';
import 'package:movies/services/dio_helper.dart';
import 'package:movies/views/popular_screen/popular_screen.dart';
import 'package:movies/views/top_rated_screen/top_rated_screen.dart';
import 'package:movies/views/up_coming_screen/up_coming_screen.dart';
import 'package:sqflite/sqflite.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      backgroundColor: MyColor.black,
      icon: const Icon(Icons.movie_creation_outlined),
      label: 'Popular',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.whatshot_outlined),
      label: 'TopRated',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.upcoming),
      label: 'UpComing',
    ),
  ];

  List<Widget> screens = const [
    PopularScreen(),
    TopRatedScreen(),
    UpComingScreen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarchangeState());
  }

  bool mode = true;
  changeThemeMode() {
    mode = !mode;
    emit(ChangeThemeModeState());
  }

  Database? database;
  List<WishListModel> wishList = [];

  bool isReadMore = true;

  bool changeFaVIconPopular = true;
  changePopularIcon() {
    changeFaVIconPopular = !changeFaVIconPopular;
    emit(ChangeFavIconPopularSuccess());
  }

  bool changeFaVIconTopRated = true;

  changeTopRatedIcon() {
    changeFaVIconTopRated = !changeFaVIconTopRated;
    emit(ChangeFavIconTopRatedSuccess());
  }

  bool changeFaVIconUpComing = true;

  changeUpComingIcon() {
    changeFaVIconUpComing = !changeFaVIconUpComing;
    emit(ChangeFavIconUpComingSuccess());
  }

  readMore() {
    isReadMore = !isReadMore;
    emit(ChangeReadMore());
  }

  PopularModel? popularModel;
  getPopularData() {
    emit(GetPopularDataLoading());
    DioHelper.getData(url: popularUri).then((value) {
      popularModel = PopularModel.fromJson(value.data);
      emit(GetPopularDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPopularDataError());
    });
  }

  TopRatedModel? topRatedModel;

  getTopRatedData() {
    emit(GetTopRatedDataLoading());
    DioHelper.getData(url: topRatedUri).then((value) {
      topRatedModel = TopRatedModel.fromJson(value.data);
      emit(GetTopRatedDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetTopRatedDataError());
    });
  }

  UpComing? upComingModel;

  getUpComingData() {
    emit(GetUpComingDataLoading());
    DioHelper.getData(url: upComingUri).then((value) {
      upComingModel = UpComing.fromJson(value.data);
      emit(GetUpComingDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUpComingDataError());
    });
  }

  VideosModel? videosModel;

  getPopularVideos({required videosId}) {
    emit(GetPopularVideosLoadingState());
    DioHelper.getVideos(videosId: videosId).then((value) {
      videosModel = VideosModel.fromJson(value.data);
      emit(GetPopularVideosSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPopularVideosErrorState());
    });
  }

  //****************************************************************************
//SQFLITE
  void createDataBase() async {
    emit(OnCreateDatabaseLoading());
    database = await openDatabase(
      'movies.db',
      version: 1,
      onCreate: (database, version) =>
          onCreate(database, version).then((value) {
        debugPrint('tables created');
        emit(OnCreateDatabaseSuccess());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(OnCreateDatabaseError());
      }),
      onOpen: (database) async {
        emit(OnOpenDatabaseLoading());
        await getWishListData(database);
        debugPrint('on opened database');
      },
    );
  }

  Future<void> onCreate(Database database, int version) async {
    await database.execute(
        'CREATE TABLE wishList (id INTEGER PRIMARY KEY,name TEXT,releaseDate TEXT,voteRate TEXT,overView TEXT,idx TEXT)');
  }

  insertInWishListTable({
    required String? index,
    required String? title,
    required String? releaseDate,
    required dynamic voteRate,
    required String? overView,
  }) {
    database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO wishList (name,releaseDate,voteRate,overView,idx) VALUES ("$title","$releaseDate","$voteRate","$overView","$index")')
          .then((value) {
        getWishListData(database!);
        emit(InsertInWishListSuccess());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(InsertInWishListError());
      });
    });
  }

  getWishListData(Database database) {
    emit(GetWishListDataLoading());
    return database.rawQuery('SELECT * FROM wishList').then((value) {
      wishList = value.map((e) => WishListModel.fromMap(e)).toList();
      emit(GetWishListDataSuccess());
    }).catchError((error) {
      debugPrint(error);
      emit(GetWishListDataError());
    });
  }

  deleteFromWishListTable({
    required String? title,
  }) async {
    database!.rawDelete('DELETE FROM wishList WHERE name = ?', [title]).then(
        (value) {
      getWishListData(database!);
      emit(DeleteFromWishListSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(DeleteFromWishListError());
    });
  }
}
