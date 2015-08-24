Return-Path: <samuli.piippo@theqtcompany.com>
X-Greylist: delayed 882 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 24 Aug 2015 09:28:23 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0137.outbound.protection.outlook.com [157.55.234.137])
	by mail.openembedded.org (Postfix) with ESMTP id D84DD6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:23 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:53 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:54 +0300
Message-ID: <f76b55e7bbc98c12e5574c5c88a5619bdf188af8.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:8exGvg5qrJsecb3wwkpF7Krs6mokQdzO5Welh8Pjltc8Mk9FVjLPzkMNGJNTw7nyi5PijW06hbw1HBMcC/u84TnD7lUnQDjskdE88/CX+5BFQ2OtVZMZFMxAIrOGxWtT21r6tKMutHquaWpds0PVMzPOCa6V8g9MBFNI0XjrGGY=;
	3:bFjLzqrWOAHAldUDJB8erjvmbb/LjJ0GUvDO1gKyAoqdk2oQYKWyqRVJcY55GNfnd1f2q8n8cmRkDh1i6q7GP28mulobHZk4q/2LTa2paTeSR/DlhOQN5BTTM4Z7QKvtP/NqktmrrkyUJEG+B2rk0w==;
	25:ECAtrWp6lAfOXcv3ogmQJbtHJP3wll0b+q6HVD/9sFU7mJKymfgkJ8CnXkPj0oI+jXKmTRcpg8AVwSoVA7gv+Pnh80pzlmeHEFBKClhS2VFszAQwJ7POs42nwkTBxY3JWkfYUHU1+nhsFol2mlDKlr6Oy+yEMPQR0JD3/wJDa8uYl/9cYFVguHEcuS1NNMj0fdi8auJUlmsWPiSTlZplHbjtwyI+h1EU/5LZxsD/N6pxNz3Q50jaMcu2DRuy8khiHbd5L74RoEcFb/Zw9PhGTw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:L3pKriq5fEJFMYkiGXfs4mEaqGlL6EzSVBOT2MWk0VN8t0s/w43xhDWRItijcwTs0DuU6BaDsAZOrnj7ejGDlY0XRdPuJ0R3Tiw9dPly3ZuVxBcZJHF/DfGPI6zAHKXyplYqugCVOXcMmSxQTEwA42MTKW2K7RdHmZXxk/etL0Y+rpSOa36988M8hEZhiI7hI65Yspn/rFolUx2zfe73kqKAilzAFt+tGcb3tUEKgM5hLAYJmRk46Xy0HKWTNCZa8VxC/K9mMsggSzTqQJDPNYk78qFLHh/FlL5bXr1b5EGsSDaFkOcNv2GmbnTEfj7afZ/9pS7lwthDTom2BTlozDE4a6ZzGA2VrGcUdEzDxfBZMEUUT0OLVEc77pd3M8oszZ0Fbw6wkpx3+sIl7+o4dnMEWCj591wr4mWbLefKjgK7QB7Dpaky1002p1eXsTjiCb46G6AcLjbqnB4Aem0/1uxHGj/FJHQ3KS4Im3OreTR1PwGYISZ32A55Ypgm0atN;
	4:yM56NSR2B+geY0vgqh3PFYxvZHisKAsDt+aoVkCZXeuAtHQ/sbOx43SqHXZFI5LmtCbVnAlz+t76xJU04WnDUzsNfE6Qz4LbMujQ5iJ2hWTlsB+ZR0p0xsguS2+z5Br+TKiKZ1JIWRzQJnWpX+5S7Vb1SuJDe4YvHGOWH9kG5QuBbCyn6TbASzPBigxEshClFEmPl26cae21a0qfFjpCztxp0eYBEpwM5xYFgjJLCRsps4OVthCMUDYRSNUQkPeKuWJBsVBFBP9aVCzMdc4BLh3Ke3Y5318GupMSjOlOZVdTUY45hpFLigYjEUJ5coAV
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174538A686591428AE2391F90620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:EIyZgFryFKg0ghMks5Dq7pmKuKCfbH4zQfw/bxrpF?=
	=?us-ascii?Q?c8vilSQ/gZBb60lp5SraCqwOziJyMOl1aclAXuLguMLu3Vb3krzFG4GCBnBQ?=
	=?us-ascii?Q?3/Yg/ypMxlp0JAaQSzE7tc/scLU/X3Kiflc/5cJK035gRNSHGbJisrHOhiYl?=
	=?us-ascii?Q?JKR1tyb9tSjPzv4Ik+8o9jn6F7Y1nTQo4BY5gVhf/+NRLmE7thI/hbOM3n6m?=
	=?us-ascii?Q?jSWBBUJnv3Ivg5fttfbSXZaqYOs0bYLE6E4gP2KqrrrSZsG5Ylp2Oytzp7wB?=
	=?us-ascii?Q?1dRcXCeIxeYiu4Vkg36aHbytnt2ZFwZ+bF5ekjeYzGWtSr9bSBYojiGYtD82?=
	=?us-ascii?Q?nEs6PedxU4LFdmKpdH+Zgr/N9+sM0B46fbciygOmdzy36OQTJBDk0eD6zj+G?=
	=?us-ascii?Q?x8a4vAIc1+EzsJQCMHgLzIcLjwFPYkFfvNTP+Z46NVADTzVUe1mWJO1uJBpl?=
	=?us-ascii?Q?LFS7E7dMjQ+V4cqSykizMxjsiklfVFAS3588QOVMGx+iHk07et0+xCQQX67b?=
	=?us-ascii?Q?sGSRWkdfRYv0PQlZTf/49ZXYf5BT0EtbEq31rzz0WigIJV1/pvwzkIqVYh5G?=
	=?us-ascii?Q?7KxICCMwID4ASNY8vIBeGQqmAgFKLQi6TnMxBV6XP+k6PGkTcRuC7uNyDUEe?=
	=?us-ascii?Q?l1MLWSbAi2iUl7iNuzwt10Qh/a9chQwOXXKKYp44upY5TXW6zKDOa3hpfa0S?=
	=?us-ascii?Q?CiXDcXaWPcSpSWpmL2aipw8KCiFqUk4bDBNPEJHZjTMtu8Zyq49xkz7SS/RN?=
	=?us-ascii?Q?4UjV3vw43n/LR99x4yQceXjL3O2nbFTBcOiOMTlpe7JF3gRDDdTUOgeFCdE/?=
	=?us-ascii?Q?KhUqf+PI/ADMjKWvTsFP+ZuZoJArj/Nxs+mgCmd6AfjsZPT7S1tLKsZ3Ub1q?=
	=?us-ascii?Q?qyU+5IeRf+OIy3FNP11Tlwp5uuNrRCNOXsi5UIkO1A3+9JfKZ+m9oVdtm7oj?=
	=?us-ascii?Q?ko0ULIJwExELocxY4SdXFB61Uibyk4g8HTpUCt7iL5fPSRtYecV2EyIewpEi?=
	=?us-ascii?Q?uGgtISn/wllaYtgArFFtZFW4jY8mU1PQ9wBSwiKUJzMg3dQdIPKabDzUfp90?=
	=?us-ascii?Q?hhNAVjR8cYaDEVBwHF1DwDdjO9ZtNW+3NNb8iialzMom5Luw9iDqNkbFfI6q?=
	=?us-ascii?Q?2NuV4d21jLQCrrlgyFs+4JvZjb+89LPW5ekCzSLZX6tydIImDa/vngz6Rwra?=
	=?us-ascii?Q?T0qbqNQZNXNeIXx4v/RUmqBbstWaiyXtHT8qJSBm51A39njsTApX80AG9rH/?=
	=?us-ascii?Q?2MLx4wdKd8YjkFWQHk465RU4ywi2pB6psPFeeeolNnvueloxoxSqamvsW044?=
	=?us-ascii?Q?nvO+srEIUxZL7TsGaAGyvE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:JD/BjqTQwNfp2rhjVj3XFPsbTMapqPoDz6su49etDU98jIwG9vu5KPE1RzDhktnvD09y1B5KJbvCtrRe7B4Mk+fou7OhiskIhAsqlqR7MEcWGVdrMS9+t9Ae2Ll6iOI3FYm3eDlusM4+HdM53m3R6g==;
	24:DFMITjR5i/E10LmOKgcC9u9dtiF/0eb4ETILLcCGExanl8LpwelaHZSUQ0wR19pOnHPyPWoVmZkjvnKclWbXNGYc79UI0U0aIRd4rxy4p5A=;
	20:EL/R/adb9zVYq2216b75cUJ8Kyr/6si2XW2Mb+Nh2once7uSycC9ek+TJ/8YaHXJ7UVTPfBy+dWAenFP2M/1vQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:53.8969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 08/11] qtbase: remove dependency to sqlite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 09:28:27 -0000
Content-Type: text/plain

Qt defaults to bundled version of sqlite, so there is no need
to have dependency to sqlite3.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 92faf29..972027b 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -101,7 +101,7 @@ PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
 PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
 PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
-PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,sqlite3"
+PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,"
 PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
 PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
 PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
-- 
1.9.1


