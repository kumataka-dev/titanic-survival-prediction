# タイタニック 生存予測

SIGNATE 練習問題「[タイタニックの生存予測](https://user.competition.signate.jp/ja/competition/detail/?competition=0b3a60127b31462d9a8866ef7e66f7f2&task=7c4145a386ef4f3ab837d5d0f332b109)」に、
ローカル環境だけで取り組む学習用リポジトリ。

乗客の属性（性別・客室クラス・年齢など）から、その人が助かったかどうかを予測する。

## セットアップ

Python の実行環境には [uv](https://docs.astral.sh/uv/) を使う。未インストールなら先に入れる。

```bash
brew install uv
```

クローン後、次のコマンドだけ実行すれば環境が整う。

```bash
make init
```

`make init` がやること:

- `uv sync` — `uv.lock` に記録されたバージョンのパッケージを `.venv` に入れる
- `nbstripout` の git フィルタを設定 — Notebook をコミットするとき、実行結果を自動で取り除く
- `data/raw/` と `data/processed/` を作成 — 中身は git 管理外なので、クローンしただけでは存在しない
- 確認 — pandas が入っているか、`data/raw/` に CSV が置かれているかを表示

## データの配置

データは競技規約により再配布できないため、git 管理していない。各自でダウンロードする。

1. [コンペのデータページ](https://user.competition.signate.jp/ja/competition/detail/?competition=0b3a60127b31462d9a8866ef7e66f7f2&task=7c4145a386ef4f3ab837d5d0f332b109&tab=dataset)から
   `train.csv` / `test.csv` / `sample_submit.csv` をダウンロードする
2. `data/raw/` に置く

列の説明は [data/README.md](data/README.md) にある。

## コマンド

```bash
make init    # セットアップ（引数なしの make でも同じ）
make clean   # 仮想環境とキャッシュを削除
```

## ディレクトリ構成

```
.
├── data/
│   ├── raw/       ダウンロードした元データ（触らない）
│   ├── processed/ Notebook が生成した加工後データ（作り直せる）
│   └── README.md  列の説明
├── notebooks/     分析・モデリング用の Jupyter Notebook
├── .claude/       Claude Code 用のスキル
├── Makefile
└── pyproject.toml
```

## メモ

- Notebook の実行結果は nbstripout により git に保存されない。
  画面上では普通に結果を見ながら作業できるが、コミットされるのはコードだけ。
- 提出ファイルは `sample_submit.csv` と同じ形式（ヘッダ無し、1 列目に `id`、2 列目に予測）にする。
