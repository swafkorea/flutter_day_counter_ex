# 만난지 며칠 U&I

플러터 강좌 실습

## 강좌와 다르게 구현한 내용

- flutter lint 경고가 표시되는 부분들을 처리하여 해결
  - 대부분 `const` 키워드를 사용함.
- `showCupertinoDialog` 대신 `showDialog`를 사용해봄.
  - 동작 형태는 특별히 다른것은 모르겠고 `showDialog` 경우는 `barrierDismissible`의 기본값으로 `true`를 가진다.
- theme 코드만 다른 파일로 분리 : `theme.dart`
- day count 계산하기 위한 getter 사용

  ```dart
  String get days {
    final diff = DateTime(now.year, now.month, now.day).difference(selectedDate).inDays;
    return diff == 0 ? ' Day' : diff.toString();
  }
  ```

  ```dart
  Text(
    'D$days',
  )
  ```

- selectedDate를 화면에 출력할때 `intl` package를 사용

  ```yaml
  dependencies:
    # ....
    intl: ^0.17.0
  ```

  ```dart
  Text(
    DateFormat('yyyy.MM.dd').format(selectedDate),
  ),
  ```
- _TopPart에 `onPressed` 이벤트가 아니라 `CupertinoDatePicker`의 `onDateTimeChanged`이벤트의 콜백함수를 파라미터로 전달.
- 미래 날짜에 대한 카운트이기 때문에 `CupertinoDatePicker.minimumDate` 속성을 설정함.
- 기타 : 색깔, 변수 및 파일명 ... 