# Adım 1: Terraform Kurulumu

- İlk olarak, Terraform'u bilgisayarınıza kurmalısınız. Terraform'ü resmi web sitesinden indirebilir ve kurulum talimatlarını izleyebilirsiniz.

```
  https://www.terraform.io/downloads.html
```

# Adım 2: Terraform Proje Dizinini Oluşturma

- Bir projenin kök dizinini oluşturun ve bu dizinde Terraform konfigürasyon dosyalarınızı (.tf uzantılı dosyalar) saklayacaksınız.

  ```
    mkdir terraform
    cd terraform
  ```

# Adım 3: Terraform State Dosyasını saklamak için S3 Bucket Oluşturma

- Terraform state dosyası, Terraform konfigürasyon dosyalarında tanımlanan kaynakların durumunu aynı ekip arkadaşlarınızla paylaşmak için kullanılır. Bu dosyayı saklamak için bir (remote backend) S3 bucket oluşturun.

  ```
    touch s3.tf
  ```

# Adım 4: Terraform State Dosyasını saklamak için DynamoDB Table Oluşturma

- Remote backend'e Locking desteği sağlar bu da kullanıcıların aynı anda Terraform State dosyasında değişiklik yapmasını engeller. Bunun için bir DynamoDB kullanırız.

  ```
    touch dynamodb.tf
  ```

  **_NOTE:_**
  DynamoDB'yi Terraform ile yönetebilmek için terraform kullanıcınıza IAM üzerinden "AmazonDynamoDBFullAccess" yetkisi verdiğinizden emin olunuz. Aksi halde yetki hatası alırsınız.

  ```
    terraform init
    terraform plan
    terraform apply
  ```


# Adım 5: Terraform State Dosyasını S3 Bucket'ta saklamak için yapılandırma

- Her ne kadar S3 bucket ve bir DynamoDB tablosuna sahip olsakta Terraform state'i yerel olarak saklanmaya devam edecek. Terraform'u state'i S3 bucketınızda saklayacak şekilde yapılandırmak için (şifreleme ve locking ile birlikte), Terraform kodunuza bir remote backend eklemeniz gerekir. Hem production hem de test ortamı için farklı bir remote backend yapılandırması oluşturacağız.

  ```
    touch backend.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  
# Adım 6: Terraform ile VPC resource oluşturma

- VPC (virtual private cloud) : AWS'de bir sanal özel bulut oluşturmak için kullanılır. VPC, AWS hesabınızda özel bir sanal ağ oluşturmanıza olanak tanır. VPC'ler, AWS kaynaklarınızı başka bir ağdan izole etmenize olanak tanır.

  ```
    touch example.tf
  ```

# Adım 7: Terraform variables dosyası oluşturma

- Terraform variables dosyası, Terraform konfigürasyon dosyalarında kullanılan değişkenleri tanımlamak için kullanılır. Bu dosyada, Terraform konfigürasyon dosyalarında kullanılan değişkenler tanımlanır.

  ```
    touch variables.tf
  ```

# Adım 8: Terraform variables tfvars dosyası oluşturma

- Terraform variables tfvars dosyası, Terraform konfigürasyon dosyalarında kullanılan değişkenlerin değerlerini tanımlamak için kullanılır. Bu dosyada, Terraform konfigürasyon dosyalarında kullanılan değişkenlerin değerleri tanımlanır.

  ```
    touch terraform.tfvars
  ```

# Adım 9: Terraform connection with AWS provider file

- Terrafom AWS sağlayıcısı, Terraform'ün AWS API'si ile iletişim kurmasına izin verir. Bu dosyada, Terraform AWS sağlayıcısını tanımlarız.

  ```
    touch provider.tf
  ```

# Adım 10: Terraform ile VPC resource oluşturma

- VPC (virtual private cloud) : AWS'de bir sanal özel bulut oluşturmak için kullanılır. VPC, AWS hesabınızda özel bir sanal ağ oluşturmanıza olanak tanır. VPC'ler, AWS kaynaklarınızı başka bir ağdan izole etmenize olanak tanır.

- IG (internet gateway) : VPC'lerin internete bağlanmasını sağlayan bir gateway'dir. IGW, VPC'ye bağlı public subnetlerin internete erişmesini sağlar.

- AZ (availability zone) : AWS'de bir bölgede bulunan bir veya daha fazla veri merkezidir. Her AZ, bir veya daha fazla veri merkezinden oluşur. Her AZ, birbirinden bağımsızdır. Bir AZ'deki bir sorun, diğer AZ'lerdeki kaynakları etkilemez.

- Public subnet : VPC içindeki subnetlerdir. Public subnetler, internete açık olan subnetlerdir.

- Private subnet : VPC içindeki subnetlerdir. Private subnetler, internete kapalı olan subnetlerdir.

- Route table : VPC'lerin internete erişmesini sağlayan bir tablodur. Route table, VPC'ye bağlı subnetlerin internete erişmesini sağlar.

- Route table association : Route table'ın subnetlere bağlanmasını sağlar.

  ```
    touch vpc.tf
  ```
  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 11: Terraform ile NAT Gateway oluşturma

- NAT Gateway : Private subnetlerin internete erişmesini sağlayan bir gateway'dir. Private subnetlerin internete erişmesi için bir NAT gateway'e ihtiyaç vardır.

  ```
    touch natgw.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 12: Terraform ile Security Group oluşturma

