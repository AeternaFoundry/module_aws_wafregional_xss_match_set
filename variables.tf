variable "wafregional_xss_match_sets" {
  description = <<EOT
Map of wafregional_xss_match_sets, attributes below
Required:
    - name
Optional:
    - region
    - xss_match_tuple (block):
        - field_to_match (required, block):
            - data (optional)
            - type (required)
        - text_transformation (required)
EOT

  type = map(object({
    name   = string
    region = optional(string)
    xss_match_tuple = optional(list(object({
      field_to_match = object({
        data = optional(string)
        type = string
      })
      text_transformation = string
    })))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

