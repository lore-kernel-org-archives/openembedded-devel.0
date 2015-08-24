Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0128.outbound.protection.outlook.com [157.55.234.128])
	by mail.openembedded.org (Postfix) with ESMTP id C072D6AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:29:48 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:51 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:51 +0300
Message-ID: <cb20d8340d861b82f6acde17682796104e362ca8.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:bc40fmMZfm33KhhgNWFMHOxR/SFv/eIvEOb/0JJWAyB22q8XHMeQE9hRRijKUc7CbQUJmzs4YYN1fw8nbyF8IXtzNpFwpurTOyUny4aSIWo9Rseoku/cW2PaNATEJmq7ZvTvdp5qMyvaxpOsn7NRQDP0nqUctqtnGLQKQ+se+TY=;
	3:nJD/QHI+ZNVxqww/zu+6w/4au1/0y53S1weU5rMuEk8XAxq8orETZztXoEMD2alQtvKqllwGQLLfwbOo9pCMKGX28pO47WIO+pbSLzFCG1xq8PLom+h3r5Zef84PKIayfpvzd7VAO4MqwsuoHg/IXg==;
	25:jX7ZNBA2HFHLOVXWWREl/u51VuIttbiV9SfcTMmgp1jFVkmCWQUAnQ+jQAyqW6YTzbqcrbPyu89gTChNHTXH28sHFxewER9UdzlBlpKexPWJmcF7lOb2SZjJX2JWBV42uhuxAYMa62p3/SGJl50lCaIPRiCVKJszdTMPx/JqMb2CL175v8ZDStvEz8sgyClUUGK1XZ1qbw/LheRujQgDT/pFcmlfOJMi9AmPIbO1v0Hu7zb4uEkg3LIiOzELPyM77mny5kK4kFZzQZ6rSrPJqQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:ixZAbxABVZQ4Y7yCkjGy3NoNV+xQO6Z+JjEUHEXsQfJ6ojjEpMOUa8t4ZiauUdMBZ170nOIk52UZfsEvl42IsBMrCHwf4/pTQ5JnpQpaA8ekRojKcJIRkM2c8mwCOWl1rxJUrrOeXO17wrXFXbTZ0kpavJgdAQ9gh+GEW1IuxXGJC/uKc5GIJkvPdN+DISz4GNwAPWUHxzKg/Pa4IOKEWQwe4KOx9z9fOXWQw2wy6WVmZYh8W6sIXEa/wDXr0pvSbN9v//MnV8Fyzjatc9zixblb9FM4zRlmNaLn1Phg+1T/tBxcmqVCNcrwAyyKIxwF3esht21P5sFNhNOVP1bjTaFxeSDW0Tqwh6Kw6yF5/LgGqkbiDkA0yNPKAjj1y3KZjKj3wYg47sN/+QicI5MIFz/+rA3mZedQ34miLarO1trIo+xcv8lR6fGU/FQT49lWgm1ViQKA9qOzZe8Tyan5pOE5/YT94oSzq8MZWWKgdgihv8VPR5JbbQii8frHnh34;
	4:2RpfMKPPHfimi6dTOGpSDyKYsL9zFOLKfFGS96Mw4pZn3CocqQ1zxPGg801GEz/DXjEJbb7adsaaK0JxnkrCQ7B0/eX857svrmaZuSfQXzS0WIzD/vpQSWME8DnXL9Pyg6z5H5IGs/MKus1c1hqAooVI87IKX0YlT7InS4sQET9dz08hh9R/PU0/KYVhcqry5MmsRY6x28ytWl3VprD4kEDb+DivDmipLuuiDPSSqIQHZZnThjRYzel3v/uZEW7DS0uo9repfh9WTolX076NKF9keMqa2wq6aJg5HEt5c6723KA7EtMlGEc22JGAfKXk
