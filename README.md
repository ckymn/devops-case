# devops-case

# Adim 1: Docker ile Container oluşturulması ve Upload EC2 Container Registry

    ```
        cd app/backend

        // run .sh
        ./run.sh
    ```

    ```
        cd app/frontend

        // run .sh
        ./run.sh
    ```
# Adim 2: Terraform ile AWS üzerinde VPC, Subnet, Security Group, oluşturulması

    ```
        cd terraform/test-dev
        
        // create test-dev
        ./z_create.sh

        // destroy test-dev
        ./z_create.sh

    ```
    ```
        cd terraform/prod-env
        
        // create prod-env
        ./z_create.sh

        // destroy prod-env
        ./z_create.sh
    ```

# Adim 3: Kubernetes ile Deployment ve Service oluşturulması

    ```
        cd k8s

        ./run.sh
    ```