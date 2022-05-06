
import os
import uvicorn
from dotenv import load_dotenv

if __name__ == "__main__":
  load_dotenv()
  
  if os.environ.get("RUN_MODE") == "DEBUG":
    uvicorn.run("app.root:app", host="0.0.0.0", port=8000, reload=True, debug=True)
  else:
    uvicorn.run("app.root:app", host="0.0.0.0", port=8000, reload=True)    