X-Microsoft-Antispam-PRVS: <DB5PR02MB117490D430D774F1F56E782590620@DB5PR02MB1174.eurprd02.prod.outlook.com>
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
	23:S+xhnuN1r1heWTP1Iso0KKOj1JLXn+nct/Q/Lf9j6?=
	=?us-ascii?Q?YCQ54hYL70FwpXRxP8faN6hWZL1YgcAtZNDzhUc6w29ZG/GqjNpwOurJ3Nfe?=
	=?us-ascii?Q?CdGiYUcRLw5jj4O1Bz4PxZ85Fr6HVnU7mOQOzvbAn6iP9s+LIiGJ8xGdQoFk?=
	=?us-ascii?Q?q82x8Y6gfZGlVenVJk6gTr0/RnrF4DyEwkH0RWkv7EWxgxnzmAbLEawv0FpL?=
	=?us-ascii?Q?ezjCDMdKFJ6aXQ8mD8bPaJ5C5TcCeQOEC7IFq+Tb7Yc05pfmMR0unlvN/qWk?=
	=?us-ascii?Q?jQ8ZZL29hXkZQCpMu/+oIh2AV2EPJ1XDFj8FQ8V26dlQrmM0DC9IahHitiEp?=
	=?us-ascii?Q?fdTzMB1cK+YO2FI7zmpi9iTipCegxO9nJCpimp3Fx+H009WqHEjSxLdxHXK9?=
	=?us-ascii?Q?LAjrng6WVDttBTrpK24O25PnYnKXpscgoWHYA13owZA3e+KSLlAq1oYLzVaU?=
	=?us-ascii?Q?c5vl5WaTIj9/5958EP+rQnzYNv1BekNyRtvu6n1axpmCSniuTAjyyPprTvoY?=
	=?us-ascii?Q?kdRoOOMxTCD24VhZ7TxRPMbCwUB3uK/3LALWPjn+cuPMMd1EHYvS0daVgqqQ?=
	=?us-ascii?Q?UXj27kiYIMiGpnVya30X67YfBi4duXoriTZFZcLFrI3ABk0r+fl2wePaOfNZ?=
	=?us-ascii?Q?335R9KWATyap1Fo2CBB/ZV3yj2+ro1AyuGab9ToK1pr4Pq6oZsDZAwFXtCZz?=
	=?us-ascii?Q?rRza790NKd0t0x8RRVOIgoLRcZ1/NK7/vnQC2O8Mv+liZUUINySivIabac7e?=
	=?us-ascii?Q?/ba0cpoZEmmEDjfYD68ZkdyUSzUlQs5oVJ3aG2lga6qxKWuNhCehxxwEi0hF?=
	=?us-ascii?Q?8LcgDk7UW1Cpqi7iMQjAlMmcteNN8OpK6CFt0iU/VZVVoPiciYrfPFsTELbK?=
	=?us-ascii?Q?BhAItABBgm+v0tFWGoDphugkeME7xPcFtyRz19o6c4GzrQh21GhD+ZfFPH2I?=
	=?us-ascii?Q?1B5QC6n6Q0rs65bwUDZpvjFl0/WOiOcaExm9uqg8wJgKYc+lrcARaEm0S1zM?=
	=?us-ascii?Q?pnit9xAifYsTkT8sWGoV6S5ILGFgmljr3Jfm5Qzhb7LlRiwXX0VbnpPxLa+u?=
	=?us-ascii?Q?CMrMuY+iJb9nYXVsiCE/4QyAmwzFJq5iz1+43o0up1hyAjSpL447uwS7vzMJ?=
	=?us-ascii?Q?lQl++xDaGi0tX3LnFrJhbZDJVKbcupI/4oRJ4m7STcRYfQ15xwVIm3WSQ5TH?=
	=?us-ascii?Q?mrw9LouXkrtNxHGGgw1sV8GKvPpcXwiMJMt+uLNDZ4CvNQ6s9WtuQ9c1PZ1p?=
	=?us-ascii?Q?fEujvN0ORycO6sHegm9rkIv1httfxDkpksS5r2oSWa7ioN4hZIJu/EKmDrcL?=
	=?us-ascii?Q?I8wMC3l7xRZKHRQMsc9GtE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:DpSvPaTt81FI75+jRmvMs4ANlRdCLfbiY/uCtGRyGrDY2d8E0ms7fITXdcBf4svdNwLdNLeqYx6W8mIrWmaol/pTVOW/92kNzMSAY8LTQS39mi/+62bRtak/FWSl+Wn89/7FhaEFHPpa4x5wWnGtcg==;
	24:y8gQp4dq4moWxLm0hRIbHcvMqdpuYGe0WqXr1NtENvqQj8lvvMNtW/1u3rD9/Mp3dfVTF+gJOvxPLlGm4DEMYgMEdVthN+2p2/RqVy5+Hoo=;
	20:Q4L+MRI0yhJntoc+1AsVLdS545mH5wccY4znocLH0DVFHLN6NszeYlzEQPoKJ385Mi8dgiTNFJbly/lBMJZwBA==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:51.9593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 05/11] qt5: disable debian auto renaming
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
X-List-Received-Date: Mon, 24 Aug 2015 09:29:52 -0000
Content-Type: text/plain

Some of the Qt modules have multiple libs, which prevents debian auto
renaming to work correctly. Instead of only having some modules renamed,
disable renaming for all Qt module packages, so that all they all are
named as ${PN}.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qt5.inc | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
index 36d77db..b19d271 100644
--- a/recipes-qt/qt5/qt5.inc
+++ b/recipes-qt/qt5/qt5.inc
@@ -47,6 +47,23 @@ INSANE_SKIP_${PN}-examples-dev += "libdir"
 
 PACKAGES =. "${PN}-qmlplugins-dbg ${PN}-tools-dbg ${PN}-plugins-dbg ${PN}-qmlplugins ${PN}-tools ${PN}-plugins ${PN}-mkspecs ${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-dbg ${PN}-examples "
 
+DEBIAN_NOAUTONAME_${PN} = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-dev = "1"
+DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
+DEBIAN_NOAUTONAME_${PN}${LICENSE_PACKAGE_SUFFIX} = "1"
+DEBIAN_NOAUTONAME_${PN}-qmlplugins-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-tools-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-plugins-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-qmlplugins = "1"
+DEBIAN_NOAUTONAME_${PN}-tools = "1"
+DEBIAN_NOAUTONAME_${PN}-plugins = "1"
+DEBIAN_NOAUTONAME_${PN}-mkspecs = "1"
+DEBIAN_NOAUTONAME_${PN}-examples-dev = "1"
+DEBIAN_NOAUTONAME_${PN}-examples-staticdev = "1"
+DEBIAN_NOAUTONAME_${PN}-examples-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-examples = "1"
+
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dbg = "1"
 
-- 
1.9.1


