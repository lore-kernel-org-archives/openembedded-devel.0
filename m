Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0127.outbound.protection.outlook.com [157.56.112.127])
	by mail.openembedded.org (Postfix) with ESMTP id 6866865CBF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Dec 2015 10:55:33 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	VI1PR02MB1183.eurprd02.prod.outlook.com (10.163.164.23) with Microsoft
	SMTP Server (TLS) id 15.1.361.13; Mon, 28 Dec 2015 10:55:31 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Dec 2015 12:55:15 +0200
Message-ID: <1451300115-5601-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: DB4PR01CA0042.eurprd01.prod.exchangelabs.com
	(10.242.152.32) To VI1PR02MB1183.eurprd02.prod.outlook.com
	(25.163.164.23)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	2:hhHf3Z9b/9bUOFFrd9gpNPcKwFxcDQOlSsL4WnWCGcjk/bPrBjd2oLadxjGKG8tRw8iyHNKS+zqLSSR5v1ZkD8mrc9RF9+4MrORc//ZQJ6Z/CxyNqwgpqz0HfzS++/ADQYsCVfM+RISuRpeSyqSPcg==;
	3:CJsZuKpOikpF9rYXrm+Jxp0W5RKmxakYmY/C1HAWoDmmfhT6lrqOPLPi/iz6HqyGFa/FNf2Xc7ZfFt8xifCOksOgg562aYZawPlWcnk6fK4wHKKAFF4PdZEn4Jhg3Kdm;
	25:YKuSwIL6qfKdyRnxFjQdXYsLOguS8aB8I/JfU5fxE2Ib9D1HNvRSqIJiLRME7fQdvQooL6HSWwVyfn6RXzGrzqRbqCS5E0CjOVDfYmYBOMaUi41o9KWVaz4ujCU3Uuqv14ZEmvFUI/He/DoRKU+44KLBcZ/77MSdnMrPqBacOV/EMwC/oNNp3hzrSJt7h49B1nC/ccx94ykaYvKnueWjm0/uMjsvdyXf2J1t2CJaG8NYCUh25nc4gQQl8nVgSiF4MTFyr/rs+8SnhcXasHRIVw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR02MB1183;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	20:QfgfjaRcudWqI4ghl6SGUhbXE3Uu0F8Tm+fM1BjAahzzfrJppqxBBT438tTq5DHi5zgmwz1OseFefTZZ7ynAMh8Q2/NEynGzGLvhj4qfm6MILBy1pfAo8evO9rsGOHBwGj7hjANdrgizqBA0KCY2XwCsaBChKReVlNha92yPdpCr8JMjxdZlB/Hzel4apfV8oZMrWzBPLteOHMB5jpE4wORxVT98T8eqLwTWBO1eFBKj4Itkcc602pgzH4r2Ap2PmXlitK9qvOKbd3+iYwelz6C+VFJL3TLg54I6pDWORKHgaaeauE1sxbe3ZHijE8LpPlH/t8WmYUk1VCd4PgX2FA3Ds2c97uYJj0n+L+08DpcAQoKqOxSjzIsKNIXThWqv0S3ZqLLis4VNRlRgg9DIyO3ByTASbXo33IeYfekEHrWFavtJnYTOLr2T7sanvfmWMDLslNg3cvVXaIQ2IIsufhv+N+Ssx0rWRgqpbymCAZaKBLLBs6oXlqr5xEEd0NGA;
	4:Z19EW9i9IhOnNWN682eH9z2osZTvlY1foryVuxGid1z7i2wBX303T6E5v9W+j4lKFcEInTu9lT1KH4PHbMN3iGfk53Uhw8f2AXx7qfqm6GnCdtJX9dzC8EciJK7DBlwUkcL2a3T5fx35HYEJR/P+jDMynCq0E2Im8h9LS8GRqkRWxTk2hAv7SS3x48CumGIrgsav5+vWKJSW5hFPZFnenvo/ioVUY3eIgPiHF0gBpYgR9hFePhkvseuwCUBK2cCv945jYonDGNJKB5bfIe6RVzFShYS+FhD7+Nu3SHCrWHcI7xxthcDaf9FqqETaIJisG6WBFVTaSdWSOIfQyGfoyqUFnSkbGVlJmU5nwSjmDImqQxjQMd5hIdvXUJOwNczIyWcVWahm4zCZ6FHcrKJd8A7/FboT0r4/IAJofOf13kd/LTFxXILZJqYMq9ARsceT
