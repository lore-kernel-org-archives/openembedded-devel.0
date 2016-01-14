Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0125.outbound.protection.outlook.com [157.56.112.125])
	by mail.openembedded.org (Postfix) with ESMTP id 79748731D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:45:20 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1171.eurprd02.prod.outlook.com (2a01:111:e400:c406::21) with
	Microsoft SMTP Server (TLS) id 15.1.365.19;
	Thu, 14 Jan 2016 07:29:44 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Jan 2016 09:29:53 +0200
Message-ID: <1452756593-26574-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM2PR03CA0030.eurprd03.prod.outlook.com
	(2a01:111:e400:8414::40) To AM3PR02MB1171.eurprd02.prod.outlook.com
	(2a01:111:e400:c406::21)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	2:PzFF1DdhXeRN6SYBYQz9o/0/qv7sEZMllVaOcP/xS+yqRbi5JxgnyaU8WtSaMDOznatD2YO5VTeNkhOSb3LJ6wNTQUosL29Hck3+Dy0t/unqbPcEzmnF2/xZpolwl3D7Auxc+LlYmIMgtjIkwCi5GQ==;
	3:qs8D/fIJX2xuTIG+qgrdwvpUPy0d7p6x4DcKk1KiiCHYxCxsl+utBpGwe8vjvtoB64oB+DKiuzjnARWlM3++LsSNMzGX/+0n67AEPvlHsJYnPakpvjm14dRAJVTstzYt;
	25:X7snmT4WrjRmUy7wYDpiMgO5keio1ZgEg7MZ/65RvUyiYZODl65s+JuD4BQwyzkId/8r1hkjkVYQSaLBcGTB0k5QsMlFkRKw6NvTNiKjcU0qH79q5EqfhT1rjU8rwsLRMcaDsgcafzZUBTybNCsK3WoDD7p4eET2et/3qn9Aijuhm56f/lIN3hv8oWQtVUCjQii/bvhzuo39/9QwD/1CLPnZlTczQjiGfOfpHjzfEVhgu5HWacgIPshdnWsrHNAa
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1171;
X-MS-Office365-Filtering-Correlation-Id: 337f6087-851f-4963-6018-08d31cb4797d
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	20:3FBUoWb0U2VrlBXsTB7EsqXZnHhH/HAg+3q3wlY9pPz5rnMl6Q/51tXtnboe11/M5Ckzs/b0AtkhKAMA7gFLWr1HAtJXhIdwmBpl73RWYPldHB3BVRlDqvkSXb9xWKuFsaMNLm6ygHiirIfG5LKyU++GzCxuvDJwOyjvPOuBZ39Cv/ZoOCWfgoQc45tqCJYiO4bRk66dyd/ZFIUysS65k46tJtpK2p21IOWcmIMZwOuopE0gYH5QgubYb2ClReTlSdLFMjdelNyiUdfFeAOVeKnRi/JhXt5JlLm/POYc1mNy5jno6PMXAZmG2Ls47zl3jRumqM9WUEGWnz/Q3sW7Sx/MOgeeIkJUZ1tgQe5S7S1syj7C+w7yUSqcpDV6p9NPmxVKSkud4RyoDZj5lxGjPPdpR55uhCv7K/I81tB4D64LaIi+QQg5wWudRbdPEF7FeKij69WaxxW34YpsE1+ilUqeIQlX+jHMJFOkfJ/nxl5T2SIqO7Gt4dghZHPX63FM;
	4:FOJkUzVFDNkWQ/oI/Bld/NN6hcZdt6GLdXuWYSSWwZTxMym3cjX4JEsV+RlShm/8PkwERJxxWCDnqYEsCosk13358/d0kfvO2stljgZOHOlJeWcBIYqsV0nifkJVOnGxo3Qpx40bL+B8Fzc03U9YxkO2ZV3kFhCxSZJk+qYK4+wK7LjV8ygHIh3QGcE5AXhy10CSknw3ZK/mvLgDXZGwzlmuhEiXC8qJhqVo1lTjP1x4jDDKk4W2kI1NA2cGERsQfDXgp892OC4tgF3+2Iv1R+RB7Lh0a//wADOZ3WrqSkP3MrYqe1dUqcrWWAL60gvvUaz/tD4aUi3IdLOuwkhtcuOf0bfsZ0IR4KhdsXmei5ZbnOsQm8CoJshU9hIxpuom1nkf1HhDFlo0ApNyIlcCcEqXvkepAj6Zaquf8B7OoVN7CjwGrtMdkRgxJmkr8pge
