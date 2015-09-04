Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0110.outbound.protection.outlook.com [157.56.112.110])
	by mail.openembedded.org (Postfix) with ESMTP id C17BC76FC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Sep 2015 08:17:33 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1175.eurprd02.prod.outlook.com (10.162.163.21) with Microsoft
	SMTP Server (TLS) id 15.1.256.15; Fri, 4 Sep 2015 08:17:31 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Sep 2015 11:16:56 +0300
Message-ID: <1441354616-14123-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR01CA0038.eurprd01.prod.exchangelabs.com (25.163.2.176)
	To DB5PR02MB1175.eurprd02.prod.outlook.com (25.162.163.21)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	2:zPwWyK2dTW7lKiV09zR3+BYyfgt5BX+/eo6oI74tUmx7puxhoMsJYJGSlYullkwfAbnWyshjWLs7JUnaxrLyKnijyw0HJO2Vh4z3fP0W/TRxC/hKZWxMmSeA1l/7UWHF5uJUVA49rKnAt/Gmm1Fz6Lu9J1bByjyiFHNCbl5vdHs=;
	3:JEm0pVZXCa5ESwEY7cCQNr7HJqs6exOB0zSzqQoOWG4oj5xkS4t5+1chuvEHXDueFBmOKUKS8RM78obISrUvinhx5GvQePT9ZKbEjiBJbvsBtTIha9FL6Bet8DVKulABxGLqv67ye3cp4/duCvonVA==;
	25:U8f46ksgczkOOgoJAuoY9Le+56itd5nFJryDbHzhIsaBX7qZc9E44SUk3CnJaQo7qycQiKnGKb4mtgnmmhcyEl8M44ii1cCkX7hBLkTDvFWmg4JVCG2FRsqcjPj3QteBTzlCM7i6dnJ4g2ZnWevGkPAuRgwhkI+DHxmrlFrQRhvRY0hMQLyc8hsOh7XKb2HbgkjHUb2XXHqMEvcUneml2MKoIyTxYa2Yo3/OTrT6Y2yDXF1AeSjRVsLwNl1JTNsoGEveG7+Tia/MtxFJHKkFzQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1175;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	20:itejJGsXqhh8ZrHFUfIuXxUCtGa77PGwCDUIUA8qXGaBbPkNoqzSV1gwRu5iwZ4eqXTeY0Z1JN+EiUfSoOCkMtI9URfAI5FOsVZNK/n9KjaHYtPSjRR4O9Rd0JaURzaPlYDbJ2CflVhLNS6S5LIj8sMCqONzOkH8Vcrls6d3It7v40GVdtmUHIBo1/ndfEdVKGa20r8InNRICXz9x5CAL7B5c7Uc8gaXDikoYGf8aM66u/XWK8k9KyQ39wqumjZlVBXh/Y8aKQbECVbE7k/Cqoh+0KPCGV9jCT7Z4JGksatg2J6+hu/f4w0Hqvxh7kAO7HzaxRR28jhfIevgF7i4chtMfz+FqJrCm1owU0Q9+K4iqFoxZLRnodzIbOKoOK+bVXdLTnSE+hC2GHaEotsMgb4Msak02OAlVDmPOFmnH0ivL4U6+XULHZyERLKjSW1Feeiu8SiHc1Br72+DCr9tOiQzxWu+46MKEMDd5o5CPAUbg3bV8Rja2HCqbjDXIA5X;
	4:gMTS+YeGveqOWYxpyCsdRBzFevs0vmjWCkrymayX0dZiBlOV2Bfo8+5ayQrYA8mXU4wZBxgfkoKHz8FqR+XUJIkwhCrJ+K5ROzg6nyA3DTlbDFvKIjSGZhAkZUFQalUTHBQi9R6lCyhbnCRN/cnS3KXppBmCgxRDvRohc7zDIXQOkS99F/PDuET9hMICFSm5PzuLj7FvGiZAbyfx16LcwL6xOszUtr5blrS/PHFSAF7vhnK1YBqCN9ZGv5ETVK970nRtgeLLEFGVwypxfKw+qxPJccjUtaeFL7MOKZLDpM2zaQYp4wxO1bjtiJs9HMG8z7TqWzFe0AhPUnTF2QbFbw==
