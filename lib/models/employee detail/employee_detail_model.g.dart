// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmployeeDetailModelAdapter extends TypeAdapter<EmployeeDetailModel> {
  @override
  final int typeId = 1;

  @override
  EmployeeDetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmployeeDetailModel(
      employeeID: fields[0] as String,
      fullName: fields[1] as String,
      job: fields[2] as String,
      startDate: fields[3] as DateTime,
      endDate: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, EmployeeDetailModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.employeeID)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.job)
      ..writeByte(3)
      ..write(obj.startDate)
      ..writeByte(4)
      ..write(obj.endDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmployeeDetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
