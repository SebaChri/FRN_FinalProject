# App
## App Folder
The App folder is structured as followed:

    +
    |
    +-- etc
    |
    +-- src

On the root level of the App folder should exists only three files:
1. `app.json` manifest of the App
2. `AppRuleSet.json` application rule sets used by code analyzers
3. `AppSourceCop.json` source cops used by code analyzers, contains the mandatory name prefix of the App

In the `etc` folder exists various files needed by the App, but no source code, f.e.
- images
- permission sets
- configuration files like `*.json` or `*.xml`

All the source code (`*.al` and report layouts) is plaed in the `src` folder , is up to the team how this folder is organized.

## File Naming
Each file name has object names with only characters [A-Za-z0-9], object type, and `.al` for file type. In your extension, the name of each new application object (table, page, codeunit, ...), must contain a prefix (see `AppSourceCop.json`). This rule applies to all objects.

### File naming notation
Follow the syntax for file naming as shown below: `<PrefixObjectName>.<FullTypeName>.al` or `<PrefixObjectName>.<FullTypeName>Ext.al`.

File and object naming examples with prefix DE3:
**Object name**                    | **File name**
-----------------------------------|--------------------------------
Page 50100 "Group List"            | DE3GroupList.Page.al
PageExt 50100 "Customer Card"      | DE3CustomerCard.PageExt.al
Codeunit 50100 "Group Management"  | DE3GroupManagement.Codeunit.al
