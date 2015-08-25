Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0104.outbound.protection.outlook.com [157.55.234.104])
	by mail.openembedded.org (Postfix) with ESMTP id 61EBC76CBE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:49 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:47 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:52 +0300
Message-ID: <24529e1f199a30d092d79150e34b0e014a1bbffb.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
References: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR08CA0009.eurprd08.prod.outlook.com (25.160.207.147) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:yjlaEbe+D0CxmMxS7COv0ySNA0WXaicl7DrP/SeQ+REuhcdZppjauuW9rXsfiw1u8rbzHWOXFB/2vq563V0sX4WcfXeqBveMR+C1noq8n+sQJB1k8x2MUJv/PJ9QuYsGk2kTqNO7EaaZz6eAhwpe/gbU9rLncDfhiuklW+Nu66M=;
	3:reA7GIVffVdnfGTxMSWOTLIc3tGRg0XFx00lTq4HZ5S00Ozbb4nGRtPT5L3sgLgXVPHAyl/1oA3OaygXImJkVqE90jcrTxyqE5wyYuy76jx/pwlU8wevAtjTo7ZHmpb946GaCAY5uczeg1WcFRfKZQ==;
	25:3QTmienwjOVfukG7ob3Sd4099UZk2xLDYa73Or4jksKvea8Deyk+UMknEvqxRrzu/g1N4sTsU6cpfdle7puX39SZBIPtU93zSmHQKiht9yDz2dPKftHFpvH1ymLhvik0LqOuBnwan7Vfme+BdUlztmltuZRpPrJcpDpSIK2TUXGyEsc9VxnBHlkbWBxNR+t9moHo54SG08FFU2PxBpa+vuUe1eGexvaDQfBQZeRCW7u34CiVxafdsUl/DTeVWdPM841vrqRXEoovwYvzJe4ltg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:2nmJa4S5cW4k5FNwRBjEN/QzTs5bhQb4qSu3q21kfd/LvTT7AHcoxvrZyBgrO2q/e1gXU0RsoPmaycFzTupOGSNPEDRHUL2PFs9HHu18kawnRzurcGzUJB0HHaLImfBgb2g21VIp7B7VrK6JCYwxXqkW8AL0G0jEqE2I659qT9yTht0iZCaE1FY2Eu0H2HC0hBnL349q1ZumEhbS4R0vZ6fmlhvhoAWYmzpzSIX/7D3sJsSdJYmkrITQgjbbIrIHY5JLEzwOFgs/FtteErSv8CQ4lWiEb24K/uJ+mb/yfThLapFQWpsgNJhbPBC3AYbk+Le3PLwP71dVloXPiJnp+1A89qarsIzPMXTZA91Ap+v+p9QStCuYfu4LDUhSBnbTSm828Fbd4he6Y9+i5wk1lnF0XbfR5MczDOn+mH2aR+LU+eztjbn35WE76poyoVHdt1jTOnxuqd6Eq0V7nqI35Iddaibeug0tAZk/0tnDVlY+yAzQUmCo9xscoF+zyzuF;
	4:do4NVqMc4N7u4+RRsCky0BMTijYtwXaLR5+Abqbo2+xFSTx0vEcMgnwF2jOaXl2am5iFJTLw/1HAknw+hgWgbdbQoRBqDZMjUjOy6QIFUVqTrlTPeXYVhibCxY1dXEYgP6aGb3HaguSPHE1npSO5jWzFNM0H9L2nTJ8o15hAnnoFvndyBwyDiPoDqe1IVxdnQd0ywpWcODWp48KfBSNwM9+6FiX1mBJqVqfFD1BCj5RgO9pxXBcjtfmfarfRlW/Fvr5riJ0ydchhLuvQuKlbX8b9JPg/SXOU9bGxJT9NAY8vajr4BxqpApMAg6+a1SPM
