Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id BA42B76CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:46 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:45 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:47 +0300
Message-ID: <aa8e5f7733a5b247b397236478271575215c843c.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:DDKXM7soqeEn7YeKP9iHyA8auQy2jKEfvGKMNXuElo3tMCxwEC9Dgrbz7cISYC7szKtjGKc9E06sXPRM1k05iBX9agl/l3GuAjylCMUWGAKqHmlow4HtjJS8kEsFTZJEtef5AKzApseCzuS0DVhbj23zqZe+s++neBtYKFkJrvo=;
	3:yTkVQy/5YA4k7avsf03rXpfVS1JVRyy+JlJtof2dGGrqea+amFVpjJURLIPoaF25tJlJ4ctSmXSg9iC2Ejk/wiFWFpIZx7jtYrvWIEA1YwHkO9oIovkbXMOhl+a4U0v9/gxLwVgNUWpQZVOOGPJrXA==;
	25:O0PRZDGOr3O/GoRc1vZ0w7k5iRsNbtudzquudqTiKXi/Xy3fYFFyzKf+iqdX5AfEOfQlq0Q3GIQ0VjrMDn57REjRcptAie6/9zkMmZoqF5pLTbU41S1mLjKuwiOV4A4xLGvy+7efwZBReWjfd7+Sy5arjr8qD7qyg3EHncbeWBvm4uql2qISOeqhuKthqya2SYd+l1CHWyfMPXK/M1j7e+e7ZUTNT/h4UpJ0gOCaQ95ZJ00zvvYafQhZ3EUOhhf1kfElJDuJeT/QZQY0X1kGnw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:oWkTvpdo96u77hemYl8NpDOU6p74xkYbU85/I1jNzIJ+4W5UfhyGzQYACzLMEo+V/HsMgzxaEE9nJX4hYVlfZrkF1ZjrOkaW1i01NnJq2XgK9Bg1isx4fVzW/HkAZnQVvb3j4dQ1buNMLDhmsqh4z7I5ytwZVtStLpIwMqJFP4IwDuARFfr1PdFylT4qkHqjrn/7W9sLpWGH7/gka47gquZyhHdWIZuNIm20nz4K+VcdmuQCwhkH2ZNy2eVkO80qGxYjNoSG58hJXNSYDDBgNszTHT2WBxKWmAalW5hN5GroMAq+CS0hAPDYZ/Grf8deEMO1IvTciX4MsfWHFqBfJWg1TtW5iWAkaogU+fBtYmmg45/Jk84/UAdKJWg5TZxsyTlPFsFliUzFnTt5SPqlzR6x6BEFMHt0sOz1WSCdeoPuSxrM0orubexF688j5vlw3FHzStClGO/zGcQQ5osNlaQjKeJ0LvL7fkiqMrgtMnK5dEFAkiJ+SoYUeGEl954t;
	4:Qz4VqkkKKGCRLkH6U0AQlI6YgkMoM02EzCULA1uu++4pX6M6Omf8XFqCWWftD2qYClDBiVRECh/UaLkj6Z6qg9TISIkmhlzYwUX55SvDCPaytn6cEzISdgQAIRB27BRBz+LMgD9ByLC9l7lyhbojUMLANNlyzLCokkS/LjYy0jVp5oA9Wi/+Sygw5Su7ip5n9K2esaSx+8QgJan8EZnEe1If4Urd7qE6np96ZMmUBJMa+BqC9/8J2m/N2fW3qovN8dgKmANseoizKnUGZH0fao3IajsUzQpSe+7CBcATFqgL1ibcPu8A9GCL+bl3QZEx
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172F5F5761010629650BC2E90610@AM3PR02MB1172.eurprd02.prod.outlook.com>
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
	23:n6/4Fcn8n1PllGV2zZmDZeg7RuX5bW+BUZ3GwQaAu?=
	=?us-ascii?Q?39z+GP1fKAtDyWfKR4btDW2W/pGTRP3jx28/kcx/1AHIBwSE740ypuVUViZQ?=
	=?us-ascii?Q?MG8Ti6Np4ouvaIRxLVhXLCoA5gK0GqR5ObfVtab2t+MCEvmhQHglx5tyAr0i?=
	=?us-ascii?Q?7Y3OoKYpA6l5dRxCLFSfV5ZwCWE7lku3gAJvYs8VNpv1+LplBLjNa99lLYi+?=
	=?us-ascii?Q?NMcL/PA9zi1anxNUqCPUVVpyidLOYg5UhLk98Wm2aJ+BWIbXV9lnqvLPiJNc?=
	=?us-ascii?Q?U7jLlDmX0FNMx1ncsGCjiluhbwCjaYCp/BJQJ2dhm2IvWfCiJkYhwySXun1S?=
	=?us-ascii?Q?HBxOmb7OJn+JFm4o8BwR2B7NnMkvF0+NuCWSjyvBU1FsSPVlbrj8ZOWpnQ13?=
	=?us-ascii?Q?oS2LtHNozbvlliX980vSVbSJ1jcdX+u1M8yszbdcXTSesNzBy8QYYzGjXPrI?=
	=?us-ascii?Q?jWkv8YB8LYLwEbZ4bM2ojz2AgFaoGk+QQMqxqZFhCTP34ivtEd9GaHDsilfX?=
	=?us-ascii?Q?I4bjLavOH/Z/hbatvGj3xJqJJX5Xr+P9pWEpAblyAWYcT88RXcBgmschIVx5?=
	=?us-ascii?Q?EQJsxXHKmA+klJ04b09SgN/fPIlEb7grzlq079F2M5pUxVrjpFqDubuCWhy7?=
	=?us-ascii?Q?zTPHa6iYg3TLrpKoRkYk8OswqNhkgALBntRfiQAwWd2AzDUSesC/1kQyzDGS?=
	=?us-ascii?Q?lXS4eOa3XTaqxSrA90dmMa0oP/aeN/bHAhLGhjO0lnmAbVWL7W+hduSQUse8?=
	=?us-ascii?Q?7zxE+Nuxj3yLQhgD3QRJ1Ttj/2smBiy/XmEPSCkOmHw19tSQLuYKGsOskwSS?=
	=?us-ascii?Q?C0/SrpDJgctseirb5XucYRvgt5OMQi4pjfeqGFsnFHzA9+GNK1aTfhrowrn2?=
	=?us-ascii?Q?4M3RYYg0X4AZ67uPfWrJ0GEzDl0qI645CtvxhU0zDP6xJZ9qm8JTKrkEvIwR?=
	=?us-ascii?Q?O0XcWYISD59ETFRIzMpn/7CkqGpD5sDuMEkFihkL/4w4gTC6rUsrcTn92RhW?=
	=?us-ascii?Q?N28WPh3Gk2SRnZH0TwJk4Ml4+WxmwnDR06k3JUrUMxgUuDyWcfwlcutR74dC?=
	=?us-ascii?Q?/bxE5+J1cvL8F29VEMvwWen/bg4Zy6H4+1hegAKXv1exBmiB/7fDotaCJz2s?=
	=?us-ascii?Q?cKX+XcFnauRWCOSVZnR65r0Sisspz9iq3OEGS6AcNuRSpujsJ3KWemZ2e9wC?=
	=?us-ascii?Q?awHK6scbNzQgP9MvuZG/FZgWT/6p9QYwOuQoY09VpIQr4IyVfs0Ibbnku57t?=
	=?us-ascii?Q?U6wBqClOhDC0L1rtaX1ktscMpajvRHdI3Po/RWxdP2AlFZNXIu633h+kSQ6z?=
	=?us-ascii?Q?st3qT/m3T499AQ3zkFtwMs=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:EdQ1pa+D+jyqR2XGq4iyuzQDinjEPjYyM6WS7Gx9nmNGaQ0UDnQaANbcamta3nfK/LZfERZL2/1JYzLr0vVWzDt++qpKK6hcl2+y1hRuWkcwXUA53YUayiaOKGAPASUN6UpdyjJP/p101dJIGcbCuw==;
	24:Lkb4Ppm1yOe/DVcN4AyklK9ot1zUVO14gCAU/sj2GvRgXzBokNORYIyB6nNtv/ONAdubOmtmXYPKKQsRW3TCxAshNh3T5Y7d5THvqyLifMs=;
	20:LxJKxR2yedKEQuK7eobCqiOTznUD+T43vw3DKryNDpvuLC95Rh9G7zGAC7rAs0gfiDdgMCJZ2K8awpen6ZAwrA==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:45.3736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 05/11] qt5: disable debian auto renaming
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:47 -0000
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
index 4c58ad6..f190858 100644
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


