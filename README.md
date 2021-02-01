# Pre-commit hooks

This repo defines Git pre-commit hooks intended for use with [pre-commit](http://pre-commit.com/). The currently
supported hooks are:

* **terraform-docs**: Automatically run `terraform-docs md` on all Terraform code (`*.tf` files). Inserts input and output documentation into README.md. Recommended.
* **terraform-fmt**: Automatically run `terraform fmt` on all Terraform code (`*.tf` files). Rewrites all Terraform configuration files to a canonical format.
* **terraform-validate**: Automatically run `terraform validate` on all Terraform code (`*.tf` files). Validates all Terraform configuration files.
* **tflint**: Automatically run [`tflint`](https://github.com/terraform-linters/tflint) on all Terraform code (`*.tf` files).
* **tfsec**: Automatically run [`tfsec`](https://github.com/tfsec/tfsec) on all Terraform code (`*.tf` files). TFSec static analysis of terraform templates to spot potential security issues.
* **shellcheck**: Run [`shellcheck`](https://www.shellcheck.net/) to lint files that contain a bash [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)).


## General Usage

In each of your repos, add a file called `.pre-commit-config.yaml` with the following contents:

Next, have every developer: 

1. Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
1. Run `pre-commit install` in the repo.

That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config will execute.


## Running Against All Files At Once


### Example: Formatting all files

If you'd like to format all of your code at once (rather than one file at a time), you can run:

```bash
pre-commit run terraform-fmt --all-files
```



### Example: Enforcing in CI

If you'd like to enforce all your hooks, you can configure your CI build to fail if the code doesn't pass checks by
adding the following to your build scripts:

```bash
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

If all the hooks pass, the last command will exit with an exit code of 0. If any of the hooks make changes (e.g.,
because files are not formatted), the last command will exit with a code of 1, causing the build to fail.

## Shellcheck Arguments

To enable optional shellcheck features you can use the `--enable` flag.
Other shellcheck flags can not be passed through.

```yaml
repos:
  - repo: https://github.com/gruntwork-io/pre-commit
    rev: <VERSION>
    hooks:
      - id: shellcheck
        args: ["--enable require-variable-braces,deprecate-which"]
```

