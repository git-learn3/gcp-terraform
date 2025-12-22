output "vpc_id" {
  value = google_compute_network.custom_vpc.id
}

output "public_subnet_id" {
  value = google_compute_subnetwork.public_subnet.id
}

output "private_subnet_id" {
  value = google_compute_subnetwork.private_subnet.id
}
