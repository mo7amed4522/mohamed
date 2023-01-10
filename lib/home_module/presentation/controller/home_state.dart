part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}


class HomeInitialState extends HomeState {}

class RegionLoadingState extends HomeState {}

class RegionSuccessState extends HomeState {}

class RegionErrorState extends HomeState {}

class InsertRegionLoadingState extends HomeState {}

class InsertRegionSuccessState extends HomeState {}

class InsertRegionErrorState extends HomeState {}

class DeleteRegionSuccessState extends HomeState {}

class DeleteRegionErrorState extends HomeState {}

class PlaceLoadingState extends HomeState {}

class PlaceSuccessState extends HomeState {}

class PlaceErrorState extends HomeState {}

class InsertPlaceLoadingState extends HomeState {}

class InsertPlaceSuccessState extends HomeState {}

class InsertPlaceErrorState extends HomeState {}

class DeletePlaceSuccessState extends HomeState {}

class DeletePlaceErrorState extends HomeState {}

class OccupationLoadingState extends HomeState {}

class OccupationSuccessState extends HomeState {}

class OccupationErrorState extends HomeState {}

class InsertOccupationLoadingState extends HomeState {}

class InsertOccupationSuccessState extends HomeState {}

class InsertOccupationErrorState extends HomeState {}

class UpdateOccupationLoadingState extends HomeState {}

class UpdateOccupationSuccessState extends HomeState {}

class UpdateOccupationErrorState extends HomeState {}

class DeleteOccupationSuccessState extends HomeState {}

class DeleteOccupationErrorState extends HomeState {}

class InsertFileLoadingState extends HomeState {}

class InsertFileSuccessState extends HomeState {}

class InsertFileErrorState extends HomeState {}

class ChangeRadioBoxState extends HomeState {}

class FilesDataLoadingState extends HomeState {}

class FilesDataSuccessState extends HomeState {}

class FilesDataErrorState extends HomeState {}

class SearchLoadingState extends HomeState {}

class SearchSuccessState extends HomeState {}

class SearchErrorState extends HomeState {}

class GetFileLoadingState extends HomeState {}

class GetFileSuccessState extends HomeState {}

class GetFileErrorState extends HomeState {}

class DeleteFileLoadingState extends HomeState {}

class DeleteFileSuccessState extends HomeState {}

class DeleteFileErrorState extends HomeState {}

class GoToFolderLoadingState extends HomeState {}

class GoToFolderSuccessState extends HomeState {}

class GoToFolderErrorState extends HomeState {}

class UpdateFileLoadingState extends HomeState {}

class UpdateFileSuccessState extends HomeState {}

class UpdateFileErrorState extends HomeState {}

class UploadFileLoadingState extends HomeState {}

class UploadFileSuccessState extends HomeState {}

class UploadFileErrorState extends HomeState {}

class GetFillFilledLoadingState extends HomeState {}

class GetFillFilledSuccessState extends HomeState {}

class GetFillFilledErrorState extends HomeState {}

class GetUnFillFilledLoadingState extends HomeState {}

class GetUnFillFilledSuccessState extends HomeState {}

class GetUnFillFilledErrorState extends HomeState {}
