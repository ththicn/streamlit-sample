# ベースイメージとして公式のPythonイメージを使用
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /app

# 必要なパッケージをインストール
RUN pip install --no-cache-dir streamlit

# アプリケーションのコードをコピー
COPY . .

# 環境変数を設定
ENV PORT=8080

# Streamlitの設定
ENV STREAMLIT_SERVER_HEADLESS=true
ENV STREAMLIT_SERVER_PORT=8080
ENV STREAMLIT_SERVER_ENABLE_CORS=false
ENV STREAMLIT_SERVER_ADDRESS=0.0.0.0

# コンテナ起動時に実行されるコマンド
CMD ["streamlit", "run", "app.py"]
