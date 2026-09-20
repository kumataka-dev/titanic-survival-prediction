# データ仕様

SIGNATE 練習問題「タイタニックの生存予測」の[データ仕様](https://user.competition.signate.jp/ja/competition/detail/?competition=0b3a60127b31462d9a8866ef7e66f7f2&task=7c4145a386ef4f3ab837d5d0f332b109&tab=dataset)。

## train.csv（学習用データ / 12.63 KB）

| カラム | ヘッダ名称 | データ型 | 説明 |
| --- | --- | --- | --- |
| 0 | id | int | インデックスとして使用 |
| 1 | survived | boolean | 生還結果（1=生還, 0=死亡） |
| 2 | pclass | int | 客室のクラス（1,2,3の順に高級クラス） |
| 3 | sex | char | 性別 |
| 4 | age | int | 年齢 |
| 5 | sibsp | int | 乗船していた兄弟、配偶者の数 |
| 6 | parch | int | 乗船していた両親、子供の数 |
| 7 | fare | float | 運賃 |
| 8 | embarked | char | 乗船した港（S=Southampton, C=Cherbourg, Q=Queenstown） |

## test.csv（評価用データ / 11.77 KB）

| カラム | ヘッダ名称 | データ型 | 説明 |
| --- | --- | --- | --- |
| 0 | id | int | インデックスとして使用 |
| 1 | pclass | int | 客室のクラス（1,2,3の順に高級クラス） |
| 2 | sex | char | 性別 |
| 3 | age | int | 年齢 |
| 4 | sibsp | int | 乗船していた兄弟、配偶者の数 |
| 5 | parch | int | 乗船していた両親、子供の数 |
| 6 | fare | float | 運賃 |
| 7 | embarked | char | 乗船した港（S=Southampton, C=Cherbourg, Q=Queenstown） |

## sample_submit.csv（応募用サンプルファイル / 2.99 KB）

サンプルの予測結果が入力された投稿用ファイルのフォーマット。

| カラム | ヘッダ名称 | データ型 | 説明 |
| --- | --- | --- | --- |
| 0 | 無し | int | インデックスとして使用 |
| 1 | 無し | float | 予測した生存確率（0.0〜1.0） |

## 投稿方法

応募用サンプルファイルのフォーマットに倣い、1列目に評価用データの "id" を、
2列目に予測した "生存確率" を記入したファイルを作成し、ヘッダ無しの csv 形式で投稿する。
