Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4A576CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:45 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:43 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:44 +0300
Message-ID: <ba0ae7c766dfb10b924e6281e546f3828e315eef.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:LD6YG+fNR832dMERLWngCjxEbCOA2nP5ndMEMSV8VXBrocFYFiLJt0xjGyyFXp1MksQ/qKgv6k7L2eBU9RkVGUrsac3b7Yssx4KSWQbiko44ZVYNFaf5YmQXjQNCkH5x/B2DBcHs+QoRmnHcW00EJUHqZgf3iFAcL0xTIlHLqGQ=;
	3:o3anjTyNqA4Il8b4Hwh2oy/3MEvK6qXg5MPV2hAaNuO3eLV9C4sdIzD5SEQG6HcebE8Ne8vQiI6CLZzP4bOSbWusjTcHVg6pwe4jYOscKgU97KccMq/IJkxoSn3yEnTqxS5u8i8OdJT8994G80Rkyw==;
	25:qPbSbR6VcQHaqtmc8kwb9gZ3dqpNpIJvXx2JCtOfmShJLuRDT/Vx+xEguEbJVcsimbrR4+S/1Oa3K7UlErMwUd7iSR6qeOtIpJoms2FI8SNZezKPNEpJiEulK6atSOfclrhghhbUa2M16eJqYRhUcwyAeHNAwn5dYY4HjxvXRv25dLegjOPg/k7JuL/Uwj/n4JsXrz6D4kjxO8/R2m+IVq+GW7MJBhmZHcO5xiEYA3/kwWdLkIl9Q9WXM0BFPYD0zLhXS/gUeyVbTnhKI2Pw9w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:QLtIWhxwJiKPoXBILuM+cZEKQKoRJhDeiXb3nASvjNwE06DH/JKaipfRBEafOZJur+/um7WuUI3vrjgelM2IfgkU+OEdJltkwSZ5t+TREnDCVTBNmm6I7RNo52EtvYttNC7EKfPX7KJJOS1ezgASLrXR+l9t1DLhDSpcsc3kX/Dtmy9qwgKHUkS+bEYOUPlGoTfJL5Y2s3/ycUCvd9nYR7Otuj5fMTCvOmmJmVwuSBOV19pewxfh2BP4voNjve4jht7ZxR7xobrF3ubFgU0AY1jtg9js8B4soQIQ5vX9fqOHZHBIlyj194K2BuV16IXQG11yXYwcnXWFixO5eHqEa9r8va0k2AkMovxJVC8lzoxsengBD7T/bSBWEIpeEw0k43f2jTlvnGgzmmA3nF+3Byend4RdGKxF3RVv5AeK5SUhLRHad2xHv2MjZIolY5CmWRwKKLO7fVJs6cR4R9+MfGVgpG1ObjMu3sseD4zUgk8rKKZFYWNoaDp4aERUr9kR;
	4:hs60iTWJjN9Qe0IfUVjXRjef9KQ/r/zBnPuNXPloGk6tiRMmK8puHGlz4fEyRxpVifYHERMwKoWyaif3l3t7TblKxkpaWgIco9M3pkyCES8Mk8D5NJm/N+hfENmT7BjHUtlpL9c11UEajOC9W7nhPXzSO0hDV8OSJ/UGCg9KKQvKR6aXQvH1REUxReZByWVQS/IUajaBXAomlwhq2qmWGG5XW1xmVOC5KS7psYh8mWMZFKQEgC0iyYGXHypMNnv0mEluB7q8cK76NOHnyW36TO1WitWILd2NLb4TNStIQvesnUMePosSvbMeC1zJIci4
