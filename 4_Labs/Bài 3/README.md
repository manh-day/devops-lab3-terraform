# Lab 3: Cấp phát hạ tầng đám mây với Terraform & AWS

## Thông tin sinh viên

- Họ và tên: Lương Tuấn Mạnh
- Lớp: KTPM – K22A
- Trường: Đại học Công nghệ Thông tin & Truyền thông – Đại học Thái Nguyên

## Mục tiêu

Sử dụng Terraform để khai báo, triển khai và dọn dẹp
tài nguyên EC2 và S3 trên AWS.

## Môi trường

- Windows và PowerShell
- Visual Studio Code
- Terraform
- AWS CLI v2
- AWS Region: ap-southeast-2
- AWS CLI profile trên máy thực hành: lab3

## Các file cấu hình

| File | Chức năng |
|---|---|
| configs/main.tf | Khai báo provider, EC2, security group và S3 |
| configs/variables.tf | Khai báo biến cấu hình |
| configs/outputs.tf | Xuất ID EC2, IP nội bộ, tên và ARN bucket |

## Cách thực hiện

Đăng nhập AWS trên máy thực hành:

```powershell
aws login --profile lab3 --region ap-southeast-2
```

Trong thư mục configs, chạy lần lượt:

```powershell
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform output
```

Khi apply yêu cầu xác nhận, nhập yes.

Sau khi kiểm tra kết quả, dọn dẹp:

```powershell
terraform destroy
```

Khi destroy yêu cầu xác nhận, nhập yes.

## Kết quả thực hành

- Đã triển khai EC2 loại t3.micro.
- Đã tạo security group riêng cho bài lab.
- Đã tạo bucket S3 và cấu hình chặn truy cập công khai.
- Đã xuất ID EC2, IP nội bộ, tên và ARN bucket S3.
- Đã xóa thành công 4 tài nguyên bằng terraform destroy.

EC2 sử dụng IP nội bộ, không được cấp IP công khai.
Các tài nguyên của bài lab đã được dọn dẹp sau thực hành.

## Minh chứng

Các ảnh kết quả được lưu trong thư mục screenshots.

## Bảo mật

Không đưa thông tin đăng nhập AWS, thư mục .terraform
hoặc các file Terraform state vào repository.
