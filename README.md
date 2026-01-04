# MinIO File Transfer GitHub Action

This GitHub Action runs the MinIO client ([MinIO mc](https://min.io/docs/minio/linux/reference/minio-mc.html)) to handle file(s) or directory transfers between your repository and MinIO (self-hosted or cloud-hosted).

## Usage Examples

### Download a File
```yaml
- name: Download from MinIO
  uses: cuhk-haosun/code-docker-minio-sync@main
  with:
    endpoint: ${{ secrets.AWS_ACCESS_URL }}
    access_key: ${{ secrets.AWS_ACCESS_KEY_ID }}
    secret_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    bucket: demo
    # Leading slash is required
    remote: /demo.txt
    local: './'
    direction: 'download'
```

### Upload a File
```yaml
- name: Upload to MinIO
  uses: cuhk-haosun/code-docker-minio-sync@main
  with:
    endpoint: ${{ secrets.AWS_ACCESS_URL }}
    access_key: ${{ secrets.AWS_ACCESS_KEY_ID }}
    secret_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    bucket: demo
    # Leading slash is required
    remote: /
    local: './upload.txt'
    direction: 'upload'
```

### Download a Directory
```yaml
- name: Download a directory from MinIO
  uses: cuhk-haosun/code-docker-minio-sync@main
  with:
    endpoint: ${{ secrets.AWS_ACCESS_URL }}
    access_key: ${{ secrets.AWS_ACCESS_KEY_ID }}
    secret_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    bucket: demo
    # Leading slash is required
    remote: /my-directory-path/
    local: './downloaded-folder'
    direction: 'download'
```

### Upload a Directory
```yaml
- name: Upload a directory to MinIO
  uses: cuhk-haosun/code-docker-minio-sync@main
  with:
    endpoint: ${{ secrets.AWS_ACCESS_URL }}
    access_key: ${{ secrets.AWS_ACCESS_KEY_ID }}
    secret_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
    bucket: demo
    # Leading slash is required
    remote: /my-remote-directory/
    local: './local-folder-to-upload'
    direction: 'upload'
```