X-Microsoft-Antispam-PRVS: <AM3PR02MB11723B3955191DBE6B21BACC90610@AM3PR02MB1172.eurprd02.prod.outlook.com>
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
	23:kn/YfpiQ1J7DMzyPDSTe0b8j6qWtQKB05CVW8Sepb?=
	=?us-ascii?Q?FMdiF1rzB9owhFOjIl9cne2MBNiXElIAQTYfF6Vet7xDpW1PsUzV+Nw3XHQQ?=
	=?us-ascii?Q?BZMu1mXHY+eM7cCF2stgvt2ATqr2bmig2n67n8ywOB2rA4gLk/xX0aj4UzhY?=
	=?us-ascii?Q?SDC660EEl5BcWF4/+pSfuzmNKWdlyMCXjjH72WDLMZCi3XLo3KDbVr/BN0y0?=
	=?us-ascii?Q?0celT3DOwWTpKx/6tOtuBkjFQCyGkgANTCW2LXJLm7reqxUdHIZoioyhFojy?=
	=?us-ascii?Q?IYOkQKYod5gDcPbBhVRKlmEN3Al4sxEBm9GpJ7fmCydqzgpUAd8m6AQ6h5XN?=
	=?us-ascii?Q?tAYBkh0Zgtumhksh8j+75Z7Vs6oVBiW51eiLZZExxSYBQqYoTktg+3KBWsPA?=
	=?us-ascii?Q?sWN2q+ntwUGEeBiNj7qRwQ84d8Zzg0OFEIsFBxE9ZukyFk0y2Ufo4fFiGN4o?=
	=?us-ascii?Q?/psY1Q/udsw230Gi1Kfa/nVmgvz/TWgiq0HfUnXsKcD/X8lWN18PMb6XvWxF?=
	=?us-ascii?Q?HI73g339jK/ravpnIb1Tu87NuD6QG7/YYLMGvQxW+UXBOdSnY9ajh13UjoWy?=
	=?us-ascii?Q?QFVhfJMQ3HuuabNLUsie1ybMsZ+uhvKhFMFNTlYoIiVEOOOqCwVN2a6hWDos?=
	=?us-ascii?Q?jPtI4RCkFpVRpCUrEL7cqGDZBPWfLrydZqigucnyHcOMWJhMJK9LMX709xxl?=
	=?us-ascii?Q?jDJlnHiT05sbNTh+wu+Pj40sYrJawkWHSj9XEeOq77iMTfw7qcBYIGH5LT8w?=
	=?us-ascii?Q?Cwr08HifwQy8HdE5NqUsjtKd0I+fm8FRa1revTVZKzzeY5H3YkAFaURk/afe?=
	=?us-ascii?Q?qS1D4rfYxWFFP4jOfBn7IawFUaEccX+B61seWYpVi3G7cDpJY480MQh7wD+w?=
	=?us-ascii?Q?AFhr1Q4z2uIhojm32d8+eborDJzYF4kUx5Aksiiwi85hFz31S/Cb7JapGwOw?=
	=?us-ascii?Q?jDiIozCwr6bZ8RktkeV4sYvLm6klvzKf9c0kdIIIzOaFvH+yPCAGpWEi4Il4?=
	=?us-ascii?Q?CNiobfqmfufHz2KDd3cx4dcQy2lXBiDF/yndf3/xdcHOxiPaVy6NZG5oQA6k?=
	=?us-ascii?Q?dPk5mF/xRfYmdLqYU/086WDjamEoZUv1hRQVQ3BRW/LBHCNN3ApzOg7bw/4I?=
	=?us-ascii?Q?jv4zBPmYinww1D14EqSOvkVc23ZDb0ItHGZJlgbQ+JtVc0NEltMJVbnlp05M?=
	=?us-ascii?Q?Kl1egtixYR73WSK45/dtwartPSEG6ABIWJ7Ft+ax+Kbv51+8G8ptNCtDFKjj?=
	=?us-ascii?Q?4ysqdfywLqz92lhX+Asl0Q080qx5LU2RzPVSAGZNkjPakSA7wBnrCnmOciq+?=
	=?us-ascii?Q?8js4qXb7ibMylC5jBXMQsM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:KjhKxj6qOlUqr2s2aW+kYNfYQZHUQqd3fsk5iO/N+dVKquVk2+ZBDWWLD3YZdD/0hFY+ZSn0Ue5R68ku6yYvGp9OUHQEqUfuQj5ns0S7cQEUMCRkBKpY4yCSVes4vzitb8ZqxMy/iWL+6IzI5VuEvA==;
	24:dijsQY6kqsGSoCrvUaopvS8WK6xLFEtPzWMTO1fBH0FkhG4RUaI1J+W6p1qEFkKVt5cAX9y6ibdKT8xj36wga/l7ibrKWS6yMjtnVZXAuQE=;
	20:CQFwLUG/Cxok90Lb3lyv5mfRxA1jAkc8wf64beUBRqcM3p2esquApujPIHXCKxdlVjsOUf9TRq28Bf5rjq6K/Q==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:43.3892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 02/11] qt5: improve Qt module package handling
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

Make it simpler to add Qt modules to image and toolchain, without need
to specify each subpackage separately. All Qt modules should provide
the ${PN} package, so create it even if empty. Make the ${PN} package
also recommend all subpackages that are normally required at run time,
namely plugins. Do the same for ${PN}-dev and ${PN}-dbg packages.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index d0309ae..ef849bf 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -47,6 +47,24 @@ INSANE_SKIP_${PN}-examples-dev += "libdir"
 
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
+ALLOW_EMPTY_${PN} = "1"
+ALLOW_EMPTY_${PN}-dbg = "1"
+
+RRECOMMENDS_${PN} = " \
+    ${PN}-plugins \
+    ${PN}-qmlplugins \
+    "
+
+RRECOMMENDS_${PN}-dev = " \
+    ${PN} \
+    ${PN}-mkspecs \
+    "
+
+RRECOMMENDS_${PN}-dbg = " \
+    ${PN}-plugins-dbg \
+    ${PN}-qmlplugins-dbg \
+    "
+
 # extra -dbg packages
 FILES_${PN}-qmlplugins-dbg = " \
     ${OE_QMAKE_PATH_QML}/*/.debug \
@@ -138,8 +156,7 @@ FILES_${PN}-staticdev += " \
     ${OE_QMAKE_PATH_LIBS}/*.a \
 "
 FILES_${PN}-examples = " \
-    ${OE_QMAKE_PATH_EXAMPLES}/README \
-    ${OE_QMAKE_PATH_EXAMPLES}/*/* \
+    ${OE_QMAKE_PATH_EXAMPLES}/* \
 "
 FILES_${PN}-examples-dev = " \
     ${OE_QMAKE_PATH_EXAMPLES}/*${SOLIBSDEV} \
-- 
1.9.1


