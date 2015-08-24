Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0114.outbound.protection.outlook.com [157.55.234.114])
	by mail.openembedded.org (Postfix) with ESMTP id B727E76A8E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:13 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:49 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:48 +0300
Message-ID: <f36449097b046a2dd326eeaea20cf91249ab2805.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:AGI8BQdvOp0VgJmCo40T7olkTpop+rYeebOlPmCFh7mWVy7+NFyDPJ0JogaV7eU/DfKnzSjPRfr92xyUTaaUfsfwXkzzH46ajSvlNrC9KTGtE9mgc4yjjLFh7QwZcPkH/d9pEONBP9okX1GI6b1ObRQh4yebnAefJAz1HLBzXqY=;
	3:31Yh1oaHKNzYfvhPeYAuK5SoGc6lDHocJnzzESjBVGZLH+3kelNjAm2BkJ2f6cjZWkJJYtVqMjv1Uy67caxMesHv7XiN/rgu8qN9MFC9PPbN+LQElg8MyKh2NQ3cXheXRIhKNXDhdTbRrTM/OmyqIA==;
	25:9A+/amkGp+f/6usvQX8/RIMrgNOe+Dkf+1+k/lFmYfoK2bubt3sUrTjjPKqwIT+t0B57jYuQGAzaBEgHYEGU25jChaiHP130GCORuBuoRSk9s4wgRXrVt35e8XYsRhWNXUI0U/Dv+ykGSrtPI/b/TJOqdkXFB8SwSmWPwdez35PpUN9RGuUJiE6Xg66OxE7UULlC6NQiL1zTbM9p4otrLaR6G61vNicFd5ID/PCVwsxHAk0MB8hm1arRBONRud9VApMVz2Xss9bsX13mRbm7zQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:ghyjk9jSiTYfTgQicL0EvbZ/lCHgHHJl48sYNinKy4LqlLe9Y4jqIA6ZyyeoIWqw9dtcMR3l/GmFC5dudEXBvehF02rCLcgiqx6D5e0Ugew7s7whTIqC8ET3/JIgS2RitppJPlGqWkVVzE0bRUsOIMrbLXjYbCLM9qRF+KkypqFJ/B9SD5wXg5l00zww1V1O4vxJikeFtvA+eGG3AaPxw7UWcUdbgJfOA57l5HtxsTVXCm+YQlkisoT64bG3Crut8VZUVtAHXbD30gil74aG/TsuMzPdOmDV0AIO+xGwwgZwBscmg5ZlKxePBPaLJ1r+GBqH3DmfoZ7u+/qAfJl3XijvUSvrlMo7zfXHT4YryR9SDx/YdKQA/XGt78Eksjt4JF5XbJM/82ldSpT9h/rZ8NhTmvFHiYCwbrS3iFyMMJ7HdjXYB8Av7uVEqiDRQCBabPiEyD0PfJKgRbbd6d8TewI4kjmqpI7JDXjv1uZGirGhyHEI6eGVLnYPQ87zIXy+;
	4:LSHqnvtmcfT0Uf2/OGjoEZidWaJrLZVsw9H6CdpEoBwB0xBQWe0anpFstswErcKOOFdUc2ZAy6nToUFe06eXPbwmlbBL88ZL3A0SYNY4iOg8KExaB4XyF1+94BNdp8PrHQx1Robfi6LsRcN/W4g+S2OBy2V+cN5RFBCyVkrFho217GsPdByrpHIrEfIrybDjU5fl6q/gyEBJEtQvhQ/Iw4sbEu3UD6Kzbrrjg58GDix9wZ9KQMplmz8snzEd1eGX0lIsFJmKxT8/Az0OggTKB+2RKotMRX+p/8E97Qv1z6TF7tN0x2gV93D4BWTpexgj
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174958BAF818BCF7F5B267290620@DB5PR02MB1174.eurprd02.prod.outlook.com>
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
	23:sHbBspo+eQv5kWzD2iKkWzLzzB2v70nCHyzGCF6p5?=
	=?us-ascii?Q?oAhwjPKqDv5Bu5OC0E6Ie8ZvrY+6MjulfQxFbYSJrozqxc3OAnB7D7b4OWWE?=
	=?us-ascii?Q?hrqqWiwi4wkvu5TPx5UhKSfcNEtKucYy9+Mr4vDQyURz2Moz44UNJ+vvqUMZ?=
	=?us-ascii?Q?utywKhz0dnN3rBqLyG+xGy66gUst2F506f8g33ruMCzErlxtj1spFhUIlyxZ?=
	=?us-ascii?Q?n1bBjk4IlIM02sl+faWBL1CSI9Lkx8GCYqpcbjUnPCXwkgECZTRLNzxigoJ+?=
	=?us-ascii?Q?vrGhuIfmxEMG+WKkV8ejL+jZKaOJu6b8o+5osm2zn882kSHtTkZW4D8ebZ28?=
	=?us-ascii?Q?kxyb7mTNg/3Y6XG3CxKW4CU2HsUNR1qkxi6Vchgvrc4OshlDPZ0i/7GmMdH2?=
	=?us-ascii?Q?WXDRryVDWgs6LLmfU2kGl+ZwBbPNfAZQQ0BwMNtRqA+ncEAI1E6P1PY4MFas?=
	=?us-ascii?Q?75cimwsMpvc7DcPsmOrb8ZxYe3upkp/syUv7bC9+jtKm1B73DptrkjvM1bgN?=
	=?us-ascii?Q?1/QCdMWbH95e1hbfGVfII7cr92u/We5wD0RFn3NlGCsMW8nRrX05vTYcYMhc?=
	=?us-ascii?Q?Gzs7bPtPVJ27lnfKWTRLoOa6yOabVnOOfGZsDAExrE28jyBUeeGg0eSrEMbj?=
	=?us-ascii?Q?+ujxYPAzI5xZuy5wdrQZ001Z62CJ5ad/KwNKE0JYFchF8g0v9uKHtm7dI0fc?=
	=?us-ascii?Q?vH7N/TKTeIaT1fQonxqlPJhDS/3RvUeo44NZdaraGQnvkDtaN2olbsbMqCGO?=
	=?us-ascii?Q?BQg36pAz2yEO6nJucgzJtm0gyvw1GLBeiDAoANrozNhttdXv7VJdZcjnVc2j?=
	=?us-ascii?Q?5n4bmO1+W4ZdLuAj+Z1ClAt/zab4R38N/O1cT6BGaZxKXz4GzbLMlBsL+Tjk?=
	=?us-ascii?Q?JZ1E0uY4DnbF9+i+ZyN8EbDPczxBcmGWOgJu6LuF3fLE+ZbzDIJSAG4JzBp3?=
	=?us-ascii?Q?iMd8ws6+VWsSvCZ+aOzpb59jqhCgKdwMFeyUElnBzVRN9dlB1heAtFCUn/0y?=
	=?us-ascii?Q?9C9x9TNVJbIUFOMOcDq8ioqz+A4FGmZRq5hTAvNr1aRCTl3tt2RXp9KIJHpt?=
	=?us-ascii?Q?vEmVB9mWW3YtvkYkhl7V7rhrWjKsZVsOwItq5CEyBlL1qkCPk5I5t6F2CQAg?=
	=?us-ascii?Q?a2xm6C9XOGDoPJHKYTjX8kHSyz2qcTJaKa9XavJdTKZgP6VPUuPbsnjh5Jyv?=
	=?us-ascii?Q?7O94gD+xY5Ur3LNKOtWnBT8oy8+vheeHH/D2gh/efc8A/WaH7o57ToK8nCRg?=
	=?us-ascii?Q?HlfPL0tdLEUJyqkVDsD+5UQ6w3qehlVIQmzkLq15VoNcTl2kQ4n0hXDxf/Qt?=
	=?us-ascii?Q?SO14tJ49OW4LScwCAl7ec0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:q1+t/lP5mM1OGiCbAotseYY4w6lUbBXXSqZvDLJt9quX9yHeLSvMt/8CD6Nk7Zq1H1BsTnl+0Iq4cc32FE3Vg1lVljSzNum0w4ZqnNCiAw3noRPogdeGXdOkxo1NzfI7idkhePJ8pB+lb+49NTnKog==;
	24:ecx/XLj9T+sfZ1uBIou02uDGVkdnFi0usnbalehHubk+FIpaNpTGkVxg9RHAMjnE8M7NjkdlmVfZG0XFvc3GaEN/jtPZ2PPYmRUy9KJp/Xc=;
	20:cnJEKCsbxoZjmUg3UbLQR9dJSdZyBoXnNEGHHg6A3qTD9BhizoATfrjcZfWVtu7SUpvNaYCBX05JEObP0BBjug==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:49.7408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 02/11] qt5: improve Qt module package handling
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
X-List-Received-Date: Mon, 24 Aug 2015 09:29:14 -0000
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
index 2fc5367..8caaad3 100644
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
@@ -135,8 +153,7 @@ FILES_${PN}-staticdev += " \
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


