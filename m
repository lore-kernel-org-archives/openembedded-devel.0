Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 390D676D09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:46 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:44 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:46 +0300
Message-ID: <63bae5e8f510c228002db87998ad031708fc69dd.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:8vgIDvDigAJbUgiWzVMckRlvW4Ps+yURlyvjbm3t/c8A1JFicEzCMZGTp/toJwSb2GZs5cqAkmmjiUQN3gqty/IscOrjk8YIDjsVpuOHfWUXNkIzHEZOOLQxRaezXvTqfSGQCyRCbLghg9mA5FTKUAhHZ3ZaxExZTlFs39umnBI=;
	3:0e1fUmwi0SkixMwK/ktVg0Jt7gRCovaxTfM5rij2oLuSLcEeIh9Uq7NjMg52bDr53K0/y7+IxV1q4OHJHjDNkf5l8bcwt9fRkxiYdz2QweBqZjSZfXG3VMJ0m/MoapGTKDRgY3qbjfwTWmAY6orcaA==;
	25:fZDMzwzyaVlHynD2c3gxQfYp13DxjByTgESozRkODkZRyocDyIywzZ41On7bdyVh5d7iRMdMXSs5d9YgUBohf2AYpGNtLWNSaSdfgGwPvSGsCYCAQW6anrNIEWMgtkegx0hrHHEitaxTMHwUG2YF2Mqt2DuU9ReD7jlf1UK2U+tE59rfVVwyQWV2KV13KpehqwtrQXvMENJPBkNhObu4dgEY9C2KBYBMT9m1Nwwh3Mqcdez+Qe53n+8z7RKqJt2AUrPeRUCDBXwLCh26FfykRw==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:70HSk2jcEbBiLzIAs91iF12hkgJnda9ogTHcOXux5fVl0NEtNV1Wz7G+MpAS3YGGUfMaRJVyhh6TvDvs9MXM8E2HhLNN3EwAgNM5RPi+e9PVBs+3f/c4xu0FvUeCAdXhB4zb+kMRYkde0rROQLpL3ZUj/kAVDkh727ARE7lYTaO2mkNAhJnt3vVSDAv/MkTYrhOO0CYZjz7ml0SeJwTbYfrbobHiBKf7h2LUkfCusPKrJ/CvH5jmhn3C4NQf3MlzijORN9HvsWRfvZMwUCEhfQbwzKU9VHLZyrxFNZde5N2QQiM3UMNlzfjn9ciLp9/xhx0vONcfES2hqfxaBgr6Z2fsMu08Kdwd/m15krc4ZNy341TTzEMDzt0jh/GRXE5oIlUHKhksv36pNdb4mXoiZw4kzzVPVDl1jv/ffwwqhNnwajO36Ivd8z3KQUE3E+7pGj5DcVRQfljcJfC68te0jWhic1s8o5rK4KGm6obSckivoA8vKOHr+1WaRQ7uriVK;
	4:NfBE3lgFXMrKseVhIGwq/WuG6dUvCXSn1c2wa8F/0n+h74wvogiMXU6pWqSORFcs2CcU2ubZSto+Ek6EIvJ+p1ckcS1TXEeqRYcb/epG23PdUxb9VaToK+AfvlwDup4I5Luf+HnKoZrjBQSh+2gvjVhHZTOcFGosGFuV7Kw5ZU/eCFl3ZnVBkYpuzW98UbiCjIOiiCALUvUrmHP+Asf3DpoxlNMba1au0/NVRcKIfUM7v6zrsFNncJaNYJ+xHAQctkoRk/HDQXeq9sSwXa7+3mFwO8El/mGAcTqWXyQwBnTKJP4Gty0QgbCffJzQ/Cmo
