import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/constance/string.dart';
import 'package:movies/models/top_rated_model.dart';
import 'package:movies/models/up_coming_model.dart';
import 'package:movies/models/videos_model.dart';
import 'package:movies/services/dio_helper.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite_common/sqlite_api.dart';
import 'package:movies/models/popular_model.dart';
import 'package:movies/models/wish_list_model.dart';
part 'main_cubit_state.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainCubitInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  Database? database;
  PopularModel? popularModel;
  List<WishListModel> wishList = [];

  bool isReadMore = true;
  bool changeFaVIcon = true;

  changeIcon() {
    changeFaVIcon = !changeFaVIcon;
    emit(ChangeFavIconSuccess());
  }

  readMore() {
    isReadMore = !isReadMore;
    emit(ChangeReadMore());
  }

  getPopularData() {
    emit(GetPopularDataLoading());
    DioHelper.getData(url: popularUri).then((value) {
      popularModel = PopularModel.fromJson(value.data!);
      emit(GetPopularDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPopularDataError());
    });
  }

  TopRatedModel? topRated;

  getTopRatedData() {
    emit(GetTopRatedDataLoading());
    DioHelper.getData(url: topRatedUri).then((value) {
      topRated = TopRatedModel.fromJson(value.data);
      emit(GetTopRatedDataSuccess());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetTopRatedDataError());
    });
  }

  UpComing? upComing;

  getUpComingData() {
    emit(GetUpComingDataLoading());
    DioHelper.getData(url: upComingUri).then((value) {
      upComing = UpComing.fromJson(value.data);
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
}
