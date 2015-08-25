Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0132.outbound.protection.outlook.com [157.56.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B72F73DF0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 11:43:36 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	VI1PR02MB1182.eurprd02.prod.outlook.com (10.163.164.22) with Microsoft
	SMTP Server (TLS) id 15.1.243.23; Tue, 25 Aug 2015 11:43:33 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Aug 2015 14:43:39 +0300
Message-ID: <cover.1440502860.git.samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: HE1PR06CA0060.eurprd06.prod.outlook.com (25.164.28.156) To
	VI1PR02MB1182.eurprd02.prod.outlook.com (25.163.164.22)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	2:5KLYx7eTdS7J/MDj3LsPYdypFEwrUTSJrbizgnsJX1beOCSA/ADGsOeHvbFFIw2nUb1Ln7bnLYllcw8n7r4tVjBTz8Qq2qsX6M5eFDEPe4TNxSlLU7OYiUvXbwMHuoZ2gR9W2SDpY64guFVDW8Nh8MuTjb6Vxqlz1tdz2fnLzQg=;
	3:/ymk1QVPpE9FTs2YIarWbWXk/ES8ccHpLV7M6qA+UPNn70nknQ5I3tiV1rstwKiIwUKFy0L3ylmvV26eHwGdvSXuL0LP2MnIdMCJYbDDnFejrGuT9B/qbNHBJDt1TJQu+LBT7AvbU1vIrU7z5gXtug==;
	25:X7Rj2ofLKgSeu474m+phzDOxy35/jY2qgGfqUynOSo8ZIuPEjmbJaKcuEaHyHgZ18s0eSISJ8bVtnUbuLHSfmDZ37uqjzmj1ZKgG+ElDaJvXJVrKC+DVgR2pXUDLZXPNSY/8Bn+xwlVBfok0spTItt/WC/8U9zwNnkIN25NxXHdKkvUKyv4vFK3jgt1W20xZ460RDsl1vCLDp73ogQMG5f1MTAvghuyKJ2rjh+6YXk585Kfvgj+uOREqRQf1hv8Q4YUy57MsXdaeytrctup6EQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR02MB1182;
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	20:oV0m8kKzFAxSYSPDW07OdpPb5GtI3Lsuez8NzTaUavRMMsObMDe5YrutKZLok3hPHhJO8pLsODFeqsbCKu3m/aU1uZfW9AAa3v+CSnjfeNmv0QOz+2s7Z79XVQG9nr3s6WhFZA6RXm+2cCnPUBJIuX3Uu8lvKvLXPxL8htKporpJpahcCtuFNhcB4tin/yArI1bYI0C5MKceRVJ11ydIuczC1dyAUfjytnB12X6Vts/aQ4OPOrekFgwt09IBPk0sXrjvtASrGZpdPM1m/4CDr6CcIFXkaEYFyDN3CM39ioSspqXuiHEqXWV8jQSPNs3OzgvtOrWaua4THmsAYbkmks6Oz6Z6280oPd+GHTCZZqac4eiv6GmTpEPz1Alptd/T73qh5I2RJ9B2TaIIZmVrWkQz9itmT135FpbSLxXkYK+J3/t4QUPRcJo29QmMY7xa2p0EdNB+6HtAUVOFW6JVFzLiFSxKwkeUTz5i9KzArqKh8cBQFR7c7vfKLTpyfTde;
	4:MH4NEuyWsgueQOUJFmxOQvp34ADCmc1JCGSlHlPu+doO/aX6rQJbnhyGsXLgaN7Yv4JxnurgwdlImvl3yV3KBAqNbKgudhRMc+TEU1v3EuSvi+HRE+IUEhT8rdPxI2wlnMWJpfAe2QyfGAKR+RFfLa4qyi4qYInNtuhYEzCV7rlw93lDXMaz7XB1jkFZ/8xIxrWpEkoAaVU8HZggmFkLF+RBFuRU6qod3CgHs3T5b8VW1rBYKrawMW9+ASp3XG7+dI2m4wQ+uNs/okSA76rHGDx6aHeb52E8yLenwrgLNexftkRBhQTlZ/2xxtQHRE5m
X-Microsoft-Antispam-PRVS: <VI1PR02MB11825289F375C4D2E4B04C7290610@VI1PR02MB1182.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(8121501046)(5005006)(3002001);
	SRVR:VI1PR02MB1182; BCL:0; PCL:0; RULEID:; SRVR:VI1PR02MB1182; 
X-Forefront-PRVS: 06793E740F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(377424004)(66066001)(42186005)(50986999)(97736004)(5007970100001)(5004730100002)(5001860100001)(47776003)(5001830100001)(64706001)(4001540100001)(46102003)(81156007)(106356001)(33646002)(19580395003)(36756003)(2351001)(87976001)(122386002)(110136002)(50466002)(40100003)(189998001)(50226001)(450100001)(229853001)(105586002)(77156002)(5001960100002)(62966003)(15975445007)(107886002)(101416001)(5003940100001)(5001920100001)(86362001)(77096005)(48376002)(92566002)(68736005)(7099028)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR02MB1182; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR02MB1182;
	23:oeQBGDpoedvNwCwI1k8Y/7XkQgfr+WV9T6Eo8HNO3?=
	=?us-ascii?Q?rzVktswJItKyLQzYzFFFNW3xB0ud/8zXH4t700e+IEYyFH3G2Qbxs/3haKdx?=
	=?us-ascii?Q?5n5gn0zZ5BK/deaGr/2rBnF8NKxEFyaqqwAL89HwL8+y0eqCDbPMLqt2eMaf?=
	=?us-ascii?Q?HbHQiR2o83mqMKCSew7o4KgglVf20MpEVSeVclszgw2YrHmu0IAXlvd7xdHz?=
	=?us-ascii?Q?p85oVijOLlegcS8RGmge7Kxte5VrHEs7+Pql2XhQ/OtZp1yfnXmNwUJDT4IZ?=
	=?us-ascii?Q?pj6z7v2gUuL3DUFNaxeqvx/uKSDQoL3TmwqbvZPkfW8oBwxsbWqmQrISnfvO?=
	=?us-ascii?Q?3dchS46jMWgsk7/EeIM2IOdI5UY7B/MkwOGxDP8wHN7qEC60Flt8y2nAmv/N?=
	=?us-ascii?Q?BE2W2Kq34+kcXcGQ94uDjGN/qz0cwoi+5lo5wvMlkPmzQqnT9acBRecqcbgH?=
	=?us-ascii?Q?R4bjF+rNkUeg6NkO1sjdaipWbdnzs3jxKaEcEnw7tr51l9+ViNpI0fe7Q9cd?=
	=?us-ascii?Q?V30+Qs38IE64+OzpWL30VkleblLb7/I8khX/XQEltwqgldKHOKVC/wXUfzxE?=
	=?us-ascii?Q?HyGJZWyXKArIQI88sp6p1T5MrcDDrhnq5jSXqsiZ3KMDWs+FMSL9nYGv/BKW?=
	=?us-ascii?Q?+6N2498Gr2MnsaDHjds4XjkLnQIIH0WeeQS5bx3e4FkL5RtrOWwHQ8CB+c3k?=
	=?us-ascii?Q?39tpnsFKJ/rHZVWBCUK++Xe5Z2Q/Jw6BfNmYYahDwnx9BzqphpjgHWpEL2YM?=
	=?us-ascii?Q?sH+kdfY3k4vIoU+GisQb5H8E2qBKshNuKt0gJa0lJfC2MFc8gN63zywxlPoQ?=
	=?us-ascii?Q?q8I9h8qs6MOjb9ehnQ8DiVF0zbzaYVjIYbzoKIEasSXydFMub04bL2xA85UF?=
	=?us-ascii?Q?oxMmcEnoa9XgB0JLydqh7GWiuWfWmhJljlVc6rB9JqV8yxovT3Uw6b7Mhws1?=
	=?us-ascii?Q?ClFLt3PTxeUw8XBxeZd0fA2ogrCvHQhoEno94x+qes0hX/w0zvfjgAMrTv/g?=
	=?us-ascii?Q?/kA4cpQSo696xO4vyWoXiDScRjWIe4ApqtVpmLe/09tP3PBHDwhXcOTSAZPm?=
	=?us-ascii?Q?hNGJt8S18NSCS6qDTY/QF9fGQZPYovMxKXMgv1aFIuTKo/p1JETyIwx7jv8D?=
	=?us-ascii?Q?M17KHMOdupdQEanrmO+ok44o7OEJy06uDL2N7elcoh5DZzfab9xXi/6427RR?=
	=?us-ascii?Q?+ksdPEJyfHrAXAl5w4DGDIsUMjYglNlbyj7+EfY8+LdTes0oLSaBOefNu2GL?=
	=?us-ascii?Q?5TubJvTeNq2tHPUzZ6sseVjk8Y/n0Na6XccFb2R?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR02MB1182;
	5:UUmO+3/3eZgJpUeTGIN9hWuv31Y/tyNWRTbmsmO2lLfl4YI2Pq9aSgWgMI+pV3kH9F9/1d6Y7yeY22ryJogVCX9n9wyKOEQbvaSlblIN5G4CA9eSfqJdCQVVdxIA0+j6yp7k7x03sgtQuE9pSsN+3g==;
	24:zc7X29J+dHHb2p/B13v5zOf5azJiDz6DMfZfDWOWeLHOifgsFOv7JUQ4onEcQbcZ+zcLjG6jKDjQz1uKUrvwaDfE8uaF5M46UqGfMGX1ga0=;
	20:gxOtbxY7gmT4dptaFXKFvNy15QHMs17qzEGE+95DlvA6n0GXt8sHN0Ahic896ABPLv+5u++AKm0Jda9zUG427w==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2015 11:43:33.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB1182
Subject: [meta-qt5][PATCH v2 00/11] upstreaming Qt for Device Creation changes
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
X-List-Received-Date: Tue, 25 Aug 2015 11:43:39 -0000
Content-Type: text/plain

As part of Qt for Device Creation [1], we are starting to use meta-qt5 layer
when creating images for our supported devices. We have done number of changes
to the layer when intergrating it with our internal layer. We would now like
to upstream those changes.

v2: rebased, modified qttools patch

[1] https://www.qt.io/qt-for-device-creation

The following changes since commit 40b7a93a3c6cf05136c606824c1cea848b75bcb6:

  qtquick1: allow to disable qtwebkit support (2015-08-24 15:35:52 +0200)

are available in the git repository at:

  git://github.com/sapiippo/meta-qt5 master
  https://github.com/sapiippo/meta-qt5/tree/master

Samuli Piippo (11):
  qt5: make populate_sdk_qt5 reusable
  qt5: improve Qt module package handling
  qt5: improve support for native and nativesdk modules
  qt5: add host paths to qt.conf
  qt5: disable debian auto renaming
  qt5: make qt5.inc reusable qt5-module.bbclass
  qttools: use one recipe for all compilations
  qtbase: remove dependency to sqlite
  qtbase: PACKAGECONFIGs for libproxy and libinput
  qtlocation: use correct dependencies
  qtwebengine: fix problem with recursive qmake call

 classes/populate_sdk_qt5.bbclass                   | 11 +---
 classes/qmake5.bbclass                             |  8 +++
 classes/qmake5_base.bbclass                        | 11 ++++
 .../qt5/qt5.inc => classes/qt5-module.bbclass      | 38 +++++++++++-
 recipes-qt/examples/cinematicexperience_1.0.bb     |  2 +-
 recipes-qt/examples/qt5everywheredemo_1.0.bb       |  2 +-
 recipes-qt/examples/qt5nmapcarousedemo_1.0.bb      |  2 +-
 recipes-qt/examples/qt5nmapper_1.0.bb              |  2 +-
 recipes-qt/examples/qtsmarthome_1.0.bb             |  2 +-
 recipes-qt/examples/quitbattery_1.0.0.bb           |  2 +-
 recipes-qt/examples/quitindicators_1.0.1.bb        |  2 +-
 recipes-qt/libconnman-qt/libconnman-qt5_git.bb     |  2 +-
 recipes-qt/meta/meta-toolchain-qt5.bb              |  4 ++
 recipes-qt/qt5/nativesdk-qttools_git.bb            | 42 -------------
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  6 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  4 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  5 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 recipes-qt/qt5/qttools-native_git.bb               | 24 --------
 recipes-qt/qt5/qttools_git.bb                      | 11 +++-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 .../0005-Generate-usable-qmake_extras.gypi.patch   | 71 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  3 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  4 +-
 42 files changed, 183 insertions(+), 115 deletions(-)
 rename recipes-qt/qt5/qt5.inc => classes/qt5-module.bbclass (86%)
 delete mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
 delete mode 100644 recipes-qt/qt5/qttools-native_git.bb
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-Generate-usable-qmake_extras.gypi.patch

-- 
1.9.1


