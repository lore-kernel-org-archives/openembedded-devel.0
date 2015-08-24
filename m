Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0117.outbound.protection.outlook.com [157.55.234.117])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1656AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:30 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:51 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:50 +0300
Message-ID: <49af71f764e706c6fba4b00d220455385b3d095c.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:FZtF31kHfKPML1dr4sFmxH79FaXqfxq3Mp84cpcZn3QtZbWOHEklmC8PL/Yj0kqJEb0xb7xKaOWix9qtxfw101YFGaVVv2ka0hEpYhvELksKMZBr/7FsXAQmQrxHnWGlZ0u4jrbAT4nDnEouhwc/cEMKglg1zKnEi6bYadACelQ=;
	3:0iRueEyPyrJj5wFoljUOVHqY7MKw56BsX1TniwU/14k2zxiv8kVIM2+PoauAjiEOVDSmgEPRmQKQeEe9OMfvrg79zMdNUFQ4mxNl7y968CzzHv3wDD71KnYq9GARMJxoN0HUbZEhTHnIsSAZBofAQg==;
	25:mTtp53y9ensNI6/vO77xjuP+5OkrHSkKTLIc7jsbzoOTcwyp9p1ksFaSBZWMWCgSw8w2dkfnBU3te4lOKjEf7geMoDyZ8zAdAVCi/6tsWP7SSTHOGj/7LcuWcfzRnMF1/diAYudIShcaIYAaKRmy3SLhoSowvpavBeZDuonm0YW5836zn3m7GEBpOO7K0DwY3NGhOijPqCTtAZkpI+rAmBlKe8EI4UWWpthMhTma6FF0rgIFX48EReJzKXrz1IABOO5YM5K5Uj277H9YJaPdwQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:+EdUIe5C77GgZA4563SuSNVpMHZz7Z5rm6zLxU3qi3jNuiIZR4PVGRjRGqEmPg3C7u+DNt6/3VuiacnrDVjbqi8500ZuRzEv1U+8IPsO95Z0FhwvR7xV8Io+eirtTxX1FWIOww1cAMCCkeLEaIHbJLncOX7h6fcGx/opAGFBngIVqMS6IcYZiX62gwA3pz5OT+a6lHJzyrAEKOUFNcCwglngiZFTPRPSIp/rfHB3tF08e+L/7+DCAc3cA2jsMb7ve69CRewYwsS2swXNs8tze7hoRBRHuHNHEdcyXRtMzTQxboHzvBqd3xNJY0hpojzfuTvBMuwz9RYUL3MGhVE3/x9yhEj7Y9sw3ruQf1ZBqsZV8c2DNP6zPOy9lmQbbp2IKuQgYqAHyz9miJf3vqi3QszFf96w+h0si6a9gfd2AOnD6yoKKoUHGL4N07HTtaeE1qYGpQrWsXiGfoTAJcl6pEt/Aq6Mt7dc53KET3u1WPOwHSlI4oYLj+ZgnKp4LrFm;
	4:oY/KgRgqBjz0Yp4UF9K/OWl1WesWSEWNPYUgJKHdYM2e2VbVK2bMHJmFzVvsadv2JaHuBA2wSMJZ9sfIRquwmIL4uwxJt+4zJEaQiiMWAcQmL+k4PoluvnUylwOKBY5ceBJQuIJ46OEyeLoqigmT1FKrBJTs+xZ1MKi2A/cmMcyRtGZJmlT1su0Kqi2ymvwjV45Nli0ydPtLdK/D+7Wx0lPc60IDkVlQ7IGANsUUrW+TfutZvgb8UKgd1l46qTUYZAD4ECoh6wTp5Zeq8h7rEgvFHuk/97epg5U6SGN+MOOJDZ55tTsJJbcdS7Q2Nc7V
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174F89C4FBC4BDCBA92811A90620@DB5PR02MB1174.eurprd02.prod.outlook.com>
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
	23:ng3bR+nMaWQm+rOHzzzqkyr1upFMHp4bT7ziw5gh2?=
	=?us-ascii?Q?0uOKtBVjnckWITUI7fq5whJJg3+H8RThlTpNGMWOatZFHhTPFPyyRi4jZyZC?=
	=?us-ascii?Q?DUavtxkr/tFGElOvU0Rk4DeI7t06dPFPhLijtFY/1G/4vuXMi1zmxcVxGsWz?=
	=?us-ascii?Q?0HaRW4NuvNtc9EtoEE4QozTBb4FGKxnMneTJWGQz6ra1sr92xzFH2cl8Ftwq?=
	=?us-ascii?Q?ENQZGTGbjWztqDg4ouw2tg08WDe9eX1vXPwkCvuQXMHYkC+6tFmYyUcO0dTg?=
	=?us-ascii?Q?wvtFb9hcGNs+VLh+hNjYPvgP+89WW0x+8u4r2T7haSuEWfZ7/ypk4YjaWHBY?=
	=?us-ascii?Q?GD8ibpWHT5Z8/LNXyj9hQQgiyb8fT2FvHmqLHwvVUJZYS1dAbS/lQtaHWPGL?=
	=?us-ascii?Q?Wkcxg6w2yrKFoWQpYVsB0ciJgNHYJmC53DBfbyHYQE+Q2ZYCVPNdd4QzuABN?=
	=?us-ascii?Q?Y3g5GkHr5eljtDfl7AaFKv4o5HBTn3T7D8IcPyseK0Qmgf6sGsSyqzJFTJbd?=
	=?us-ascii?Q?2UrZ1IqmlAWxZDqa4MjNfk4yTSBR+sQ5SYK+jgYhmQO0VZP+K8UsAomrnfaT?=
	=?us-ascii?Q?FfcUSeAEUhKZ1Y3WZINrkV3Zhe3zsLpB7DV6extJ1zOF0alxQC2qyjvs5FMJ?=
	=?us-ascii?Q?ZylfI5NLc86kpb4fJhKlDaLoqx1bsOH7GSSDsTEHGtshKSG7zlGA/NHU+Lx6?=
	=?us-ascii?Q?OcqnnGr0hOqgSWV0tNYgmcT6KIXdYNmDoiwT+UAR1HQE5xBS7UvpdFv8I0dg?=
	=?us-ascii?Q?P/8QSPp7b0dXFNGfE0oFFCAWcUs8/808+F2k64BEi5cFPcKABao4GCRynLVw?=
	=?us-ascii?Q?aCyvdyZkIHxTQUZ6cNcuH2yB0BkP8edO3XTBnz5ia4y1EUE4OiDiA9vSZ+ca?=
	=?us-ascii?Q?RVluZcZJwV3RpK6pNtSkIYvXiQi+LBnjqbb3V9/IaNEcgyf6Tur9hMU+aLk/?=
	=?us-ascii?Q?yCGsYmUtAJR5a8EQc3/6lGG28TlZ6Km/07Nqls5op01FzpNxWCeQAJ1zVenJ?=
	=?us-ascii?Q?3BDqr6Cr3Ny2DQaro62bZevsW2iBLIAGrVM7LmYcknhnHzBrOPI6D57JCzc9?=
	=?us-ascii?Q?cUZ28McDg7fDQjCzFtVMseJq+9hIk+iQcTToP0IdpPNkHlxnYJTW8PeavfqC?=
	=?us-ascii?Q?s4MozcfVGhodprm6HMjP0o5PVpfJZN1vG2LU2F+q2Ec9JOfv7UftvTRFtqam?=
	=?us-ascii?Q?MD45jDD2ImdQFqAP3rwcC4L9UTqQ9YNfeL8Jfir/M098/FqHW2EWCyjFarvU?=
	=?us-ascii?Q?7z0Es/knht8hf4DdJM7L71k9DNKztDVlDYCli30ch0pIS8KwYcgZUIWzrYcU?=
	=?us-ascii?Q?yQU84FKbVKyfH1gNlYNQd0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:qbA8d5YbtZXcaz6GdJHAQRHYgbiQN/ELGv66XL7Brk6GO+BS/CEpEOrQywvPz3QmiVFyR/M8P2+qJcO383HzPdjqrIKZVoUqQ5F4TvfZcsB81MYGTMjY+Sd9QL04AIraWGqBS6QeY0M9b79fq2TFuA==;
	24:LW5G7ehfHVJ+naZUGYsQOHzur3h7/Y3+7BlOjfIPhsrmP48F7zcUEZmZhs891fjesjI2ejbvF54hh1n26C/5V0KplQiO9nbV90iP80NBAxI=;
	20:nzYBVTpL/nOEaQWMU52wJwKW1uCv4ZcQN3HkFGFH3Xv2nrsA/YWSgN66IE96Hwke4XLc3yYild2nzo2xyPCYIg==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:51.3031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 04/11] qt5: add host paths to qt.conf
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
X-List-Received-Date: Mon, 24 Aug 2015 09:29:31 -0000
Content-Type: text/plain

