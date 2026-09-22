# Notebook 一覧

タイタニック号の乗客名簿から、誰が生き残ったかを言い当てるまでの手順を、
段階ごとに分けたもの。**番号順に実行する。**

| Notebook | やること | 読み込み | 書き出し |
| --- | --- | --- | --- |
| [01_overview.ipynb](01_overview.ipynb) | データを読み込み、項目と空いている場所を確認する | `data/raw/` | — |
| [02_analysis.ipynb](02_analysis.ipynb) | どんな人が生き残ったかを調べる | `data/raw/` | — |
| [03_preprocess.ipynb](03_preprocess.ipynb) | 空いている場所を埋め、文字を数字に置き換える | `data/raw/` | `data/processed/` |
| [04_model.ipynb](04_model.ipynb) | 予測する仕組みを作り、生存確率を出す | `data/processed/` | `data/processed/` |
| [05_submit.ipynb](05_submit.ipynb) | 予測を投稿できる形に整える | `data/processed/` | `data/submissions/` |

## 実行する前に

リポジトリのルートで `make init` を実行し、`data/raw/` に
`train.csv` / `test.csv` / `sample_submit.csv` を置いておく。
置き場所と項目の説明は [data/README.md](../data/README.md) にある。

カーネル（コードを動かす Python）には `.venv` のものを選ぶ。

## 知っておくと困らないこと

**Notebook は1つずつ別々に動く。**
01 で読み込んだ `train` を 02 から使うことはできない。
だから各 Notebook は、冒頭で必要なデータを自分で読み込んでいる。
同じ `read_csv` が何度も出てくるのはこのため。

**次の Notebook へはファイル経由で渡す。**
03 が作った加工後のデータと、04 が出した予測は `data/processed/` に保存され、
後の Notebook がそれを読む。

**実行結果は git に残らない。**
nbstripout という道具が、コミットするときに出力を取り除く。
画面では結果を見ながら作業できるが、記録されるのはコードだけ。

**`data/` の中身は git 管理外。**
競技のデータは配り直してはいけない決まりなので、
加工後のものも提出ファイルも記録しない。
`data/processed/` を消してしまっても、03 から順に実行すれば作り直せる。

## つまずいたとき

| 症状 | 原因と対処 |
| --- | --- |
| `FileNotFoundError` で CSV が無いと言われる | `data/raw/` にデータを置いていない。または前の番号の Notebook を実行していない |
| `ModuleNotFoundError: pandas` | カーネルが `.venv` 以外の Python になっている。右上のカーネル名から `.venv` を選ぶ。それでも出るならルートで `make init` |
| `partially initialized module 'pandas'` | カーネルが壊れた状態のまま。**カーネルを再起動**して上から実行し直す（`make` を実行しても直らない） |
| 保存先のディレクトリが無いと言われる | ルートで `make init` を実行する |

## 番号の付け方

`<連番>_<内容>.ipynb`。連番は実行順で、前の番号の結果を使ってよい。
内容が変わったらファイル名も変える。
