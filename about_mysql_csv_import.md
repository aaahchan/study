# MySQLにCSVインポートする件
MySQLコマンドでCSVインポートができる。

## 前提条件
my.cnfにて、ファイルを読み書きするフォルダが設定されている必要がある。
設定がされている場合、@@global.secure_file_privという変数に値が入っている。
NULLの場合はインポートできない。空文字の場合は、どのフォルダでも読み書きできる。

```
mysql> select @@global.secure_file_priv;
+---------------------------+
| @@global.secure_file_priv |
+---------------------------+
|                           |
+---------------------------+
```

設定されていない場合は、my.cnfに以下を書き足し、mysqlを再起動。（ローカルサーバの場合、空文字でおk↓）

```
secure-file-priv = ""
```

CSVインポートのコマンドは以下の通り。
```
load data infile '/var/lib/mysql-files/data.csv' into table `data` fields terminated by ',' enclosed by '"' lines terminated by  '\r\n' ignore 1 lines;
```