X-Microsoft-Antispam-PRVS: <VI1PR02MB1183E6B3B3F3E119C2367F3A90FB0@VI1PR02MB1183.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:VI1PR02MB1183; BCL:0; PCL:0; RULEID:; SRVR:VI1PR02MB1183; 
X-Forefront-PRVS: 08041D247D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(4001430100002)(189998001)(106356001)(42186005)(2351001)(5003940100001)(50466002)(33646002)(229853001)(5004730100002)(50226001)(450100001)(50986999)(19580405001)(19580395003)(66066001)(5008740100001)(48376002)(101416001)(87976001)(105586002)(6116002)(47776003)(92566002)(36756003)(81156007)(1096002)(586003)(5001960100002)(3846002)(86362001)(110136002)(122386002)(107886002)(97736004)(40100003)(77096005)(7099028)(129583001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB1183; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR02MB1183;
	23:2TGcnhHZ8hkI23Ev6A/Gorjhdq6JQtLp9xOYhTCX+?=
	=?us-ascii?Q?9H+37NBwmGCFkksKw03HH4u3XvKtHUzYM4+lFkIYMMF2fU7fvFEIOgFKBbWK?=
	=?us-ascii?Q?J7oYEcpEP2XTqeCrkujXcY3Rt+fRja0GkwYzZia7XanvcLAfv3K6Aqy9y4OI?=
	=?us-ascii?Q?e8HVSs4+BZQuIYwg58Gz/pBZDxKiXmBBBGhNrZJ1mN2AZvjAoTMJ7d5rRKHd?=
	=?us-ascii?Q?kfxbT7FIYJTpIpdUqH3sJGZNPvg3wIwyhG2vehVkekcy6axf4S0foc7FjgR3?=
	=?us-ascii?Q?jdWTO6u8U5KfhLYyp9VOns/gPRT0NxQNDwg803+24O8N1Af3j0iekU5W3BFR?=
	=?us-ascii?Q?40E4nqQy2v6LCcOJbGsTDDVQzRmQbmClXegmOdVk12DL8aAE/UXeljncRw4W?=
	=?us-ascii?Q?2FBBJ18I5SzMoIjzsiw3+JceoHhoPwrd2rtog+rpY1VD/8N2ONChDbDM/lWK?=
	=?us-ascii?Q?IBZnoHjtbkHceDVopNdX4cztrhVr47tZ1Vzb8t4kdRlu9cs2M13bPeowUIRX?=
	=?us-ascii?Q?4pZlszw9O/wmjVqXiD5UX/80OaGMwP+wsS8/LRqzHISseIzSzMcp0wx+DTc/?=
	=?us-ascii?Q?IOSqLlfyT9h3IbpGqYV8IaD2FwBCDCPXF++ViKcRuNZI78yot2EqMFa/VTVQ?=
	=?us-ascii?Q?uZQ7v69iS8VWRcqwnZS/luX0K44ECEMFXV5RvfE7YUUCNs1DzuQkB2WJ4oVd?=
	=?us-ascii?Q?vH0vCqaKtkkf8IjSP8pO7yIO4PQQrOJwbGhwqQoVOiF6w7QFrDuFggGXVECs?=
	=?us-ascii?Q?yVbHQBx7WTa8zjti8vDT6BEv/r075QiEEymDyv4SfNmRCW3uM9NCOM0L2VPM?=
	=?us-ascii?Q?iNfxGKXNpkSSzic/1nelEIa5TfCL7eHiwjw/93rR538ZKkuuqf4nvXMQK0NC?=
	=?us-ascii?Q?5eAPzlHtP+9Ii0+3F5CgdV18bPO+RJR8rP7eVjKJ9/zlxU7JCgz+rQjkraW5?=
	=?us-ascii?Q?UlfGLZ0ILUByu/MQchMhgYueUgBIohlw7L0aB0631HbcmOzLtADfBgvOjgje?=
	=?us-ascii?Q?Ury4RYoPpPYH/TnY/P/AlHVRA8SgA2DQyjPl6DgzoV54yvxh/Xc/wc4vCFfN?=
	=?us-ascii?Q?2Z8mWDcmnvca/EEJ4NQ0TWiY5kxlTQggJglWW3klmUImH1laUWkAytcpv7lC?=
	=?us-ascii?Q?gFsci7KRoU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1183;
	5:Cm6IoHvC53ZtMRfg7jwmTcLWFnIUSd+7SHk7k+pOI95tWQ9Xdtui7B9z/Y+zy8Jv+YSChVXLV0RPFK9ZsuZVeq9c8iK/lnE9aNGuZjVm8AeWbyCu6XorI49CP3URYgeG51kCp5x4aJ112GnbomA+MQ==;
	24:1KgF6l/NVLSa1DWp5M0X/Z3WLl59AecWt9tQMDwJetF6LFXPPm+T6aZLuoiHp4qi411dziJTROh8/YNGNNNhjKBMVX9pEdv/ztaV8DX55k0=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2015 10:55:31.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB1183
Subject: [meta-qt5][PATCH] qt5: add extra path to qmlplugins
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Dec 2015 10:55:36 -0000
Content-Type: text/plain

QtDeclarative installs file builtins.qmltypes under $$[QT_INSTALL_QML],
which was not included in the qmlplugins package.

Fix QA Issue: Files/directories were installed but not shipped
with qtdeclarative SRCREV 94e9fab2

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 4b748fb..ce9d976 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -92,6 +92,7 @@ FILES_${PN}-qmldesigner += " \
 
 # qmlplugins 1-4 levels of subdirs qmldir + *{.so,*.qmltypes,*.qml,*js}
 FILES_${PN}-qmlplugins = " \
+    ${OE_QMAKE_PATH_QML}/*.qmltypes \
     ${OE_QMAKE_PATH_QML}/*/*${SOLIBSDEV} \
     ${OE_QMAKE_PATH_QML}/*/qmldir \
     ${OE_QMAKE_PATH_QML}/*/*.qmltypes \
-- 
1.9.1


