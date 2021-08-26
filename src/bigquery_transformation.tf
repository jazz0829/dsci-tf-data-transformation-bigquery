resource "aws_s3_bucket_object" "BigQuery_Community_Since201901" {
  bucket = "${var.glue_artifact_store}"
  key    = "Glue/${var.environment}/Bigquery/domain.Load_BigQuery_Community_Since201901.py"
  source = "scripts/Bigquery/domain.Load_BigQuery_Community_Since201901.py"
  etag   = "${md5(file("scripts/Bigquery/domain.Load_BigQuery_Community_Since201901.py"))}"
}

resource "aws_glue_job" "Load_BigQuery_Community_Since201901" {
  name               = "domain.Load_BigQuery_Community_Since201901"
  role_arn           = "${data.aws_iam_role.cig_glue_role.arn}"
  allocated_capacity = "${var.dpu}"

  command {
    script_location = "s3://${var.glue_artifact_store}/${aws_s3_bucket_object.Salesforce_Cases.id}"
  }

  default_arguments = {
    "--raw_db"                                 = "${var.raw_database}"
    "--raw_table_bigquery"                         = "${var.raw_bigquery_table}"
    "--s3_destination_bigquery"                    = "s3://${var.domain_bucket}/Data/BigQuery_Community_Since201901"
    "--job-bookmark-option"                    = "${var.bookmark}"
  }
}