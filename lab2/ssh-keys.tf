#en linux
#ssh-keygen -m pem -b 4096 -f Lab1.pem

resource "aws_key_pair" "key_class2" {
  key_name   = "class_key2"
  public_key = "${file("class_key2.pem.pub")}"

}
