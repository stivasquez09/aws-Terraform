#en linux
#ssh-keygen -m pem -b 4096 -f Lab1.pem
resource "aws_key_pair" "name" {
  key_name   = "Lab1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDs/cQ70j1ibIrLytWX9e7GJepHV539VBfLFuwtii9k0rC474lsvQw/7EBTaD6aYOaicTZEFXfYJsLfxFbPOr6LuCw+mJAHmBbPzJEDzO2VPWVHzR+zNP3XfT1/8dtDeTpuauePS8zdWkNi2qpacZ8wbwhPOPrTmYhqej6EKuZt3WYPYHANGEGZSBWNip3pHdUIgxp/PRU8RoHXWV/wqyLX4wHF5fLrU0HIGpbrkLtlvoNVv2U04GeoH7uACGwdGJZXyYhKabb2qyyt1AEyb0pJi5LvaSXpvjFpJ53f6y5iKxcNdbxNfmxfJfrb4AHdwu3tUwUXtmV/JEp4NrgaqlC+GJXDjF5v/P0NffqASbrrM1EMrvVqWPSlkr2AQrgy/XQej1UM0OnLePzQeCshJMqLksn94N2ohpSOsLfiL3h/At4rg2vScBBhLHP94jkvfPdnABVx59PsZSZyONXNDiiA8lhr5WdpYRo+Tx2DiHtGHb0dyvzsUjgV2PVMRuZcJN+0wi0LdSmLTc6TYYs2q23UJ1o3IwQMTu9TyMgJ7yrER5C/gq8OcWGVeb+8FlzdUOpZtJQTgDusXzqk8T2Krt6t7CisqaF1RNJZlzpgeHaYaNvBuvjh2LyczT3dUnXo1CT+SZ4c/mPx7M6gfcWC5foFJYukGC7rqcYNBbPMtFM3mQ=="
}
resource "aws_key_pair" "key_class2" {
  key_name   = "class_key2"
  public_key = "${file("Lab1.pem.pub")}"

}
