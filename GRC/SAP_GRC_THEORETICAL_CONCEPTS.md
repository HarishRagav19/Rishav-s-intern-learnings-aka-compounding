SAP GRC

1. SAP Authorization Concept (Deep Understanding)
   • Authorization Object
     - Core unit of SAP security
     - Controls what action a user can perform and on which data
     - Structure:
       • Object Name (e.g., M_BEST_BSA)
       • Fields (e.g., ACTVT, BSART)
       • Values (e.g., ACTVT = 01 Create, 02 Change)
     - Authorization = Object + Field Values

   • Authorization Check Process
     - User executes transaction
     - SAP program triggers AUTHORITY-CHECK
     - System verifies authorization object and field values
     - Access is granted or denied
     - Flow: Transaction → Program → AUTHORITY-CHECK → Authorization → Result

   • Role vs Profile
     - Role: Business-level container (menu + authorizations)
     - Profile: Generated from role and assigned to user
     - Flow: Role → Profile → User

   • Single vs Composite Role
     - Single Role: Contains transactions and authorizations
     - Composite Role: Collection of multiple single roles

2. Types of SoD Conflicts
   • Functional SoD
     - Business-level conflict
     - Example: Create Vendor + Process Payment

   • Technical SoD
     - Authorization-level conflict
     - Based on objects and field values

   • Cross-Module SoD
     - Conflict across modules (FI, MM, SD)

   • Critical Access Risks
     - Single powerful access
     - Example: Change vendor bank details

3. Risk Rule Set Concept
   • Definition
     - Library of risks used by GRC to detect SoD and critical access risks

   • Components
     - Functions:
       • Business activities (e.g., Create Vendor)
     - Actions:
       • T-codes (e.g., FK01, F110)
     - Relationship:
       • Function → contains → Actions

   • Conflict Logic
     - Function A + Function B = Risk

   • Detection Flow
     - User → Role → T-codes → Functions → Risk Rule → Violation

4. Mitigation Controls
   • Definition
     - Compensating control when risk cannot be removed

   • When to Use
     - Business-critical access
     - No alternative role design

   • How It Works
     - Monitoring
     - Approval mechanisms

   • Example
     - Risky access reviewed regularly instead of removed

5. Access Request Management (ARM)
   • Definition
     - Process of requesting, approving, and granting access

   • Flow
     - Step 1: Request Creation (User requests access)
     - Step 2: Risk Analysis (SoD and critical risk check)
     - Step 3: Approval Workflow (Manager, Role Owner, Security)
     - Step 4: Provisioning (Access assigned)

   • Flow Logic
     - User → Request → Risk Analysis → Approval → Provisioning

6. Emergency Access Management (Firefighter)
   • Definition
     - Temporary high-privilege access

   • Purpose
     - Emergency fixes and production issues

   • Process
     - Request → Approval → Use ID → Log activities → Review logs

   • Key Insight
     - Temporary access with full monitoring

7. Types of Controls
   • Preventive
     - Stops issue before occurrence (e.g., block access)

   • Detective
     - Identifies after occurrence (e.g., audit logs)

   • Corrective
     - Fixes after detection (e.g., remove access)

8. Compliance Concepts (Audit View)
   • Audit Definition
     - Independent review of controls and processes

   • Types
     - Internal Audit
     - External Audit

   • Auditor Checks
     - User access
     - SoD conflicts
     - Logs
     - Control effectiveness

9. Master Data vs Transaction Data
   • Master Data
     - Static data (Vendor, Customer)

   • Transaction Data
     - Operational data (Invoice, Payment)

   • Key Risk
     - Master data changes have high impact

10. Organizational Levels
   • Examples
     - Company Code
     - Plant
     - Sales Organization

   • Purpose
     - Restrict access by organization

   • Example
     - User allowed only in Company Code 1000

11. Workflow Concept
   • Definition
     - Automated approval routing

   • Features
     - Multi-level approvals
     - Role-based routing
     - Escalation

   • Flow
     - Request → Approvals → Final Approval

12. Logging and Monitoring
   • Logging
     - Recording system activity

   • Monitoring
     - Analyzing logs

   • Includes
     - Logins
     - Transactions
     - Data changes

   • Importance
     - Fraud detection and audit support

13. Types of Risks
   • Access Risk
   • Process Risk
   • Data Risk
   • Fraud Risk

14. Control Ownership
   • Control Owner
     - Ensures control works

   • Risk Owner
     - Manages risk

   • Approver
     - Approves access

   • Key Insight
     - Defines accountability

15. GRC Architecture
   • Components
     - Frontend: User interface
     - Backend: Rules engine
     - Integration: SAP systems

   • Flow
     - User → GRC → SAP → Risk Analysis

16. Risk Analysis Types
   • Real-Time
     - During request (Preventive)

   • Batch
     - Scheduled (Detective)

17. Key Terminologies
   • SoD: Segregation of Duties
   • Risk: Potential issue
   • Control: Risk management mechanism
   • Mitigation: Risk reduction
   • Rule Set: Risk definitions
   • Firefighter: Emergency access
   • Provisioning: Access assignment

Final Concept
• Right User → Right Access → Right Time → Proper Control