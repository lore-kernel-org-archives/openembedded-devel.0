Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0121.outbound.protection.outlook.com [157.55.234.121])
	by mail.openembedded.org (Postfix) with ESMTP id AF5E275F44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:38 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:49 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:47 +0300
Message-ID: <87e12c0fdfbb037aa1ccf67baf80ebac7ee28c4c.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:wBTxfQSCeNeMaFQINvIGYEzu6x2ndJwfZ0KVTFCOqkdA7YGka19OiAVV0GL8Sj/xY/Yn6AlbMFYxPCw2Yh0cNsTfnJnFa58tgSYbDIkfBPFUSI1m76LHsLjbwAttWMSouj/yU8lOBwzZ0nU4pUA2UEv6I31FenAlmWwrgVGR7no=;
	3:LZJaFoQMkNU/j8qHRBm/9jcIFzWLCBY5DG7joqQaFoSLKPklVG9YZu7Jsx0tpfkrEIJR1F21ugqw2GXhRaXoTEKSD3pMm6QMkk4ysgOaNO5YIVDUac3LnYLGEVFCtlOdnNZFy+5M8U2Vg3Iut73GEg==;
	25:/uhu9gnrwy0XsISMXwzjrg4inspq8yfZabiPavfiZMJNXbjMzHMeTKEsf0wzyX2G025Myb80MLNycF5JOfzf8NWYtk0EnY2HGiiQTZIEHw9v4HHEbC+XKTmFwHqBKC2CGWN6h0UbftELxyC1OyD+91nS2NaOZ5TtIJUsWydwjeqJ1wXv1v0lmnVdHTiolWsPKs32cv0+1eECVhQ3tbhTFIc3/RQOcsnD4debfTjV8qkC3rdsv2i+DKy3MNWpYyoFfTMcfVhzlt7/lbd2/cOzmg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:bhrn8J39ttdN+9rdDmKDVBEU7sic6XXMwUnCGfzNf5JkQ0mDZzcw6Qo2gNLeKIAI55CWj0MIwb0q7RGF3OwV3b/qaTgNyfRcdKmKS9DVWnVtX+PF/G2qNZK/8d7womNBjKE6CKvAigQOtJmsudOTYUlGKMn7SGG75xGHJnyKqxMSJrZcywUBSM9V822Ky95q8i+7HjRwFsT4uPDn5fbtCPahp3B/RKckyC8cXPXyiVSnDVxE6vjv0LZ5NYxmdhpTsbLf0vs7fLK7c7Q6AwDr92ByJxiVjpwAuPUGUozDCJAXJMfvxLG3X47bbl/6B/ydn7ZNhRiI8Z+5syK0W3WgpGNlzyZ9uCPQ+bcjjiXDXNLvvj4tgEcxW5KaK+rWgs45Er7dvCW6MWU+jqMwijNsRaFMjV4CMx1Y4ZBjzyaKOa7675x8wqWJ3sCQ2liG3BjrKyeNTTSI0P0s9EiA/tSQ6vMqbV+BAHJbMfDhK/Prnl8wcEpGewfT92HVD4ayssPw;
	4:HRLGl6ZsVAOM4P+B0t7IZgB7Tqae4B73Igc167xCzx9F5vj3sfXz81yh9zv64U1j0zKJEi3PltZYu4eoMaaxSECjfXIosmP9WfMij2CScu+0rR6SeVomS0Mz1/plcI8XhWAM4zZNFiOxmpgMjrByrvmfCZuoAwFwuUWM13hCKNVIRgjHrBjcmwQQ3N5m6BmfbM9JteF1QlvW7HJPOQ/NUc/THMieD9EASri16CWAxotAixHXVrGCXvcXH76nLOLCemVYPiAMHx/0NkWHVLKAoXBBwJl6wJRnbyTfcgNitl1FoteilrXP/BnsEfKH7b3c
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174FA11BFD855E8329C49AA90620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:G+o8/iqglOmyENcyMA8iLEPL6umzx1SoaPmn1gwYv?=
	=?us-ascii?Q?5Y6kzNBRLtz/9FmXppbWCA/LA3CoucpE5JLx+3FWAC6PBzjieyKM05I9yE5d?=
	=?us-ascii?Q?IF7AQ15lqMhEbjgmj8vWOY9q2DNh1I+p98kiABptL1gqQ89d1hfWMRRiOq87?=
	=?us-ascii?Q?s/Fa6IqHxSDkntROKMGSIODffe+pqn34bHEUOJWb12HqS/kDM/ntDmJtRR0M?=
	=?us-ascii?Q?lCQnBhEgC7RKK35sZpfCUmLnH96TqoKV5/OMaLzIb9QQYeQo69pL9xmFZ5Y2?=
	=?us-ascii?Q?1La5s5V/4vfPwRx23hhXARYWPR15sUtQ0n6C67cxrWN7/EZ7iwk4pV9zQEDQ?=
	=?us-ascii?Q?l+AcDV4ggFfcyxatz65mpoV85eBgTfx8rzlVAwVVwlyqWPpstit549PQtBuo?=
	=?us-ascii?Q?v9YjiTbUVwGWEjQ7LKTI2LhTJ908icnGa1+0idHlmuGAT/Doh4GxCZfW6qq0?=
	=?us-ascii?Q?1+OlXqDPRpT68SZUX8M0UWUDQmtyA05Qj2S3DY3TnzNK/33o2kx1SAcuVb43?=
	=?us-ascii?Q?eh+5RJHwUKwlIP6vbxd0hIuXM/mGxKhlLkvSTePtMzg2zWcox05pljIsVAKv?=
	=?us-ascii?Q?VMgECmMU57883s23JIg/JsveB1u55GKHpi2RVfSbJ6AAMMzP5miEuwZzCJLb?=
	=?us-ascii?Q?c3mvRac+Ig0I0rLYk3ZUCwevBXdVXeTk0LuVMwu4FukRU6uLHD9rtbKKf00i?=
	=?us-ascii?Q?XSufEpAA0MyckkL4RJL7bwtR9/ZF90NtQurtlOR1jSAv9tObZ8IOOFv3YTXy?=
	=?us-ascii?Q?lx/7CwSIS1iD5Mi4DNWhB/t/4RUsi+3Vlmshp31yqZZyWuKDbE/27YLesj9G?=
	=?us-ascii?Q?ldpqOefPD+iGPgDZfsIJ7v4GOQ4ZL4PIv7MW4vdR9nOI02jTwxaUle0Tz7p2?=
	=?us-ascii?Q?E/yLrakAsAqFUVXfXpsIFoxuVu2LYKJELEt+csa28QFYmBK3spNJJgyNerSZ?=
	=?us-ascii?Q?w7F6OY/KDmkdHuOuKHtUv4PT7KQFijtZMZZq3c11PtUL7dF8XSMy70d1qI0T?=
	=?us-ascii?Q?98nZpso57BzaPp9w0fZ3ZrximPsSZUUgz2lt6opoXFx15am+3AuQi3qDiuOp?=
	=?us-ascii?Q?UFZl15uXe97+kVO3QGPDOqt+WPp1GcHmBk0K7t5T0AVV3PBU9vKERnWLQtN4?=
	=?us-ascii?Q?waQGFZL6/dK22nmPAFp+L3rlBffJELeL0yHlh1hBqRODaPCg0KewtqPa/e61?=
	=?us-ascii?Q?0p4Aw6eXhu/ulb63v6oN238Rm42WENI8DpekQ+Uu5yrja/akEtKOriJ98oh7?=
	=?us-ascii?Q?gYryOwavrbovmFFF2qWE7l6hnRA6QqGuNeH+Hi1eZMvEnBcI/x2ziin99qBi?=
	=?us-ascii?Q?qRSyfMJSjeIa+LCSiPgywE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:W9shRpMtWYZkkNF7Z3V29JQ2QTsLddj5uqBarz6v4uVH2zBNtXpzzN4SSejOwPmpW9zFAC5ONYR/boA9aljUVZ0Ncm59MekUHbl7y1iBFOFYNIFdfuNYraksf/wTbC8GMaVpui3xki+cCsyn7nL5Hw==;
	24:IHORQdLWlmZYXutpZ3ZA/NByv/gVYo7N8DzJmU2JpRYOC99NKFM3IDmebSPyBNXib2Xvwt5SNBY2Rvdxx3jOzGqlnt2HYqMBHA9aaEFN1Ao=;
	20:kd/AbLJ1tKAHvicG4s0w8gG7/9D9ffR1MOFw9DY5kT0xOlvnpQ5ybPHDMnMSQ3YaoBggEI04YDf1PQO50sW9DQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:49.0218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 01/11] qt5: make populate_sdk_qt5 reusable
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
X-List-Received-Date: Mon, 24 Aug 2015 09:28:39 -0000
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


