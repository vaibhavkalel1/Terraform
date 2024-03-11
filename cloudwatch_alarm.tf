resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = "demo-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"
  alarm_description   = "This alarm will trigger if CPU utilization exceeds 5% for two consecutive periods"
  alarm_actions       = ["arn:aws:sns:us-east-2:123456789012:example-topic"] # Replace with your SNS topic ARN
}
