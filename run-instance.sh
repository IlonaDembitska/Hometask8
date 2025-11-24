aws ec2 run-instances \
    --image-id ami-01fd6fa49060e89a6 \
    --count 1 \
    --instance-type t3.micro \
    --key-name demIXT\
    --security-group-ids sg-0ccff3636ffc40df5 \
    --subnet-id subnet-006a01d6f419a2f4c \
    --user-data fileb://userdata.sh \
    --output text