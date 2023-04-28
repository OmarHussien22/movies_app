part of 'home_layout_cubit.dart';

abstract class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {}

class BottomNavBarchangeState extends HomeLayoutState {}

class ChangeThemeModeState extends HomeLayoutState {}

class GetPopularDataLoading extends HomeLayoutState {}

class GetPopularDataSuccess extends HomeLayoutState {}

class GetPopularDataError extends HomeLayoutState {}

class GetTopRatedDataLoading extends HomeLayoutState {}

class GetTopRatedDataSuccess extends HomeLayoutState {}

class GetTopRatedDataError extends HomeLayoutState {}

class GetUpComingDataLoading extends HomeLayoutState {}

class GetUpComingDataSuccess extends HomeLayoutState {}

class GetUpComingDataError extends HomeLayoutState {}

class ChangeReadMore extends HomeLayoutState {}

class OnCreateDatabaseLoading extends HomeLayoutState {}

class OnCreateDatabaseSuccess extends HomeLayoutState {}

class OnCreateDatabaseError extends HomeLayoutState {}

class InsertInWishListSuccess extends HomeLayoutState {}

class InsertInWishListError extends HomeLayoutState {}

class GetWishListDataLoading extends HomeLayoutState {}

class GetWishListDataSuccess extends HomeLayoutState {}

class GetWishListDataError extends HomeLayoutState {}

class OnOpenDatabaseLoading extends HomeLayoutState {}

class DeleteFromWishListSuccess extends HomeLayoutState {}

class DeleteFromWishListError extends HomeLayoutState {}

class ChangeFavIconPopularSuccess extends HomeLayoutState {}

class ChangeFavIconTopRatedSuccess extends HomeLayoutState {}

class ChangeFavIconUpComingSuccess extends HomeLayoutState {}

class GetPopularVideosLoadingState extends HomeLayoutState {}

class GetPopularVideosSuccessState extends HomeLayoutState {}

class GetPopularVideosErrorState extends HomeLayoutState {}
