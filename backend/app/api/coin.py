import os
import logging

coin = APIRouter()


@coin.get(
    "/api/coin/news",
    tags=["coinNews"],
    description="Get a list of all codes",
)
def get_codes():
    load_dotenv()

    
    return data


@coin.get(
    "/api/coin/schedule",
    tags=["coinSchedule"],
    description="Get a list of all schedule",
)
def get_schedule():
    
    return list


@coin.get(
    "/api/coin/trends",
    tags=["coinTrends"],
    description="Get a list of all trends",
)
def get_trends():
    load_dotenv()

    return data
