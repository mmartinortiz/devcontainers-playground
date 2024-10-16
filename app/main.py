import os

import uvicorn
from fastapi import FastAPI

from app import __version__

app = FastAPI()


@app.get("/version")
def read_version():
    return {"version": __version__}


@app.get("/secret")
def read_secret():
    return {"secret": os.getenv("SECRET", "")}


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