X-Microsoft-Antispam-PRVS: <AM3PR02MB1171F7E9AA1E9416F0E49DB790CC0@AM3PR02MB1171.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:AM3PR02MB1171; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1171; 
X-Forefront-PRVS: 08213D42D3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(2351001)(5004730100002)(4001430100002)(450100001)(586003)(4326007)(19580395003)(6116002)(19580405001)(229853001)(40100003)(92566002)(86362001)(3846002)(189998001)(122386002)(1096002)(5008740100001)(36756003)(110136002)(2906002)(87976001)(33646002)(48376002)(66066001)(50466002)(5003940100001)(101416001)(5001960100002)(107886002)(42186005)(97736004)(81156007)(47776003)(50226001)(105586002)(106356001)(50986999)(7099028);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1171; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1171;
	23:vCPSPrti8UfQNKMYMZNm93JJDvrbKoFaruKG4kiRC?=
	=?us-ascii?Q?Flg22Hf6ckZ3MCZbg30NNnpEsJN2xzOfVcpQs8Uxf4QTFirOYtvn1YUiDG1E?=
	=?us-ascii?Q?G6rQJpGA8B9LcktEetLQfBhVebEUlVt7zOAZwKzJ9pWWqcDppwWi/YuOIgDo?=
	=?us-ascii?Q?vy4VRt+fS4Rlljzvkk9kNylRVW9TZ7rDAyaKQRt9R013WxADKsxbXm7IzNFs?=
	=?us-ascii?Q?vbPv/YPgrqw35AjqAyq5ANtNSkL/UfZY5OPa2/NV4L2jkjTpg28anMBEWObC?=
	=?us-ascii?Q?GL+m1ysu/WXZHMCxr3z+LlAjnuzts5R4uVb1iqbJJ64/0hEoZJSbac6Qv4M0?=
	=?us-ascii?Q?4tkdN76gLMsuW/Wct2MxPvjd64xdn5wWnnn/BZHEJ2v3WLKJROncv0L7i8RB?=
	=?us-ascii?Q?oKI8SVEFuI11hvdXmB8CVjEM3U6qdBPAnxvBJWqIincPN79g0V3Sj0cGi68W?=
	=?us-ascii?Q?baP1ZYNMA2qzJBG7s1XjbIOA3KHMKrcCCr69tUE9kE6NCR5uhpoKU40jY60b?=
	=?us-ascii?Q?sHmsdw1wOjPcoHfPJTdwFDDf0U9zNZuHQ07noZYzf8KJBldG1nUBli+Srdhw?=
	=?us-ascii?Q?P0TdFYXWptXwuw4QKeZh9re1sWadcECRzm6py0PXxlFdCXsUJtaD6tc7eL+4?=
	=?us-ascii?Q?L7VPK+MSkOHab652oFF+UPa2t49e8YG5/EWNPjc4VsnpDWsRYAsT32HQTunA?=
	=?us-ascii?Q?TcGg71vg0YfMswx2bYraniZBIuJwy4KFSimfac58ut3piwUKWVk6gZ5Ofzr8?=
	=?us-ascii?Q?8G5xChuN/Y57GaeiQCTEGTTGKSUjisxyDJjBAg21YSzaiKfjQX/OoSvC8AmU?=
	=?us-ascii?Q?CgedhTUlR4M95n929qS6zaZ1h6gGsMBVnhxAJMFvykjnbghzJT6x07THfbcP?=
	=?us-ascii?Q?j8Aj/MLZxsAQzKrchvslHCE/ndcfOvtT8XGxK1X+xwrdKp6o3dEfqFw1nkcW?=
	=?us-ascii?Q?q+VrE3UpoN8a33QxSnMcP/tW6aBANDhZT/MmllXS8+PX793RVYjROi35hjKi?=
	=?us-ascii?Q?b/xSuyshZ36VsxJRDLnvENhSjbpTkaB4lwlFdTpKg53w51v2/Xzlo9rEBFA+?=
	=?us-ascii?Q?rDzOfUNYhNrOQJBCWmgG/hHBJwOpv7xoIzftXsG/DxWfEyVvQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1171;
	5:hTlQDkK9RIzwKcjp7cjul8kURHXUqcx9RoFTQChLVu5FSxyIIhta0T1bgM6GjY9OHGjr80CHnEYoMBd+q3Pp/kRJpijYsI6TRNMaH0yDWN1sMPAtkhSDiBbV9PH+8PSCVMLdOqkNBxLD6ixeps2wug==;
	24:7yuFwTljbpvSXHMtiHtbklRPzh1S+ejUxGXdhki2OHd0TvOT1xqsNilT2wrzcAwz+Ey+F3/Qrniyvw6yAx5SjAaXkoFCRmQUpc/LxQ2HT4Q=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2016 07:29:44.3728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1171
Subject: [meta-qt5][PATCH] qt5: allow overriding git protocol used with QT_GIT uri
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
X-List-Received-Date: Thu, 14 Jan 2016 07:45:22 -0000
Content-Type: text/plain

Add option QT_GIT_PROTOCOL to specify the protocol to be used
with the QT_GIT uri.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 conf/layer.conf            | 1 +
 recipes-qt/qt5/qt5-git.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index f83bd96..b7207e6 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -28,3 +28,4 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
 
 QT_GIT ?= "git://github.com/qtproject"
+QT_GIT_PROTOCOL ?= "git"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 172a170..f8fb38b 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -6,7 +6,7 @@ QT_MODULE_BRANCH ?= "5.6"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-    ${QT_GIT}/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH};protocol=${QT_GIT_PROTOCOL} \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


