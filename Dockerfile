FROM  linuxbrew/brew:2.7.7
COPY ./hooks /hooks
RUN brew tap liamg/tfsec
RUN brew install terraform pre-commit gawk terraform-docs tflint tfsec shellcheck hadolint
RUN pip3 install bandit flake8 black
