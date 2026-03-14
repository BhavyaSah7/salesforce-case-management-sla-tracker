# Salesforce Case Management & SLA Tracker

A Salesforce implementation that automates case prioritization, 
SLA deadline management, and escalation notifications — 
built to simulate a real enterprise Service Cloud solution.

## 🎯 Business Problem Solved
Support teams struggle to prioritize cases consistently and 
often miss SLA deadlines without knowing it. This solution 
automates both problems end to end.

## ⚙️ Features
- **Apex Trigger** — Auto-calculates priority score on case 
  creation based on type, origin, and priority. Sets SLA 
  deadline automatically (4–48 hours based on urgency)
- **Scheduled Flow** — Runs daily, detects breached cases, 
  marks them, logs the breach, and emails the manager
- **Custom Object** — SLA_Breach_Log__c creates an audit 
  trail of every breach for historical reporting
- **Reports & Dashboard** — 3 reports and a live dashboard 
  showing breach rate, agent performance, and urgent cases

## 🛠️ Tech Stack
- Salesforce Apex (Trigger + Test Class — 100% coverage)
- Salesforce Flow (Scheduled-Triggered)
- Custom Objects & Fields
- Reports & Dashboards (Summary + Tabular)
- Developer Console / Anonymous Apex

## 📊 Dashboard Preview
![Dashboard Screenshot](https://github.com/user-attachments/assets/795bcfb8-3f10-40cd-bd24-a2a6ecf4d1b8)

## 🔑 Key Concepts Demonstrated
- Bulk-safe Apex trigger patterns
- Trigger.isInsert context to prevent deadline overwrites
- Flow field selection best practices
- Lookup field ID mapping in Flows
- SLA business logic implementation
- Org email configuration for automated notifications

## 🚀 What I Would Add Next
- Bulkify the Flow using collection variables (currently 
  works but not optimised for high volume)
- Slack integration for real-time breach alerts
- Einstein Analytics dashboard for trend analysis
- Escalation tiers (L1 → L2 → Manager) based on breach age
