# kubectl

GitHub action kubectl command-line tool

### Usage

```yaml
  - name: Get kubectl version
    uses: asonnleitner/kubectl@master
    with:
      command: kubectl version --client --output json
```
