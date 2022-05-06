import os
import logging

from fastapi import APIRouter, HTTPException
from requests import request
from dotenv import load_dotenv

ai = APIRouter()


@ai.get(
    "/api/ai/sentiment",
    tags=["aiSentiment"],
    description="Get a object of ai sentiment",
)
def get_sentiment(coin: str):
    load_dotenv()

    return data


@ai.get(
    "/api/ai/analysis",
    tags=["aiAnalysis"],
    description="Get a object of ai analysis",
)
def get_analysis(coin: str):
    load_dotenv()

    return data
