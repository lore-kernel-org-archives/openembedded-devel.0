Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 767FB76CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:44 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:42 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:43 +0300
Message-ID: <f7c705865ed574150e379a05345febead2237e07.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:xHEi+JdWUHoKeGKhY/GU6zJCAkWZxvPhYwPmo/yilmEf0tJx5DNgJfy1Zp3swAl/5hqoyIXxRg5kXVmPCfc8kE+el4Zll4W/ov6O6bcpMr/22mBHc6vruxCcmtnY9XoimrnyUZFsYw4iP3CVzTBYFQ+Wpc6vVyrGm8cSmIiR3GM=;
	3:jVzL5ME3kjU8CSgBaOiaAPPDla+xdMAwBMuV0S1Uw7b3xlGFArzfOp0yEFOJRVk1FjsjKcWuk1Y/JCJKGhB3LatqUDDb3Ufx3kPZjkOoSPF+o0I4SO2guw04K+JttvS7o8lzvnsGHkMBH7rJzkfh0Q==;
	25:gFzh+AF3Bl9BLCRJn3RzyxXEfigFKIqEF3bGj9IN+O3zGQpL1VKTLI+BowVhohPV5b0UrrLAE+SJYpzuwiitXzZud0WPXYJTxNDYZ0QQZ9hwAEOLMBxZac7a9JqxuVZKVGLrLRYvgEW7j6vd7VDimHdlvXmEGjBIOqbSphkU1FIgnUWmN50QVVOKtSzAw7KNrB+KnTEHzv061+iDFVN1tXnqK8076m+fl9sqKCrYZ3up9SwzL2Lg6sek3JxsP/k9TQ8zc28TPyt2UrmeSQhIWw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:cAAVYsAOFJoPqknHJ3alYA9JZ8gR4GHJK0Xx6s/qIrGEuYmqxBb+j5udDJ4Mix+yZwcI9CJSHa63Iok9OGagQAuvZS5TkMT3dpZsEeX0n6WtwoprQ1sXWB9m0z3BpLvXBT/RNorfAPSqffUIK1PtVEITnwbv26P0xhxmsXe/VQAj7W9jcYvJtA7gTdBtezqRsaDQ2Q3jY+duh96iIsRvJx1TJ0cFl0syckcxZTgZQRfl1U2+JG/J3Je+N483AWiEB1f/Ks9mNF0qsMs0kBriiXGYAeKudanzwl8tB4YQ/kd/73e6+pqYV1RHydXZG1N0ZuS5AK1ZLdB4FvIF5x/Tggt5ce7B6uumyMUNTytxREo2Euhj3TSiLQxY0NdSm7nGBE0cAjxFy5kJlN4yvOpgXXdVX/VGo8p2oojlwZH3r6++bw5MQ0HOJVWsch7U5P/eIonFqNWXH3lDt0rGVD5oWf14oxHxbM3Rp4aYHMJp1116MUSzI0VD528fm0db7JPv;
	4:eq97lT64oDpTH0FsmYWqR34KZaDHrjBASBLHgttRZaYbBgvkAa20WIa2Poxzmk88Ej31Vb371icU4yQz5zCWbY6mek5qUtuN+CEcqqsXKlSnfeT1U7hE9wtg6VI455/Xftgi1uzb4dyQyou6ZeX8VqgsMR+xlM7lcj9LxF9qvUVwaAzTUa6HOW/zi8cItxilpuUstnE1BYc0PfgEJmR6h0AVMFLskzqI0YAK8+y+LPtmcgdM4BsGLnU4PU9etkw5MrMT8q/PWazZSBSXjoOY8sYjrPe54t3SxCrR6CDSBQdHjRfZQVzv5kpVQGcj3y3w
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172F7D584EA00CCFF5CCCE690610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:bop+eMz8alDzl1qVRJzlZfSDPquYfZywOLKOm1bxr?=
	=?us-ascii?Q?GtW4b5f1+ANCDmyVNC114N9A5edRpFoQMeGwcgac+D5NP2O7rBvL9nhDvwMc?=
	=?us-ascii?Q?ns00sHJt3Lg70kOzN0LJt5Jptijg55N3KIJ0Czr5tbOI2lkt0rYEsTDNUOZR?=
	=?us-ascii?Q?zVN3OWp77cBATvoSmFxY9ukyhngXixz8BboDQZfNwQE1lV2iSWgxTIdyljvS?=
	=?us-ascii?Q?ZFX+xuH0C0P7nbgYl+451MmCIEEIwOTEe2sxCocGfv1imodWJXnHk7odsky9?=
	=?us-ascii?Q?IlRXGvmLRx09wZ0+coWGRI0TzhzkBdHEgi2TD1BhLeNCgFThPCx/FmNaClKB?=
	=?us-ascii?Q?GrqH2cBSxbBMF5spx+yzLxa9TqKkqTlgMWwdPBk5Tr3xlzue00uh1xOh9loL?=
	=?us-ascii?Q?88JtPqgUAUbEMPaZmy6RyTek7DgPgPkzKUN8lHrjOfslAqxeWr1O63hQccxO?=
	=?us-ascii?Q?fjgioVSJ5oxzgth6KvhVm3ZVOr1EogEp2HoxVwImWliT7EPDLEyXTRvkxR7/?=
	=?us-ascii?Q?wt1ztEH09zp486qnOfAVgmHHyRHjRaKy405BCG0+t1b4PZh0kfWhaWucTGMe?=
	=?us-ascii?Q?WaruP4OiipnPlIDdY9TSZNT39RfwIMIFGrmuAkqeaNk/gN3bjpXElnoNaZc4?=
	=?us-ascii?Q?5gSndd0J8lP/6iYA8slRntvv8TxCLegyUZp51Ul88iAlB44gnPnVuTL1QCNc?=
	=?us-ascii?Q?+yfFt4JVPOKewU5+4yQKQEk1qTAfQh1cN2uv6iqLLZcwJM44bw8Qplrm5CpN?=
	=?us-ascii?Q?6r+yRcUpKI2kmiCwzs6tXFJG3UIEZpksnprLs6ETh7hfwLZHuerAQb+bw9/9?=
	=?us-ascii?Q?gfxeq17D1C5KWp6Ztbp+eTLIDIs456aA3PMZZYXWcs58GNPpV3EfPjhS3ePv?=
	=?us-ascii?Q?Qqcri3PZ9CR/cSDWrTm8PTquVSJEVCjC0RYCChqck/kWvggZLnsBPiVmzABV?=
	=?us-ascii?Q?Dg2d/Dd4sxjzxr5AWzanvkF24Ym67p77p4DD0oyuO4uNL+x2Zyycc1zXDtTx?=
	=?us-ascii?Q?9Vqt3srcJvAqkjqJTkY+4je/rQw6xcqh6F+JBXtGRbP4rdvk3kUC0M7f/dQ4?=
	=?us-ascii?Q?VR8oAzcO6CdF6k0yvAGpmrmbgzGPMLhFUSbODv/PmZr4n2Pm2YF77BgQw79j?=
	=?us-ascii?Q?8qex5Pn1RKLdQZv1J61rNazDEMICu/JtJvyAZc3nyfHFHu9PzmBy6NOgk4fz?=
	=?us-ascii?Q?8T/GtY94jvL6dJvDCd+gURrItexjUyP/fNeJQJz79/umWLulKVIFYnpvlVAg?=
	=?us-ascii?Q?3HGV4ok+aMjaV1TMUcLAdEf6wVTX65YipOewDMOTfNiEUjlwMPEGve4+i+gM?=
	=?us-ascii?Q?zUXhb22AZlg4phx8JQBTr4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:m7YKtwkqPkXIKYwxIbpCujN5wC90jse62kNYSC0hBGb+d6lTBAlIqcJUMeC3MUF7m7IGqjEDJLTcuSpJPBm+vUsh1NyJYYvsg8JiWEPqTgSy+38hWHNGq/+/lrJhQWzN5/I5qIBqRGGxnUPApp4CxA==;
	24:Q3GMweOuHBMd5ClOkAS1RmguZTKdTnyPwC7IummKhS8oNkWeS4y1Y1wkJ/rv0Kw7+YucxFeMouzQ+zIXTaGVZAeyg20sKn/5aF8eT3ucTrY=;
	20:djp1fWgQOhZv0C6eXePkPzaOCHpv04eNnVHW/heng/o+F+MPDwKCqubB9Su6lFpjujnrrFn1IIb+iMdBHMveDA==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:42.7641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 01/11] qt5: make populate_sdk_qt5 reusable
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:45 -0000
Content-Type: text/plain

