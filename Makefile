.DEFAULT_GOAL := init

.PHONY: init clean

init: ## 開発環境をセットアップする
	@echo "開発環境をセットアップします。"
	@echo "  1. パッケージを .venv に入れる"
	@echo "  2. Notebook の実行結果を git に保存しないための設定をする"
	@echo "  3. データ用のディレクトリを用意する"
	@echo "  4. 準備が整ったか確認する"
	@echo ""
	@echo "[1/4] パッケージを入れています..."
	@uv sync --quiet
	@echo "[2/4] Notebook のフィルタを設定しています..."
	@uv run --quiet nbstripout --install --attributes .gitattributes
	@git config filter.nbstripout.extrakeys "metadata.language_info.version"
	@echo "[3/4] データ用のディレクトリを用意しています..."
	@# 中身が gitignore されるため git は空のこれらを復元できない。
	@# 無いまま Notebook を実行すると保存時に落ちるので、ここで作る。
	@mkdir -p data/raw data/processed
	@echo "[4/4] 確認しています..."
	@uv run --quiet python -c "import pandas; print('      pandas', pandas.__version__, 'を確認')"
	@test -f data/raw/train.csv \
		&& echo "      データ: 配置済み" \
		|| echo "      データ: 未配置 → data/README.md のリンク先から train.csv / test.csv / sample_submit.csv を data/raw/ に置いてください"
	@echo ""
	@echo "セットアップが完了しました。"

clean: ## 仮想環境とキャッシュを削除する
	@echo "仮想環境（.venv）とキャッシュ（__pycache__）を削除します。"
	@echo "元に戻すには make init を実行してください。"
	@echo ""
	@rm -rf .venv
	@find . -type d -name __pycache__ -exec rm -rf {} +
	@echo "削除しました。"