X-Microsoft-Antispam-PRVS: <AM3PR02MB11723DA75B8BD76F1E2012A390610@AM3PR02MB1172.eurprd02.prod.outlook.com>
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
	23:vNnQDPSXxceIXon5CusnbsVl+RdSuE3/v9yEhYY3w?=
	=?us-ascii?Q?Gf++xy3krB5KwYtpie8SyDKUaSbw5TRK7zZrcUmui3ohW2J33pSh4jjG1YJp?=
	=?us-ascii?Q?xySqcDThTBjfBO0Qkwlb2nyiT2OW85Gq/qJx9wszCLFScg1yTDRo7DBBNKoJ?=
	=?us-ascii?Q?Gkbi7w4IKHacoMZWmPRL9WpYPdRbrikiLFULPKlnNRFDizqOiHJgXeYzauFc?=
	=?us-ascii?Q?pkbq66MzgKMws9jLL0a9jWsl5YEJlaIQz3qIFCgmSzgYlkU4sIQuYKc5JNyM?=
	=?us-ascii?Q?W/2HTy5GgW3bryz0ghnvEcK3+oUJTUmoE8gUxpOekEa0QjER0c5IIXVnfN4F?=
	=?us-ascii?Q?bE9jylm/xY3cw76Ag0NMngE69+sNpziKzEMT1/ayW0hbLywRGdKFQaejJi6g?=
	=?us-ascii?Q?M51hoVB/MfEMaCJi3DqFwWTuEDJBmGb2BRO9h+kHq/MDP/VqXHRPZdVtyrDQ?=
	=?us-ascii?Q?ljDN4z61FTmfXtvMq5bNkoB5tR15+VJWegE3ozwmKaywge2ICwVvWpHJLQZq?=
	=?us-ascii?Q?rij/aLey0jfo1OIlfGtRzar4oJehdgNlZ/0lNlZovervKp+wnc/MxhwbrMY1?=
	=?us-ascii?Q?SzD4AUBk2WTySMQ6MK290VWUXFfulaMKZUke6Zt6+e8hoFU3iNbFJLqOTwmm?=
	=?us-ascii?Q?UNmD+zG1zOezQfq07R3WgwwGUDL8l3GkB/Ya5gg6m98BnBioQKE9GryK5N7w?=
	=?us-ascii?Q?d8L0HtVlmBSmVLvF4iRUbGT48ZUCYCuWbQhkT5cw6OWqGup2xJ4Jme7MKpVZ?=
	=?us-ascii?Q?U417WAQDqEmU8QMYzdZPtQCsw28t8d0nseMCZuMKsw3cSJRm0gklKpb08ljR?=
	=?us-ascii?Q?enfBTcCcikR04+19RgBxEG7AuwVVixT9z1jm7jP00VGYqLaVVWyFw1sXqeBF?=
	=?us-ascii?Q?HLGsWDcLXOWogHX3InaANm8iLajr0r1E+sINhXhwrwOJwz/WyA+qJ1Bi3FhM?=
	=?us-ascii?Q?rztFU0OVjoWiYB3bs9cn28XHO6FcMfFIcbDcyZ/3CDi/UnToMYpfzAJMRLJq?=
	=?us-ascii?Q?H3jDPqLGo4x9TdtNOmPdiAEYvuSF23J3KpB5hwNC2K42Ecwb1XCD8emTD6SG?=
	=?us-ascii?Q?27GCXxma2G0DxzjKzDkyTvKy9StO60M2l6ihW4VTyYDldST3CT3/MHqRU35C?=
	=?us-ascii?Q?a6lKRZkrX/q8I02XP0BCzDkB6kYg8cIkC1iP5UWt0r+586vCRm84EZVceUgy?=
	=?us-ascii?Q?9G8d1QOf6y41uSNpM0nsGYemxCiodaKiKtlpK72+/iDGB2sprRsLIjeHhXtg?=
	=?us-ascii?Q?Kp5x0D7PfhDRvJ99xdZpkP4G6KD36XEvLkFc7lQFZuW3eLFdAhKfS9x9rF6v?=
	=?us-ascii?Q?OzVsh5FgNiaq83IKj4qn9c=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:6Am74FYImlyVrDCwWxK/CfcBX399HMLS6NxL+nmqpjwEGxvf7lGENtTjMheUCCd+D7D4cuknLBUnEmLSY+bnwUoA5nXlIrcBzT/iktKp6kxauSxW/Np/JIwYPRUNhQAa5f/NgDIAt202ARsAG/d7PA==;
	24:iaTSDUDJh8QWktjar0F1EoM6V0zyMtJvVLNqa6E4rni7YP0DK6e1bri9HGdzMPtQFx7pMAsWSXJ2pFNz4JY5D4Q8t7/T33MfGaHetu49Vqw=;
	20:NwK/cgCoTxD479p01ZtgoHwD7H/1RCn/kEwbmG729jqtLFbhuKdtBLpqosxR/pJMUsAD1ENq24j23OpzcYUsPQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:44.6548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 04/11] qt5: add host paths to qt.conf
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:46 -0000
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


