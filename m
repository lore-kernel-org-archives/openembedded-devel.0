Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0146.outbound.protection.outlook.com [157.55.234.146])
	by mail.openembedded.org (Postfix) with ESMTP id A033B76AE6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 09:28:52 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	DB5PR02MB1174.eurprd02.prod.outlook.com (10.162.163.20) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Mon, 24 Aug 2015 09:13:54 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Aug 2015 12:13:55 +0300
Message-ID: <1983fc6d109300f6f7951cd63e7550dae0f66a97.1440407387.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
References: <cover.1440407387.git.samuli.piippo@theqtcompany.com>
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: AM3PR01CA040.eurprd01.prod.exchangelabs.com (10.141.191.30)
	To DB5PR02MB1174.eurprd02.prod.outlook.com (25.162.163.20)
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	2:S7BAqjZPqsTKc+oS4MMe/bHOT+zviL2p9Z/EECAzd25l7/hoXHEdHlaLqY6ayDNi7Q9AX5hyUmkynDi/EXW4p/7U1U8WppE2fuQes08CyjYk9nNiiB29l41Qn2roIiS8iB5Jgoex54f7voJnlHR5DzhWtFuVVugKyyE9hxV8Cp0=;
	3:PeouSmiAV1/K2zZoeIbt12EFs0faXMJVg+vUItT3RyC+W+P6U5cJzhYQK/+6eGMOZvE4Kj+mrABcNgTZbq47arKyPkVaJgIqGnctzJZ04h1SY9bSRnmRPaGUUSbWixAO5vR7RVOIqLK3EQBwPgh2rw==;
	25:wteL7WCFSVRj8yNAYERxn6m9lVMU1dct6oLERoMjlGzAe4wHCoYFDiGkYx6b6Y7asUV3cVRQ/Z8XJhp/X77L4ourKKsqNDHah79/2ZBx8S3s+UCWJrfb+mMhq05273iCr3gQiiD3AFwbMBzSDCDEwqErEHXwKlTQdPNBZr1zCYA5zD0Njb6j8PeHcqZhyI9m9jsndlbfqoxYwlhf5PVyu8pI4Jh5+L6SY8nToPhpeQySksg3iTBH/HcL/yApl36tIEQgAmpZanW3f/PmidcWQg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB5PR02MB1174;
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	20:tEfaGn4exVJ8z8Jl6pGjYCLywiPrZ/Zc0jO1z7qjKawTJVQRlWnRMUqCj6LDmMygvgQ6DYIXBCF8AJSuNSi9AnbMUTwIZHEWcCS46X6XyHOgb2Bik8LO3E6jOyVBUeddqnIf8K7D8eR1Nhc00IhTgQPpQdMVee1aXzgf+QqXTxetMZ4+LCF7X+HXOJ9n3KwPCSslYAJG3lgj2hKJwC7kNlJ3r5uP5Zd//a6mxkiYlV8PnRjdP9HBzUuv2VFUc2KkyvwUVPP9Av3SQxcQtPL5/GKn+2im2nsoEFDtzcG9kuKB1OZdqcsnwHi0KP2t3UZE9jCAc79Uj8tmrNqJXSlafdeCSir7aLX+kWyL4dU+iyFju7NvJ2UY1SV4lXQYIP3WpkFuiF0E+XbB4VJrFMbjd6Yz6+cP9zIGAu2Q7bIXPl0wvXjQ2UX6mqUZOD7s9w/waj3kmhD2W7vuqmJGfxTmV6zHlnn/KeJvwk8Xsc40EPYGo9lfv5REkMqz43fO2TNO;
	4:A9PGQNkfr5gDuIGKW9uVhf/qmzfC+Qs4sY2btMOeHZ3loU8qQNaDCVqx6PPZV81lm47p07SZjxM5NqKVsZ1YFzyVMGHc3jWx3JseoqKXu/QuuoofAaWidHVoqRZYIBldo2Erbh1xtQkV+aj1EP34h0QfImD5fcNJt4PdHU7cbaqs2kulkeHRDbsnKy1QqciKa+8nrjXVhu4TS5eKhpHAl6hzQ94VGiFYcTcFziG4WLoVQ4zafdbV3T9DY4ZOP5o4CzC9lS37AnQdHcF7Ud3uylxes+aAVCYcixWNgLc/D7RqAGqQAkX9fXMYSWKlC0+s