Add missing HostData and HostLibraries paths to qt.conf for qmake.
Using the target sysroot for the HostData, allows us to remove the
symbolic link for the mkspecs.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 classes/populate_sdk_qt5.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/classes/populate_sdk_qt5.bbclass b/classes/populate_sdk_qt5.bbclass
index d29ec36..3f33b23 100644
--- a/classes/populate_sdk_qt5.bbclass
+++ b/classes/populate_sdk_qt5.bbclass
@@ -4,10 +4,6 @@
 inherit qmake5_paths
 
 create_sdk_files_prepend () {
-    # make a symbolic link to mkspecs for compatibility with QTCreator
-    (cd ${SDK_OUTPUT}/${SDKPATHNATIVE}; \
-         ln -sf ${SDKTARGETSYSROOT}${libdir}/${QT_DIR_NAME}/mkspecs mkspecs;)
-
     # Generate a qt.conf file to be deployed with the SDK
     qtconf=${SDK_OUTPUT}/${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}/qt.conf
     touch $qtconf
@@ -28,5 +24,7 @@ create_sdk_files_prepend () {
     echo 'Examples = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_EXAMPLES}' >> $qtconf
     echo 'Tests = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_TESTS}' >> $qtconf
     echo 'HostPrefix = ${SDKPATHNATIVE}' >> $qtconf
+    echo 'HostData = ${SDKTARGETSYSROOT}${OE_QMAKE_PATH_QT_ARCHDATA}' >> $qtconf
     echo 'HostBinaries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_HOST_BINS}' >> $qtconf
+    echo 'HostLibraries = ${SDKPATHNATIVE}${OE_QMAKE_PATH_LIBS}' >> $qtconf
 }
-- 
1.9.1


