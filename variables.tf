variable "name" {
  description = "The name of the Cloudformation Stack to create."
  type        = string
}

# default to null so we can use the ternary operator in locals
variable "description" {
  description = "The description of the Cloudformation Stack to create."
  type        = string
  default     = ""
}

variable "outputs" {
  description = "A map of keys and values that should be Outputs of the Cloudformation Stack."
  type        = map(object({ Value = string, Export = object({ Name = string }) }))
}
