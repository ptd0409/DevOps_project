from fastapi import FastAPI
from routers import hello

app = FastAPI(
    title="Simple FastAPI App",
    description="This is a minimal FastAPI app by Dung Pham",
    version="1.0.0"
)

app.include_router(hello.router)
