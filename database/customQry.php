ALTER TABLE campaign_logs ADD UNIQUE KEY unique_campaign_contact (campaign_id, contact_id);
CREATE INDEX idx_campaign_status ON campaign_logs(campaign_id, status);
CREATE INDEX idx_status ON campaign_logs(status);
ALTER TABLE `contacts` ADD `is_subscribe` CHAR(1) NOT NULL DEFAULT 'Y' AFTER `is_favorite`;
