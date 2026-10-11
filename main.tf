resource "aws_wafregional_xss_match_set" "wafregional_xss_match_sets" {
  for_each = var.wafregional_xss_match_sets

  name   = each.value.name
  region = each.value.region

  dynamic "xss_match_tuple" {
    for_each = each.value.xss_match_tuple != null ? each.value.xss_match_tuple : []
    content {
      field_to_match {
        data = xss_match_tuple.value.field_to_match.data
        type = xss_match_tuple.value.field_to_match.type
      }
      text_transformation = xss_match_tuple.value.text_transformation
    }
  }
}

