// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 1;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      id: fields[1] as int?,
      question: fields[2] as String?,
      selectedAnswer: fields[3] as String?,
      answers: fields[4] as Answers?,
      correctAnswers: fields[5] as CorrectAnswers?,
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.question)
      ..writeByte(3)
      ..write(obj.selectedAnswer)
      ..writeByte(4)
      ..write(obj.answers)
      ..writeByte(5)
      ..write(obj.correctAnswers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AnswersAdapter extends TypeAdapter<Answers> {
  @override
  final int typeId = 2;

  @override
  Answers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Answers(
      answerA: fields[1] as String?,
      answerB: fields[2] as String?,
      answerC: fields[3] as String?,
      answerD: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Answers obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.answerA)
      ..writeByte(2)
      ..write(obj.answerB)
      ..writeByte(3)
      ..write(obj.answerC)
      ..writeByte(4)
      ..write(obj.answerD);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CorrectAnswersAdapter extends TypeAdapter<CorrectAnswers> {
  @override
  final int typeId = 3;

  @override
  CorrectAnswers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CorrectAnswers(
      answerACorrect: fields[1] as bool?,
      answerBCorrect: fields[2] as bool?,
      answerCCorrect: fields[3] as bool?,
      answerDCorrect: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, CorrectAnswers obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.answerACorrect)
      ..writeByte(2)
      ..write(obj.answerBCorrect)
      ..writeByte(3)
      ..write(obj.answerCCorrect)
      ..writeByte(4)
      ..write(obj.answerDCorrect);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CorrectAnswersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
