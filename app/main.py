import asyncio

from fastapi import FastAPI
from fastapi.responses import StreamingResponse

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


async def dummy_streamer():
    for i in range(10):
        yield f"Hello {i}\n"
        await asyncio.sleep(0.5)


@app.get("/items")
async def read_item():
    return StreamingResponse(dummy_streamer())