- Security Group : AWS'de güvenlik duvarı oluşturmak için kullanılır. Security Group, inbound ve outbound trafik için izinler içerir. Security Group, bir veya daha fazla portu açmak için kullanılır.

  ```
    touch securitygroup.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ``` 

# Adım 13: Terraform ile RDS veritabanı oluşturma

- RDS (Relational Database Service) : AWS'de ilişkisel veritabanı hizmetidir. RDS ile PostgreSQL, MySQL, MariaDB, Oracle, Microsoft SQL Server gibi veritabanlarını kolayca yönetebilirsiniz. RDS, veritabanı yönetimini kolaylaştırmak için otomatik yedekleme, veritabanı güvenliği, yüksek kullanılabilirlik, ölçeklenebilirlik, yedekleme ve geri yükleme gibi özellikler sunar.

  ```
    touch rds.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 14: Terraform ile ACM (AWS Certificate Manager) oluşturma

- ACM (AWS Certificate Manager) : AWS'de SSL sertifikası oluşturmak için kullanılır. ACM, SSL sertifikalarını yönetmek için kullanılır. ACM, SSL sertifikalarını otomatik olarak yeniler.

- Create a record set in Route53 for ACM validation.

  ```
    touch acm.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 15: Terraform ile ALB (Application Load Balancer) oluşturma

- ALB (Application Load Balancer) : AWS'de yük dengeleyici oluşturmak için kullanılır. ALB, gelen istekleri birden fazla EC2 instance'a dağıtır.

  ```
    touch alb.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 16: Terraform ile S3 save static files oluşturma

- S3 (Simple Storage Service) : AWS'de dosya depolamak için kullanılır. S3, dosyaları depolamak için kullanılır. S3, dosyaları yedeklemek için kullanılır. S3, statik web sitelerini barındırmak için kullanılır.

  ```
    touch s3.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 17: Terraform ile ECS (Elastic Container Service) oluşturma

