Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 5488F76CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:48 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:46 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:50 +0300
Message-ID: <a3f9a448b2d41d4f6e0b27a3365e72d7891995ce.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:g8Olnyujy6hZIT6AAmt8O7WqsIfSpIQSAghTCOtMf7UbuXf17vQbCiMTLwX3xrPd1o5XBO6Hq1GS+YnrhcdrCCUFXjPVB5pG2+9STQUVkQip/VnX3NHHnmERoEfuwWIU8On//6H6Rt48HSKNuTe9Cubr5oOrcC+zTa+d3IY4cOI=;
	3:ingsBUalpA+bYyxHsHpj4SOcj3D2J5pf+UK23tsX6aZ6PMXO1G7K7kpMsrnpF7BJHKbdcIZkq8/GbTV2uXfPm9fXrOQ8FIYrBOooAbAc1SOacTMcCO1RsSBULkujg27BK0LCp/wMGTrkzE7eAUkiFQ==;
	25:G8nGpjK56j6QX5DJoNEuCHGezTgVfb50npCkTGewUvidWy6q47uV24juGtaOsLtD8UQ0EEpDBR26QKb8muDtBywiK7rVTnPWwlDULowz1ZDFjpit7fFTRQUJWYUJTCf+JkF+xQE8XLxkG+fe8GaLg9dWZFU+QTeNBII5xlhfyotBvb22AZue/tLK4b+/U1TxfZ3juQILc7o8/LkZUe9Uuzqk/vCpSdnR5/Sp2IPE71RFjTS47fOtekqbnEGJvlh37dyQLQ5eTUajwJxGeC5l6Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:REiRv2FlnNN9yx+pQHNERtPf+if4g4ITRpS5UrFdVqmKqdAECKNr6yLYBb96o0gHZttbnQazuEWjzyiBpYUuXB4/ps1gITmKqXTx1wW6iiCFHHV0YjKkVD0TqQx2BN804+m74ep6TFx3UzW7C+FrvalazCLJT3nrXDbMY3WWFDNNX8t0ivj+257rypmaYJ5dK+b1og8GwPIQIP3N0TYvZjwjVWtPpyvNbr7XaoKd4/Wgmg4aJSPymerBwhVhiMBR7vrWoKNJG8MvyWytiw3UbmRhfYA4huZJoyEuqcXkgdObjW4rzyeZYa+7cIfPGAnn4J7Fk5R+ZKeNrp3Py9jZMpDzkEzemSEAYRiUa802nuFoUr7lHy8utejE57ZlpwT/PA+4M/biUEjMlHEQta0cHSp5IaquWCMjndHT/eoHFjIevJyrcGVWV4Lg6qRDq5+fbYY28v4vQNxo1nTN8G8UkiuGgwLV5Rd8AFiE15+/3E7d+782iubRjxWoWKbUaKe2;
	4:oa+nfJg2FbZUwD6ma6MH0JtzNdFK87cSdc0xoAmuElspnOysMoXHeM5bJm+Rpqmu9CNM1nRlGzt3XTxmntWLhNkdHunjPFMBtnjRPcrKhour+/OPdW10xuxT6SRhDNnd2PCY7nYx9PUMT14XOLxBnnVhJ1FFzY9eT7gQfJDJZsQ9O42RKJW4lcq2jb1uOTPBLwGuJLox4T6gS8PEgEpklbQSSDPAvw+vbR+X0rTqIXGOs5UJD6gbipYpXe3kB7vj+FJCvmVDySZPbh9E/OJnklQqqr4ZdB7kGlJytlHpHY0HNJrA+nrHalhYKyTR/RZX
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172FC1074CD98DBB85F814A90610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:nB08iK0+S79ERmjcBHIc0oiEEXVXqnR4VF9dXMC+w?=
	=?us-ascii?Q?CI9pX91ydmjhZRD3GACbtE/stCetNXLTZUC8z0W8pgONSggAtwXVaQGZuxHi?=
	=?us-ascii?Q?NCaXwGWrz5D63mkGMK/gBLWHhNG/l2SC4kfYaWx/lp7WtBl30sQykI/vYgo1?=
	=?us-ascii?Q?UMcD9Lw700z38mcdxFPQ1g0mxx3ulk/MEkkmC2kJy5a0Eyai8wlnSgWWryTH?=
	=?us-ascii?Q?r3prTuqeGSqf6XfWYIwRmGf0tBzsoUXpyeU8gYBrYuk2TedBXVqadKgOaJxt?=
	=?us-ascii?Q?ua/3KM+ZjkXOCEvl14wIZNe0b2QKYPsbmfHR2C8pDy62H17B+3VwtIvMdzm+?=
	=?us-ascii?Q?DleoX4jeEMQ91zZvTTfHrIlRgIAQfrKRueI0sJqnxo75yoLerHtiDPjcCDI/?=
	=?us-ascii?Q?6Qt8IoGIjY70YqrMBbbnsseyZoW3nAYwFb6FEr5KeeB+Sa8y+ERjEy0PgdWh?=
	=?us-ascii?Q?SY3zdPNuXdvGQmq70ZmrNc0eh9NgHJ6GRoIOB9+GP3ZhNqso+KjrufDDFXyJ?=
	=?us-ascii?Q?oyxHVsockEp4oLUXOBgrTrVX8YxKP4nS3r41AhGIvnLjSCP0+m5jXYyjFOAL?=
	=?us-ascii?Q?HoeNtQSoZjwV0e33FcZPhxWUQE0+Cdxc+dy3a9cLr7biG6O0e3eAY+P+q82/?=
	=?us-ascii?Q?SXpUTrLJ06BoQfpUYYCXYKbGi1f9sD5wV0+YxqQlKFNhbionv9z7bGvs93Oc?=
	=?us-ascii?Q?nfVbBPuggVIquwTgowa4l1FMaQykjLFwFX0u27FUs7NYbi265GeLPwSCh8CP?=
	=?us-ascii?Q?r9zRBSWHFLoqsm4itl4xoAaGHh69Qe67FGxt9i2sh4ip2yM98zOScUA9eDxs?=
	=?us-ascii?Q?BrDqeIvkC2G4BJc+8utXzZ/NtsEyEGCRBXEs8Zrg6UmkbWDsAGUsaktGxBaR?=
	=?us-ascii?Q?LLCmsas1cXmB9KKPzd1535cu/qt9RN4P0QnLJlDPMLn/F1YWNHfixk28qgEE?=
	=?us-ascii?Q?+Etd0+QVZN9XFwcoYr9b753FiF7LScQ6KBCMVzDlZzID67L0nGE1WJ7/Vfbi?=
	=?us-ascii?Q?Ve6nNPQ7x0qscHGJ778AWCsDWBFctY2pJ1iW15bYY5mLY0EHMO+NYqwdZ93e?=
	=?us-ascii?Q?Tud32TrJlVoTbT9yGW7ns+VzFU0iPGwb6EIAwkQb48VHLpFQjxHU7FuGzgtR?=
	=?us-ascii?Q?MEaNXAe+SO3LEBFDRWoQlMt7Wtw4x6ntvNAwu0Olxc8yQPHKuc8ylUGDfV+n?=
	=?us-ascii?Q?x8SnUi3ohd+dM5kuO9cBpMwPM2bt3Qx5knhIbTM3zfs4fnNiAK0tCoL82CDY?=
	=?us-ascii?Q?eNswceZHVZNo1FJQ+UW7LblDqVomkTns3CPjhtlPmr0Zw7lDFbjHs7ANnb5G?=
	=?us-ascii?Q?BpxBLuoZTZDk4N+458J3nU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:kIPvl2rZI7g6U2YmpFp471a64DuDe7ZgC8w83xGr1UuVe8cUVilidv2SamMAwMBlznP/6HXfZtCm9mpZxwL/aRtiQrUVUJblL7Gg45pvanYcMa+oPzHdhMCA2z91hkNSM7RxI1kh/37duMh5duk9Rg==;
	24:am/LJ1yIZPBaD1CW6xdmQCHV0sHNd6/l4ZLgbj0y1naWgmE0P/ykOHcPDpqpbOHtEfmtd+Vkzy0khMQByZOS+uGFE08yMT+38XZdqViogT8=;
	20:MI5hBXRQawDY1baQBuVhvmM3zQjREH6zS4SPYfvjdNpnumMEwuBe/OLDM9ia29LSy1qDGOUTxWF0Ila5ge8hLg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:46.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 08/11] qtbase: remove dependency to sqlite
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:48 -0000
Content-Type: text/plain

Qt defaults to bundled version of sqlite, so there is no need
to have dependency to sqlite3.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index cf77a44..be37c92 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -97,7 +97,7 @@ PACKAGECONFIG[sql-oci] = "-sql-oci,-no-sql-oci"
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


