/* 特定のレコードをコピーして、一部編集して、あらたなレコードとして挿入するクエリ */

-- テンポラリテーブルにコピー元データを格納.
CREATE TEMPORARY TABLE tmp 
  SELECT * FROM main_table 
  WHERE id BETWEEN 1 AND 3;

-- id付与.
SELECT @id:= 
  (SELECT MAX(id) + 1 FROM main_table);

UPDATE tmp SET id = @id:=@id+1;

-- データの編集.
UPDATE tmp 
  SET dpt_id = 3,
      ymd = CURRENT_DATE;

-- 元のテーブルにデータを挿入.
INSERT INTO main_table 
  SELECT * FROM tmp;

-- テンポラリテーブル削除.
DROP TABLE tmp;
