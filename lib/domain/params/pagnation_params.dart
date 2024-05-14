// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class PagnationParams extends Equatable {
  final int page;
  final int offset;
  final int limit;

  const PagnationParams({required this.page, required this.offset, required this.limit});
  
  @override
  List<Object?> get props => [
    page,
    offset,
    limit
  ];

  PagnationParams copyWith({
    int? page,
    int? offset,
    int? limit,
  }) {
    return PagnationParams(
      page: page ?? this.page,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
    );
  }
}
