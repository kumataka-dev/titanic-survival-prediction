# Notebook

2つに分かれている。役割が違うので混ぜない。

| ディレクトリ | 中身 | 詳細 |
| --- | --- | --- |
| [tutorial/](tutorial/) | 一通りの流れをなぞった写経部分。**まずこれを読む** | [tutorial/README.md](tutorial/README.md) |
| [experiments/](experiments/) | 精度を上げるために自分で試したこと | [experiments/README.md](experiments/README.md) |

`tutorial/` は「型を覚えるための教科書」。`experiments/` は「そこから先の自分の検証」。
分けているのは、**どこまでが型どおりで、どこからが自分の判断なのか**を
後から区別できるようにするため。

## 実行する前に

リポジトリのルートで `make init` を実行し、`data/raw/` に
`train.csv` / `test.csv` / `sample_submit.csv` を置いておく。
置き場所と項目の説明は [data/README.md](../data/README.md) にある。

カーネル（コードを動かす Python）には `.venv` のものを選ぶ。

## 知っておくと困らないこと

**Notebook は1つずつ別々に動く。**
前の Notebook で読み込んだ `train` を、次の Notebook から使うことはできない。
だから各 Notebook は、冒頭で必要なデータを自分で読み込んでいる。
同じ `read_csv` が何度も出てくるのはこのため。

**次の Notebook へはファイル経由で渡す。**
加工後のデータや予測は `data/processed/` に保存し、後の Notebook がそれを読む。

**データを読むパスは `../../data/`。**
Notebook が `notebooks/` の1つ下にあるので、2つ上がってから `data/` に入る。

**実行結果は git に残らない。**
nbstripout という道具が、コミットするときに出力を取り除く。
画面では結果を見ながら作業できるが、記録されるのはコードだけ。
結果を残したい場合は、数字をファイルに書き出すか、文章として書いておく。

**`data/` の中身は git 管理外。**
競技のデータは配り直してはいけない決まりなので、
加工後のものも提出ファイルも記録しない。
消してしまっても `tutorial/03` から順に実行すれば作り直せる。

## つまずいたとき

| 症状 | 原因と対処 |
| --- | --- |
| `FileNotFoundError` で CSV が無いと言われる | `data/raw/` にデータを置いていない。前の番号の Notebook を実行していない。またはパスが `../data/` になっている（正しくは `../../data/`） |
| `ModuleNotFoundError: pandas` | カーネルが `.venv` 以外の Python になっている。右上のカーネル名から `.venv` を選ぶ。それでも出るならルートで `make init` |
| `partially initialized module 'pandas'` | カーネルが壊れた状態のまま。**カーネルを再起動**して上から実行し直す（`make` を実行しても直らない） |
| 保存先のディレクトリが無いと言われる | ルートで `make init` を実行する |

## 番号の付け方

`<連番>_<内容>.ipynb`。連番は実行順で、前の番号の結果を使ってよい。
内容が変わったらファイル名も変える。
