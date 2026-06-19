#########################################
# CloudWatch Log Group
#########################################

resource "aws_cloudwatch_log_group" "application_logs" {

  name = "/oceans-payroll/application"

  retention_in_days = 30

  tags = local.common_tags
}

#########################################
# SNS Topic
#########################################

resource "aws_sns_topic" "critical_alerts" {

  name = "oceans-payroll-alerts"

  tags = local.common_tags
}

#########################################
# EC2 CPU Alarm
#########################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "HighCPU"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_actions = [
    aws_sns_topic.critical_alerts.arn
  ]
}

#########################################
# RDS Alarm
#########################################

resource "aws_cloudwatch_metric_alarm" "high_connections" {

  alarm_name = "HighDatabaseConnections"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "DatabaseConnections"

  namespace = "AWS/RDS"

  period = 300

  statistic = "Average"

  threshold = 50

  alarm_actions = [
    aws_sns_topic.critical_alerts.arn
  ]
}