Move task definitions from populate_sdk_qt5.bbclass to the toolchain recipe,
so that populate_sdk_qt5 can be reused in different toolchain meta recipes.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 classes/populate_sdk_qt5.bbclass      | 5 -----
 recipes-qt/meta/meta-toolchain-qt5.bb | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index 79df489..d29ec36 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -1,8 +1,5 @@
 # Copyright (C) 2014 O.S. Systems Software LTDA.
 
-TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
-TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
-
 # This allow reuse of Qt paths
 inherit qmake5_paths
 
@@ -33,5 +30,3 @@ create_sdk_files_prepend () {
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
 }
-
-FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
diff --git a/recipes-qt/meta/meta-toolchain-qt5.bb b/recipes-qt/meta/meta-toolchain-qt5.bb
index 8991176..11b7962 100644
--- a/recipes-qt/meta/meta-toolchain-qt5.bb
+++ b/recipes-qt/meta/meta-toolchain-qt5.bb
@@ -5,3 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit populate_sdk populate_sdk_qt5
+
+TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-qt5-toolchain-host"
+TOOLCHAIN_TARGET_TASK += "packagegroup-qt5-toolchain-target"
+FEATURE_PACKAGES_qtcreator-debug = "packagegroup-qt5-qtcreator-debug"
-- 
1.9.1


