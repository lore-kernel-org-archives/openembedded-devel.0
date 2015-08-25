Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id D532176CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:48 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:47 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:51 +0300
Message-ID: <27a18e7c4c9289e1603dce0706a1cd01858ba4fc.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:czO2c0Yj0S2t9Jj8X+Y2kq9AzQ40XCRPvIZ1zQ+uLOTPi9CIxdZ1cuirW/Xnkyl77tvPpLUzrJ7uhxJkI+QY1jr/15OJ7Csbea0iYYPQssDMJnKkYM7mBDdNgcG52yYp+RfMS4IHR0qSus/szyWJ784awdatEjxiAQfEcFO0ALw=;
	3:0fnII/xgs27f6XU9d7Mg3/2iSXusnYyXwLZZIZlOL1dGwHPHHgoaPYpC6kn6tfqU9qub0GI7/aqZRlJM/ZjPIHHOD/taPXR2wDnCj6ieCgx0LmlkMlPEDFPaqt3Jg/aVrJ3A6Rpu6QAXGphGbskBKg==;
	25:wdB5oGpUpmtsTt2Yt8hRQSdyZMvj9HuCP9OWyj4mRtY8c5bN+nbXvDXFx9nHTChmeKFyLzv0bs3BJzKcPYQV2meKe4TqyvxO/g5EgHfwsJoigeZzgQ63irXmxfWEtYvN7Oq2k6Z0BHa12K5tU8Hncb1j0Xyn+vl9duutO6y568Dy2LxL/f711IBYZIXyDHUNx2U5OBRhGS0364lvZXYyjlrqBdXZfXR+R9GHGXDFxOZrLPVIehqou0AdsSrCx6+jz/4aA0ZDgRpNW0z9TCZOMg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:UFv/jreynV+zHDb9sGJbNc6Ag0CwJ47s0+lfJeaFhin3CiUDRNhyKGNZj03N4v0URsS+Wlthh58czkQndH9Iozi98+gSQX2vfi6QeiqjnK7LVtgSEeftxtlb3BSLvujqUlu5nFXSrCf397JrH4j8gIHbPz1+rIblxtV0gqlV7GjGAb98gSiBW0w5C9ALFA6b6iMGEh60uF99rZ+lHS5+JJVFSaqG1mtadqXmO1CBIG6h9SY/KfZlp8iuO/80vJAnCyrxsE2pUAUJD/4r0w9Re76lDiBGIDGei5Do9USLsvofzpW9BnR9CGzGS6X2hI19Z4Ma0XOur+0nQRq9gBK0V0UTuE87S3KKR1aR4SWZkzFSjTOvnds0TcsfQzgPEEC68pfStfcFnLFbTxmvECJds5n/VJljhDPASmvSLSkGCyRqGNhDwJeeOgnu+6S2NZ6X/G9cz2FJ3/mZlSY4ObJTrBQSZxFW/Hatzv2Q8Y7rpsRDtWhzKMaec9ntvZIEvHbA;
	4:093A5CJrAPI75hD8eKCdcKrsDDwmb3LqRWFAn91y4rJ6xR0ZBkUYvAt2+yhF4lUW3jQ2b1e+dxeupn4gPq00wD6erDTffVZMunUCjkyGJnbQzk8ScmCPG91prfSTTc/yVpte3Y126Y7lZj4T5VKV3efLxOLaeMXgW7A9t0V81c4OrAtX0lzcbotMT6y4ezjXm4anGqGCvtwfYenUY7GXAWan1sDwFloR6IGt9bm4rASIYL+2NJd0D+LJx2NU4+lkOplj3a7TV7Pf4MnGUA45w76Y+EzGK7wqY5shoCwkAtD6c4p9bU2jvvBLY/cij73p
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172F521FFCB450384C556B090610@AM3PR02MB1172.eurprd02.prod.outlook.com>
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
	23:hfH8Pg7vCkrJpY0aQZWVI2gDQgwkVejDT8GHh8H3W?=
	=?us-ascii?Q?GxsGJfToe/QGEf5VSlChf68Q2NJvEkJZJ/oXDXQvPZSRfurTFxiT8bbW4rJm?=
	=?us-ascii?Q?eCcy8IxyzEVPsCC9DO0gN/gN/gIEVeJdehBzk2+3sYd3DaikyE1ACLCQOmvy?=
	=?us-ascii?Q?U30wNWVVN/EkBLtpQFtzUHqrr5JpCZABvKwa1oBC0xgzwZOpi27yLztYgIv1?=
	=?us-ascii?Q?0B+nBwKNgBAfRNig7fPgVyBiTILcuh3oHTncKHIQEJJT+5+1IvaZGrwOcfIs?=
	=?us-ascii?Q?dmtOFhLrWZ0ZNyg0eIE5xoJ9c2pFMc1UHId9TvAwPNdjpah+Z+RnVv6kz846?=
	=?us-ascii?Q?o/9KnsWa9S8WXWUMJhN4V7HC7yWlihGZkozBzzG2qP9uUS9mfoSrjDKGumsX?=
	=?us-ascii?Q?VBXx3ZMzG6ndVRuOiI9ir4M30HRVPdXyo2LTHGDNe31ks496sppIMXO02MiR?=
	=?us-ascii?Q?oOOLcNXyo3ovOGDNLw/UsxwflaUO8c74RBTmRaFSEUAAJD8DpTaXTKe+WNGw?=
	=?us-ascii?Q?EqGvSv9N9R4BpaUKq1Nw64Gs2nnK6iVo/p8qoxU6VOo6RUAdB9DuWRDmSFaL?=
	=?us-ascii?Q?G6fyofuoJ89CAGgeB7O6gRC6HnuugEYF20iv2CPc4jjepYeiqy42w8osc0X9?=
	=?us-ascii?Q?/DeozsBHVTnzjVFp/iJLmXJFEwbjiKIHyBgydHjMfOSQkqPBhauy6AHXw3Vl?=
	=?us-ascii?Q?Dn3BMQxdV1ssME2wNID3naJ6T5yZQpoIApyePtyyKFIg946wW3XioFOYPhe9?=
	=?us-ascii?Q?M0c9LeyokU6QqJHKr7rJWTbMTi3Fp6+Rw3sUO4hn3R7oggoyP9jU5t1LNYO9?=
	=?us-ascii?Q?cGXaBHkrOTzR1RIOgGM8CoW5vn+fm2ptGl1KhS30rCgKSbcZTRvmFO97RwhB?=
	=?us-ascii?Q?wsISu+hpqAEC6KtCDj44KCgp+6QdXp8t1x7BPZ5IRIcwXH7YQU1KL7AU7tX8?=
	=?us-ascii?Q?L1+TtJrRnqGPWxPkPZVp7AIFfzv3kSZzJrZ/IKpesNGRKsUN0M6fUZDM4GQc?=
	=?us-ascii?Q?D70RAFlqd5tTp3Ic0SFqEoShtRMfYacvQ9ydCxrV2TW5qGcQsr8GDwthOh6B?=
	=?us-ascii?Q?sLwjzvdplRdKRDUgp/3d2lvSpwLMV491oyyviRO0e1KzkZuakHT1GdbL3uxL?=
	=?us-ascii?Q?GSSYXoig9ghueWi85gPJGHqiaRRqhGeVo8404Ye5l8o1rTI3OhOdX0j56bXq?=
	=?us-ascii?Q?R4YN74UcoCJmB7RuTCOe1302Di/sAT7OUkn0EuUkAcnVB9APKSQR3xgg2cJO?=
	=?us-ascii?Q?9axPja0wMDRZG3SARHZ74iGVQJw9EGWEpMW+NcnAARh6qKYP76D5Ilh5xGAa?=
	=?us-ascii?Q?jIxXLflgQ6bxriHY9Crf1A=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:XuKjs8fCUOrXB0Wf+6l07iujZPAycfeMfwfaq65HhldgcUnseBoXTFprTazaYaaLlZcH6es5UQ6mRHnDewhoKGKxvgtm6iRy9tZNHcVpZz4+UYMy+I4xc5ejIYTwNKulthuADaCMV5G1JTRdbqCkZA==;
	24:OSBUIxjX9KYi0pxE3Vn2TdBTaMN+MznTv2lV1q7mTxcuDdKYwJcPNA0YlIALHylo1rvd1X06KG+SaWat1m9vW+FWb98g57b41SJCyHG4wmM=;
	20:yrGLcYakhdhoPed43vn3mgrATduRdQN4dyQ9EkHobmlvsFdz4JRgNwctSx+aGcubpPm+lTsWgYdtllNRpLC8IQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:47.3424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 09/11] qtbase: PACKAGECONFIGs for libproxy and libinput
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:49 -0000
Content-Type: text/plain

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index be37c92..982be8e 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -129,6 +129,8 @@ PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
+PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
+PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 
 QT_CONFIG_FLAGS += " \
     -shared \
-- 
1.9.1


