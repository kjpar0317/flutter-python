from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.coin import coin
from app.api.ai import ai

app = FastAPI()

origins = [
    "http://localhost:3000",
    "https://10.0.2.2:3000",
    "localhost:3000",
    "10.0.2.2:3000"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    # allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

# sub api 연결
app.include_router(coin)
app.include_router(ai)
