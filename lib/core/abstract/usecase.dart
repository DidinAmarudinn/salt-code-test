
import 'package:equatable/equatable.dart';
import 'package:salt_code_test/core/helper/type_defs.dart';

abstract class Usecase<Type, Params> {
  FutureEither<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];

}