# Notebook 一覧

タイタニック号の乗客データから生存を予測するまでの手順を、段階ごとに分けたもの。
番号順に実行する。

| Notebook | やること | 読み込み | 書き出し |
| --- | --- | --- | --- |
| [01_overview.ipynb](01_overview.ipynb) | データを読み込み、列と欠損を確認する | `data/raw/` | — |
| [02_analysis.ipynb](02_analysis.ipynb) | どんな属性の人が生き残ったかを調べる | `data/raw/` | — |
| [03_preprocess.ipynb](03_preprocess.ipynb) | 欠損を埋め、文字列を数値に変換する | `data/raw/` | `data/processed/` |
| [04_model.ipynb](04_model.ipynb) | モデルを学習し、生存確率を予測する | `data/processed/` | `data/processed/` |
| [05_submit.ipynb](05_submit.ipynb) | 予測を投稿できる形式に整える | `data/processed/` | `data/submissions/` |

## 実行する前に

リポジトリのルートで `make init` を実行し、`data/raw/` に
`train.csv` / `test.csv` / `sample_submit.csv` を置いておく。
置き場所と列の説明は [data/README.md](../data/README.md) にある。

カーネルには `.venv` の Python を選ぶ。

## 知っておくと困らないこと

**Notebook ごとにカーネルは独立している。**
01 で読み込んだ `train` を 02 から使うことはできない。各 Notebook は冒頭で
必要なデータを自分で読み込む。同じ `read_csv` が繰り返し出てくるのはこのため。

**次の Notebook に渡すデータは CSV 経由。**
03 が作った加工後データと 04 が出した予測は `data/processed/` に保存され、
後続がそれを読む。

**実行結果は git に保存されない。**
nbstripout が commit 時に出力を取り除くので、画面上では結果を見ながら作業でき、
記録されるのはコードだけになる。実行結果を残したい場合は別の形で書き出す。

**`data/` の中身は git 管理外。**
競技規約によりデータを再配布できないため、加工後のものも提出ファイルも除外している。
`data/processed/` を消してしまっても、03 を実行し直せば作り直せる。

## 番号の付け方

`<連番>_<内容>.ipynb`。連番は実行順で、前の番号の結果に依存してよい。
内容が変わったらファイル名も変える。
