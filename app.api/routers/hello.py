from fastapi import APIRouter

router = APIRouter()

@router.get("/", tags=["Root"])
def read_root():
    return {"message": "Hello from Pham Tien Dung"}

@router.get("/greet/{name}", tags=["Greetings"])
def greet_user(name: str):
    return {"message": f"Nice to meet you, {name}!"}
