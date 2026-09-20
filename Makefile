.DEFAULT_GOAL := init

.PHONY: init clean

init: ## 開発環境をセットアップする
	@echo "開発環境をセットアップします。"
	@echo "  1. パッケージを .venv に入れる"
	@echo "  2. Notebook の実行結果を git に保存しないための設定をする"
	@echo "  3. 準備が整ったか確認する"
	@echo ""
	@echo "[1/3] パッケージを入れています..."
	@uv sync --quiet
	@echo "[2/3] Notebook のフィルタを設定しています..."
	@uv run --quiet nbstripout --install --attributes .gitattributes
	@git config filter.nbstripout.extrakeys "metadata.language_info.version"
	@echo "[3/3] 確認しています..."
	@uv run --quiet python -c "import pandas; print('      pandas', pandas.__version__, 'を確認')"
	@test -f data/train.csv \
		&& echo "      データ: 配置済み" \
		|| echo "      データ: 未配置 → data/README.md のリンク先から train.csv / test.csv / sample_submit.csv を data/ に置いてください"
	@echo ""
	@echo "セットアップが完了しました。"

clean: ## 仮想環境とキャッシュを削除する
	@echo "仮想環境（.venv）とキャッシュ（__pycache__）を削除します。"
	@echo "元に戻すには make init を実行してください。"
	@echo ""
	@rm -rf .venv
	@find . -type d -name __pycache__ -exec rm -rf {} +
	@echo "削除しました。"