X-Microsoft-Antispam-PRVS: <AM3PR02MB117245D167A7D729949528F590610@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(122386002)(575784001)(46102003)(5001830100001)(2950100001)(66066001)(92566002)(77156002)(50466002)(450100001)(229853001)(97736004)(36756003)(42186005)(77096005)(5004730100002)(33646002)(64706001)(48376002)(86362001)(40100003)(81156007)(118296001)(106356001)(5001920100001)(101416001)(5001860100001)(50226001)(105586002)(4001540100001)(62966003)(2351001)(19580405001)(87976001)(107886002)(68736005)(189998001)(50986999)(19580395003)(47776003)(5001960100002)(5007970100001)(110136002)(76176999)(5003940100001)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:7L7XP00X0oOA9Hn6wULV83VBwiXAleMoEQQtypGLJ?=
	=?us-ascii?Q?luGEDwdGni/PD13RJXNK8gQuQt34yhwP11PQhSS45RzNtlcydNVWbSjifr8n?=
	=?us-ascii?Q?b+a58XZEChSUqbjidkcCOT6p+toDYV0KrVzKr+KlcU3I6tQTFY8QxtpAmrSk?=
	=?us-ascii?Q?FTs+pQIyFODItlryGgZgGkVMaR1ZlXiG5wVKwdVRCxEDCSa2rYwzs7ZszlxS?=
	=?us-ascii?Q?GNer+2MRx1NFFUuVYFt5pGtqEgYIuTpjXoiXCo3AW+tCUwP446UmtQRbBMCs?=
	=?us-ascii?Q?o9wiRqUiFGJ+b4QRRNG14B64l5dBJyRiV9JxJh2vbBJvQbxQoiwTsIRK6oB2?=
	=?us-ascii?Q?DG4YJZnfw2SbjzR5Tm1fKz6/8Oi+wv6wnp1/M869puZowGEiLvfgplhvwXZ8?=
	=?us-ascii?Q?hbs0JdDxnz3oc0H67fdoAcEpr1RPqIcuqqGrhYmNgm7/S7EC3FZgTJT7pDvS?=
	=?us-ascii?Q?+Z0YT9vdiaCHK+c0Rl2OMalGfHz7nk5HK6AhUz38Ilx6Vfepkkx58KJ3tFXk?=
	=?us-ascii?Q?JmSTRmhN6cbnZTBDDRkbwXucQsrPs+zhsjxfUv5lAxGvzf8PTNPoncGB2/mz?=
	=?us-ascii?Q?m5OCKRZgRSiJ1rSpESl0xbjEZDJvecIFG8Yqx2sZCAWklTSlYKp/j2lkv8ey?=
	=?us-ascii?Q?6a06rlqxk09o5ey0vlrF6JdrmPCMfrWiK166jLP9EAANFg7D4Q5XyAnSQq5c?=
	=?us-ascii?Q?cXU9lG030E5jGcjXF0jycxCuxIKqIMsMKEcLLhIzxaPI6DZywh8yO2Mz+UiF?=
	=?us-ascii?Q?mvLHMtV3QNeRwVpFMSFCqQcLFZx7xkGTsKjiNcNWvYijDHDo0LWq8TEU4tP7?=
	=?us-ascii?Q?44vXoUrBAw9QJmvMpjNDt3AMkGib3kxjOkMZKW8T7jMCuI/fSwSa0rJx/hPt?=
	=?us-ascii?Q?QGd83P0IuoFeMig3oJw5NHks22RPahJu3+ksXF50PoO0hYf0FwvFInHGmSM/?=
	=?us-ascii?Q?pbwjGiNZlwfTAHCv5k2Kk5KaGPq2HUMH0gAVMThlptj51/fkYhJ2xhk8CiWe?=
	=?us-ascii?Q?VrG7kHsEYQ1Hie1yJIBOHXjybGAOrH+pyM7zCKvJcJq9ZQziDvjq8s0uNrsD?=
	=?us-ascii?Q?Zrw4jyKKkg70BHLtGncXS3Gf1Y28lYRS8oeRnksXho/bs/NX6MVJiLFlkE8s?=
	=?us-ascii?Q?cPR+AEGLA+Ej+cHXtGoa95FQjy3esVSrYYeoTOU4//JX9RrXmuXfuuFJz8/T?=
	=?us-ascii?Q?alL0T5K0KNiT6MnF0vnpM52TUHSFSLKMIZj9kl26rQyJH1H6DWA4/0Kk4ufC?=
	=?us-ascii?Q?FlzPIdOnjebB8aXBmrD6n5vaWDN72qubGP8RaV4KomuYg0F56ku6SwOnOnc0?=
	=?us-ascii?Q?3jFtuwySA6aj4DxN45dIJoJWYlKuJmxS2F41usPdMRd8F1h+u/A/Q1UFaKmA?=
	=?us-ascii?Q?LcNzw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:q7EhKdNPMLk5wG6Qckjup9Ats4i6e0W4sfWezTr7gi3QS9UZ5TnVa1eYFZpmcarb4UiV/VWluqLj8AdSQ9hv7wg56movLBihgOpeo0GjTJTcfVwwUgYgnKz45Pp9PtwDJBPoqoxkwxlENUkFU9xVQw==;
	24:FQ00PN14CpdYqslsQUUKVftSysHTRqjo1vZA6yq66u5eNWTkEQT9NRJYoTY0gxmQ0hvN1BEqDPsUISg2ejXrPxc7pMFEciwBukQRYhe2CKQ=;
	20:u6o9E+5QgedCyf8xGfuKyNJdSI92DxDrv4HK3pNXdc1StlQb4x2EBacph0LKHoEeeDKVUHKYAUvichDo+eP08Q==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:47.7799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH v2 10/11] qtlocation: use correct dependencies
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

Update dependencies for QtLocation module based on the sync.profile

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtlocation_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index c0ea2bb..9670506 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
-DEPENDS += "qtbase qt3d"
-# qtsystems qtmultimedia
+DEPENDS += "qtbase qtxmlpatterns qtdeclarative qtquickcontrols"
 
 PACKAGECONFIG ??= ""
 # older geoclue 0.x is needed
-- 
1.9.1


