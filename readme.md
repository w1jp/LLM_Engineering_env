# LLM Engineering Course
The course is based on an anaconda image. I do not like global things as I do many projects and it conflicts with existing enviornments. So I have elected to use a docker image for the course. I have noticed that many people have had issues with the enviornment so I am sharing it for others to use as well. This approach will work on any operating system that docker runs on.

## Prerequisits
 - This assumes that you already have docker installed. There are many options for you to do that and I'll leave it to you to pick a method. 
 - This also assumes that you have the course material cloned and that the `environment.yml` file is in the `llm_engineering` directory under your poject root (Where you cloned the course material).

 ## Installation
 Clone this repo in your project root (same place you cloned the [course material](https://github.com/ed-donner/llm_engineering)).

 ## Instructions
  1. In the project root directory, build this image:
      ```bash
      docker build -f LLM_Engineering_env/Dockerfile -t llm_anaconda .
      ```
  2. Run the image:
      ```bash
      docker run --name llm_anaconda_env -it --rm -p 8888:8888 -p 7860-7899:7860-7899 -v $PWD:/wrk llm_anaconda
      ```
  3. You should now be at a bash prompt. To start Jupyter Lab:
      ```bash
      jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --notebook-dir=/wrk
      ```

This will start the jupyter environment. It will give you a URL with a token to use to access Jupyter in your browswer. I also put the root project folder and places that in the docker image. If you make changes in Jupyter, those changes will also be in your local files. 

If you need a terminal in the environment (e.g., to install a python package or edit the .env):
    ```bash
    docker exec -it llm_anaconda_env bash
    ```
## Gardio
I have added gradio.app support by opening up additional ports. When using gradio from a docker container, add this evnironment variable:
```python
os.environ['GRADIO_SERVER_NAME']='0.0.0.0'
```
The default name ('127.0.0.1') will not work from docker. Alternatively, you can do this from the `gr.Interface().launch(server_name='0.0.0.0')` call.

I am only on Week2 so I may add more to this as I progress.

Skål,
Jon