- ECS (Elastic Container Service) : AWS'de konteyner oluşturmak için kullanılır. ECS, Docker konteynerlerini çalıştırmak için kullanılır.

  ```
    touch ecs.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 18: Terraform ile ASG (Auto Scaling Group) oluşturma

- ASG : AWS Auto Scaling, otomatik olarak tüm ölçeklendirme politikalarınızı oluşturur ve tercihlerinize göre hedefleri sizin yerinize ayarlar

  ```
    touch asg.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```

# Adım 19: Terraform ile Route53 oluşturma

- Route53 : AWS'de DNS yönetmek için kullanılır. Route53, DNS kayıtlarını yönetmek için kullanılır. 

  ```
    touch route53.tf
  ```

  ```
    terraform init
    terraform plan
    terraform apply
  ```
  


# EXTRA: Terraform ile İzolasyonu Sağlama

- Terraform'u ilk kullanmaya başladığınızda, tüm altyapınızı tek bir Terraform dosyasında veya Terraform dosya kümesi olarak tek bir klasörde tanımlamak isteyebilirsiniz. Bu yaklaşımla ilgili sorun, tüm Terraform state'inizin artık tek bir dosyada saklanması ve herhangi bir yerdeki bir hatanın her şeyi bozabilmesidir.

  **_NOTE:_**
  Dosya düzeni aracılığıyla izolasyon: Ortamlar arasında güçlü bir ayrım yapmanız gereken production kullanım durumları için kullanışlıdır.

  - Her ortam için Terraform yapılandırma dosyalarını ayrı bir klasöre koyun. Örneğin, stage ortamının tüm konfigürasyonları stage adlı bir klasörde olabilir ve production ortamının tüm konfigürasyonları prod adlı bir klasörde olabilir.
  - Farklı kimlik doğrulama mekanizmaları ve erişim kontrolleri kullanarak her ortam için farklı bir backend yapılandırın: ör. her ortam, backend olarak ayrı bir S3 bucketile ayrı bir AWS hesabında yaşayabilir.

    - En üst düzeyde, her bir "ortam" için ayrı klasörler bulunur. Ortamlar her proje için farklılık gösterir, ancak tipik olanlar aşağıdaki gibidir:

      - test-env: Production öncesi için bir ortam (ör. test)
      - prod-env: Uygulamanızın kullanıcılara sunulduğu ortam (production)
      - mgmt: DevOps araçları için bir ortam (ör. CI sunucusu)
      - global: Tüm ortamlarda kullanılan kaynakları koyabileceğiniz bir yer (ör. S3, IAM)
      - modules: Terraform modüllerini koyabileceğiniz bir yer
        - Terraform yapılandırmalarınıza bir modül eklediğinizde veya bir modülün kaynak parametresini değiştirdiğinizde, plan veya apply komutlarını çalıştırmadan önce init komutunu çalıştırmanız gerektiğini unutmayın.

    - Her ortamda, her bileşen için ayrı klasörler vardır. Bileşenler her proje için farklılık gösterir, ancak tipik olanlar şunlardır:

    - vpc: Bu ortam için ağ topolojisi.
    - services: React frontend veya Java backend gibi bu ortamda çalıştırılacak uygulamalar veya mikro hizmetler. Her uygulama, onu diğer tüm uygulamalardan izole etmek için kendi klasöründe bile yaşayabilir.
    - data-storage: MySQL veya Redis gibi bu ortamda çalışacak veri depoları içindir. Hatta her veri deposu, onu diğer tüm veri depolarından yalıtmak için kendi klasöründe bulunabilir.

    - Her bileşen içinde, aşağıdaki adlandırma kurallarına göre düzenlenen gerçek Terraform yapılandırma dosyaları vardır:

      - variables.tf: Girdi değişkenlerinin tutulduğu dosya
      - outputs.tf: Çıktı değişkenlerinin tutulduğu dosya
      - main.tf: Kaynakların tutulduğu dosya

    **_NOTE:_** Klasörü taşırken, dosyaları yeni konuma kopyalarken (gizli) .terraform klasörünü gözden kaçırmadığınızdan emin olun

    **_NOTE:_** Backend yapılandırmasını global/s3/main.tf adresinden aşağı yukarı aynen kopyalayıp yapıştırabilirsiniz, ancak key'i web sunucusu Terraform koduyla aynı klasör yoluna değiştirdiğinizden emin olun