X-Microsoft-Antispam-PRVS: <DB5PR02MB1174540649713C05EF081E0590620@DB5PR02MB1174.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:DB5PR02MB1174; BCL:0; PCL:0; RULEID:; SRVR:DB5PR02MB1174; 
X-Forefront-PRVS: 06780E24F8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(64706001)(46102003)(5004730100002)(40100003)(47776003)(66066001)(5007970100001)(106356001)(50466002)(2351001)(105586002)(122386002)(229853001)(48376002)(101416001)(77156002)(92566002)(97736004)(62966003)(450100001)(118296001)(5001860100001)(77096005)(50226001)(110136002)(5001960100002)(107886002)(4001540100001)(68736005)(36756003)(19580405001)(81156007)(189998001)(5001920100001)(33646002)(19580395003)(5001830100001)(42186005)(5003940100001)(87976001)(2950100001)(86362001)(76176999)(50986999)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR02MB1174; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR02MB1174;
	23:/TiTABLea2+DwU72VY3TPn0G4p5VoqLF5JKD7qZ/Z?=
	=?us-ascii?Q?rMYYj3RRwBdXbhaod8mgmhe020drWsu2IyFZXwl2eJUEGkrNIt4isV9r7OlG?=
	=?us-ascii?Q?MIJfsAIA7itC/l0q/5rkL+fZFwMKKMA/QcglWfVRHZX7X6mKfEVnDSLOX51k?=
	=?us-ascii?Q?CozVtDw7L+alrAHCBnVC011DmH067mlrufYfl1c0kqZkHUjO5IErURgmsAof?=
	=?us-ascii?Q?2gvbH1TRGlUTRy88I1XWPu6V4SHIk7Z4lRki/GROBoRYJ3zimb8/yRtJZpfi?=
	=?us-ascii?Q?pK1sAvfSe7lf7k1Lj0ioDwRwCPAodjXcSxgCU+FQtYIlLkF7aDS6BT633qIV?=
	=?us-ascii?Q?pH+J5un18r/KQYS4LUD4MjNdoRDQv48sUeKlfHL3wr4aG8A764eMTKqCUAD9?=
	=?us-ascii?Q?H6a7pWXxlm954xaUgltWBxkWl1usrgtrGwdbqfoMop4CIo/l7c7qwupq8rP+?=
	=?us-ascii?Q?6PPs3LjKrXWp6lfJ3g9Tjtlp4btytwt9alTv08CDNmhcqplMyw1pqELYgMVm?=
	=?us-ascii?Q?aw/zEqVBbf6HnYpFRQwat4TbzfRn/cQZ6N/NK9kTV5l61eVoWnSb2BRDP6JV?=
	=?us-ascii?Q?MQ0LlVm3FCdVfqtBBe1Vt9d3Py53GtxXpBDoqO1EENC7KORxAmjNvWFhG/LS?=
	=?us-ascii?Q?C52dnPWKbMcgX8x54Cfh8GaDQVrtOwQ8GBY8E/HjyKMGukIKZwQqp0Ut2cm+?=
	=?us-ascii?Q?PkTq8L1tWvwd+k7UsFKTgH1kCnt/+5IW0XGR0EVcUJpDe9MC/KoHaAEirhWh?=
	=?us-ascii?Q?hpmXQNgKkXFqKDdiiMURkAQNDwENjZwCZ3AVu4INRKjVlnHmBDSLiu/ivRmi?=
	=?us-ascii?Q?u2uCW5JPlhYo+t+hZqdK9T0fxQtgTO4DwbFbjytpQfxX1CXI/3w89sXpEnA9?=
	=?us-ascii?Q?+JttVY69/WCc5UX/LefPAPDgrZp3R7oN3QBQ8E4wwJDjDLSCupwDCpp8S16Y?=
	=?us-ascii?Q?tYpNtjM6DseBzZDHb+rBTV82PjCsh9bMvtly+EJID0mkaX4quC6CBjV9rGap?=
	=?us-ascii?Q?1VJVPiWuJouX0RFctfRMZGkwXagNPASN4WCxNQ6HV1jtXoZShZ2aYGg4Kvb5?=
	=?us-ascii?Q?w9jlahiVIpzOLML3FqkH58z5gnAlb+RcKUvBxu1XQq3dBZkpOCqeNKS6YgHE?=
	=?us-ascii?Q?B3yhTOEVbcHMwN87VnAL3oC4r/qF8Xv5DVrCleTH2mfBnXJEy9XM5j1GyX+f?=
	=?us-ascii?Q?yrffSA3Gg7NFvzXwoulDRxg6K/eyziY+ppSTM7IFBsg+H6suz7YjNa231wsi?=
	=?us-ascii?Q?UdS125sXE5btQfgysETAO1xuogUImByik9ZOjANYCenAnBWKRrpTEv0SAT2I?=
	=?us-ascii?Q?ShOC72K4bS52YFmyjfK3sE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR02MB1174;
	5:XNnkckxi2/p9Bng0ONJL8wli+rmVZVomKrFTKwxmvTjGq+6xIazqagIYE7Vk7qFaezIwEP2RalSaHI/27czBC+J1y+AJqTOWC8edhXy+ctzk/ZGmj9aMZHBc6Rnh4t7vsch5QcVOBC3uLU6yQvX8Jw==;
	24:hxjGNEo6aS0TUWeOIWA/afYS4/wBZIc/2w4E0KNLoptc8WKdsOP9vdhhpJ57iFFfX+sE5xuf5Uh59ivIc+O84v0zEfhToLO5RTqSKqrHPw4=;
	20:uiMXx0RiXyXc03pv0376AX9G4B+CstVrstymBm2sKZPlPiUji7F2T/mPUlH7S90HbatvXzfvJcqm38a0R/K1eQ==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2015 09:13:54.6000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR02MB1174
Subject: [meta-qt5][PATCH 09/11] qtbase: PACKAGECONFIGs for libproxy and libinput
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
X-List-Received-Date: Mon, 24 Aug 2015 09:28:54 -0000
Content-Type: text/plain

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 972027b..dcda92f 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -133,6 +133,8 @@ PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
 PACKAGECONFIG[widgets] = "-widgets,-no-widgets"
+PACKAGECONFIG[libproxy] = "-libproxy,-no-libproxy,libproxy"
+PACKAGECONFIG[libinput] = "-libinput,-no-libinput,libinput"
 
 QT_CONFIG_FLAGS += " \
     -shared \
-- 
1.9.1


