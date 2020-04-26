      *** 基本
      ** 列・カラム
      *     1- 6列目 一連番号領域
      *      自動的に連番が振られる領域
      *      無視される
      *     7   列目 標識領域
      *      *  コメント行
      *      -  連続行
      *     8-11列目 A領域
      *      部・節・段落
      *    12-72列目 B領域
      *      ピリオドを含むプログラム本文
      *    73-80列目 B領域
      *      コメント列
      *      無視される
      *8901234567890123456789012345678901234567890123456789012345678901234567890
      *    *************************************************************
      ** 文字種・記号
      *    半角英数（a-zA-Z0-9）
      *    カナ・漢字・空白
      *    特殊文字（+-*/=\,;."()><:）

      *** 見出し部
       IDENTIFICATION  DIVISION.

      * プログラム名
       PROGRAM-ID.     SYNTAX.


      *** 環境部
       ENVIRONMENT     DIVISION.


      *** データ部
       DATA            DIVISION.
      ** 作業場所節
       WORKING-STORAGE SECTION.
      * 利用者定義語
      *   平たくいえば定数・変数定義
      *       01      項目レベル
      *               HTMLの見出しみたいに大きい数字ほど細かい項目
      *               奇数で書いておいて付け足したい時に間を使う
      *       CNT     任意の名称
      *               英数字・ハイフン（先頭・末尾以外）
      *               30文字以内
      *       PIC     PICTURE句
      *               必須の決まり文句
      *       9(3)    ＝3桁の数字
      *               9   数字
      *               X   英字
      *               N   日本語
      *       VALUE 0 初期値設定
       01 CNT PIC 9(3) VALUE 0.

       01 UPPERCASE PIC X(26) VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".

       01 SYSTEM-TIME PIC 9(8).
       01 STV PIC 9(8).
       01 STR PIC 9(8).

       01 ANSER PIC 9(3) VALUE 0.

      * 独立・集団・基本項目
       01 DOG.
           03 REGI-NUM     PIC 9(6)    VALUE 123456.
           03 NAME         PIC  N(30)  VALUE "ぽち".
           03 BIRTHDAY.
               05 YEAR      PIC 9999  VALUE 2020.
               05 MONTH     PIC 99    VALUE 04.
               05 DT        PIC 99    VALUE 07.

      * 表意定数（最小値・最高値）
       01  LV  PIC X(5).
       01  LVS PIC X(5).
       01  HV  PIC X(5).
       01  HVS PIC X(5).

      * 表意定数（ALL）
       01 ALL-VAL PIC X(5).

      *** 手続き部
       PROCEDURE       DIVISION.
      *    画面に文字列を表示する
           DISPLAY "Coding Style & Syntax".

      *    部分参照
           DISPLAY "--- 部分参照 ---".
           DISPLAY UPPERCASE.
           DISPLAY UPPERCASE (6:13).

      *    ループ・繰り返し処理
           DISPLAY "--- ループ・繰り返し処理 ---".
           MOVE 0 TO CNT
           PERFORM 10 TIMES
               ADD 1 TO CNT
               DISPLAY "COUNT = " CNT
           END-PERFORM

           MOVE 0 TO CNT
           PERFORM UNTIL 2 < CNT
               ADD 1 TO CNT
               DISPLAY "UNTIL: " CNT
           END-PERFORM

      *    条件分岐
           DISPLAY "--- 条件分岐 ---".
           ACCEPT SYSTEM-TIME FROM TIME.
           DIVIDE 2 INTO SYSTEM-TIME GIVING STV REMAINDER STR.
           DISPLAY SYSTEM-TIME
           DISPLAY STV "..." STR
           IF STR = 1
               THEN
                   DISPLAY "Odd number"
               ELSE
                   DISPLAY "Even number"
           END-IF

      *    集団項目の表示
           DISPLAY "--- 集団項目の表示 ---".
           DISPLAY DOG
           DISPLAY DT IN DOG

      ***  表意定数
      *      表記方法が複数ある場合は、文脈に合わせて書けるだけで同じもの
           DISPLAY "--- 表意定数 ---".

      *    0
           DISPLAY ZERO.
           DISPLAY ZEROS.
           DISPLAY ZEROES.

      *    スペース
           DISPLAY SPACE.
           DISPLAY SPACES.

      *    ダブルクオーテーション
           DISPLAY QUOTE.
           DISPLAY QUOTES.

      *    最小値・最高値
      *      表示不可
      *      計算時の比較対象に利用する
           MOVE LOW-VALUE   TO LV.
           MOVE LOW-VALUES  TO LVS.
           MOVE HIGH-VALUES TO HV.
           MOVE HIGH-VALUES TO HVS.

      *    ALL
           MOVE ALL "X" TO ALL-VAL.
           DISPLAY ALL-VAL.

      ***  計算処理
           DISPLAY "--- 計算処理 ---".
           COMPUTE ANSER = 300 + 200
           DISPLAY ANSER
           COMPUTE ANSER = 400 - 150
           DISPLAY ANSER

           STOP   RUN.
