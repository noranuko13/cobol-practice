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

      * 独立・集団・基本項目
       01 DOG.
           03 REGI-NUM     PIC 9(6)    VALUE 123456.
           03 NAME         PIC  N(30)  VALUE "ぽち".
           03 BIRTHDAY.
               05 YEAR      PIC 9999  VALUE 2020.
               05 MONTH     PIC 99    VALUE 04.
               05 DT        PIC 99    VALUE 07.


      *** 手続き部
       PROCEDURE       DIVISION.
      *    画面に文字列を表示する
           DISPLAY "Coding Style & Syntax".

      *    ループ・繰り返し処理
           PERFORM 10 TIMES
               ADD 1 TO CNT
               DISPLAY "COUNT = " CNT
           END-PERFORM

      *    集団項目の表示
           DISPLAY DOG
           DISPLAY DT IN DOG

           STOP   RUN.
