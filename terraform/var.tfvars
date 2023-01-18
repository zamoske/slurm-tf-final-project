cidr_blocks = [
    ["10.10.0.0/24"],
    ["10.11.0.0/24"],
    ["10.12.0.0/24"]
]

labels = {
    "project" = "slurm-final"
    "env" = "lab"
}

compute_count = 3

vm_resources = {
  cores = 2
  disk = 10
  memory = 4
}