X-Microsoft-Antispam-PRVS: <DB5PR02MB11754FB23D364696BD0301B090570@DB5PR02MB1175.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:DB5PR02MB1175; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1175; 
X-Forefront-PRVS: 06891E23FB
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(105586002)(229853001)(2351001)(40100003)(92566002)(87976001)(47776003)(50466002)(77096005)(33646002)(42186005)(5001830100001)(86362001)(68736005)(50226001)(64706001)(5001860100001)(189998001)(5003940100001)(62966003)(36756003)(77156002)(5004730100002)(5007970100001)(19580405001)(97736004)(5001960100002)(106356001)(81156007)(4001540100001)(66066001)(450100001)(46102003)(107886002)(110136002)(19580395003)(48376002)(101416001)(50986999)(122386002)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1175; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1175;
	23:1sVboLYjom+mbrGvnaVpslZTVvXZDCyhpC9eFcjmb?=
	=?us-ascii?Q?BTWroFPFbhtPVNKyaL2hf7ppF9NLZS/k+Cl1+d3JFXwnQN/rXV/x4voa1ylK?=
	=?us-ascii?Q?J54/8XiugPU47vrFAaa9EiZLJT38gNhL3A2YF6FOg8sRWJXm4/QdP+muZ67B?=
	=?us-ascii?Q?K3QLMOUF+zVmlQOaot6vAdkaB6Sg0aWoVqjKW7zsWQaoalFlEEoFApSRCmdH?=
	=?us-ascii?Q?36ZOA97LncoinPm1FxS5/76Xcozd750GqpZS5tqsmcKMkj+PvKxk2a8d3miK?=
	=?us-ascii?Q?z7rPVtHjPtAkNRpC9Jw06K29WABFe6zjZfhm4byXlx8JRRuWj0wF/FLM/uRj?=
	=?us-ascii?Q?fP4QK1bo81Igcq6w1AreWpw/OgNOVq8We//NMlWfmRkqcb9v+alTYFH7+VNM?=
	=?us-ascii?Q?nlBUficuaz2V2MR6NQEhQDsLQ3FUo1TsH8Gpwiy1RU+EF8oWUNANlbKf0rC3?=
	=?us-ascii?Q?BD+epr3+HJUbnDd1O2NQfQQt6XD4P4O0IAXBGuNyjyeJHT56d5HAYw/D8ab7?=
	=?us-ascii?Q?o03+ARVHwn1mmsaaHpdFgzYXvrRMp18Wl+kArtP8QlDD7MWoKRIhrUC0X7BY?=
	=?us-ascii?Q?X+ZaZxIEdZZvprTZlOFrSqEFfiJklzh2BDNHCMtlDTj0+gp8vGSLlkarjHOQ?=
	=?us-ascii?Q?7lfev1Q5x8s1abmR0HpXoQok9i6cM+dm1s2Bd6AjOI1FMp+ZYRXDRZ2neKgK?=
	=?us-ascii?Q?m6l015TW/3uXb+v7PkI9b5xa3n/wS4APpFphSXgIcKmRvRT5uPV5LhTUxWUj?=
	=?us-ascii?Q?cUFvKPJxnnVIl0ZPIdnOL2UMK5MmbnwdoPlCSMjxckVMdlPDgqKw7jMe2LXe?=
	=?us-ascii?Q?LlpldQu3L9fw4s4Gx7Dd0/N5MnLxt+JdJip2QMTx93Qu34ey5kuY48vNfkZI?=
	=?us-ascii?Q?jn3GXj+5vztY6P9rMmfk38M1n6ZuyYB4hc8Y0LLDwfaJrkacZ1uqJojWCjwL?=
	=?us-ascii?Q?9PD1YLK0bPSCx3tIyaDcnD8Hd4+RGxhukudkDFO0p5JLgBWZSg9241Aw3Jjq?=
	=?us-ascii?Q?HCpuDDrHA+YfljXO4BgXmFkEuYMhL6ObLS4uMjTRl7Ss3ydVKG5K8nZ9JWCq?=
	=?us-ascii?Q?9hgQ1yzX+tYAhq0L+pp7i5kso4tPgGn5fhSvaiqh+v6KebWBYFINSdkopE2p?=
	=?us-ascii?Q?skEwBkcV+3Dz5EwoGKaxfBSe8hLcZE7Kiq6TsHk2j7BoxmWY4Nzz8RJNzOwe?=
	=?us-ascii?Q?N8QPbzMqB2hPbrpwb1WzVYjl9OCWuAdByeBWFM6G4HuyDAOc8IKVPYfhQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1175;
	5:Qoyt9Na7rkw5wCYZcsFgdZrlQrmY46n4+TOOV1DDJpwj8ECYVXFg+O+4FGt/rBuRUJM/B4oXUSQhdmFyQGeRC/SY4utYltp/QdpLnMj/fo7MSfc0xuHJfdDC26RUmCNioSyQkm3ffKRiM8i+n5UzUg==;
	24:5tuCNr+p8CIK0AMsGnSQHyat1R04gqIlqSJRzvZsKWTYrZEut+OxJm3duM0bZ+mqlhZ4gLZ1F/sLDqouod3Sjez3EVuYHPVRs/M3/uVx614=;
	20:Ppvqf3FhP2kA4JVwQba0Ge1u3Sqk8GfxWBrDu6YmyxlVbbbgAgvlGHc6Re0bXSIspp7GUoTrnkVxXvtEKk8gWQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2015 08:17:31.6575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1175
Subject: [meta-qt5][PATCH] qtbase: use system sqlite3
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
X-List-Received-Date: Fri, 04 Sep 2015 08:17:37 -0000
Content-Type: text/plain

Use system sqlite3 instead of the Qt's internal copy.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 9eac6d2..5d3d3dd 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -98,7 +98,7 @@ PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
 PACKAGECONFIG[sql-tds] = "-sql-tds,-no-sql-tds"
 PACKAGECONFIG[sql-db2] = "-sql-db2,-no-sql-db2"
 PACKAGECONFIG[sql-sqlite2] = "-sql-sqlite2,-no-sql-sqlite2,sqlite"
-PACKAGECONFIG[sql-sqlite] = "-sql-sqlite,-no-sql-sqlite,"
+PACKAGECONFIG[sql-sqlite] = "-sql-sqlite -system-sqlite,-no-sql-sqlite,sqlite3"
 PACKAGECONFIG[xcursor] = "-xcursor,-no-xcursor,libxcursor"
 PACKAGECONFIG[xinerama] = "-xinerama,-no-xinerama,libxinerama"
 PACKAGECONFIG[xinput] = "-xinput,-no-xinput"
-- 
1.9.1


