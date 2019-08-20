Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Aug 2019 09:26:36 UTC
Received: from mail2.br-automation.com (mail2.br-automation.com
	[213.33.116.61])
	by mail.openembedded.org (Postfix) with ESMTP id A7A607ED48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 09:26:36 +0000 (UTC)
X-AuditID: c0a80110-4dbff70000001e6d-7b-5d5bb947e33f
Received: from brsmtp01.br-automation.co.at (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id E4.9F.07789.749BB5D5;
	Tue, 20 Aug 2019 11:11:36 +0200 (CEST)
From: "Johannes Pointner" <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Aug 2019 11:10:35 +0200
Message-Id: <20190820091035.4189-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 20/08/2019 11:11:38,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 20/08/2019 11:11:38,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release 9.0.1FP10
	HF197|April 16, 2018) at 08/20/2019 11:11:35 AM
X-TNEFEvaluated: 1
X-Disclaimed: 47895
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNJMWRmVeSWpSXmKPExsVyYAWjja7HzuhYg5UfGC0uHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujP0nHzEX3OeuaJzwlq2BcT1XFyMnh4SAicTEF+1MXYxcHEIC
	WxklZv+/xgSSYBOwl/j5sI0NxBYR0JX4+GEuI4jNLGAr8fD/bTBbWMBM4s+ij2A1LAKqEq0t
	/8HivALuEhdaVrFC1GtLLFv4mhlimbzEqy/nmSBqBCVOznzCArJYQuAJk8StPetYIYqEJE4v
	PgvVICzx/MlcpgmMfLOQzJqFpH8BI9MqRvHcxMwcI72kIt3E0pL83MSSzPw8veT83E2MkAAS
	2MG4+432IUYmDsZDjBIczEoivBVzomKFeFMSK6tSi/Lji0pzUosPMUpzsCiJ865cwRErJJCe
	WJKanZpakFoEk2Xi4JRqYFQ/9zKSVVGOl1E5eV3YPFPOpew7dA90/K4zcH63+KXE2wVybNIe
	E4uvlrqFTn+1i/kci+6y5J+LeE6cm8d73T+w5XqCdtwauYnik41nfUt73HT0C9/v34a79XQ5
	q+ZcfPK9jGu7YMzBG0I6Rz6f3h9ho1Bt3vxFKPX2BDn3W5wf55y4psTz6oASS3FGoqEWc1Fx
	IgDU4UtTDgIAAA==
Subject: [meta-oe][PATCH] libtinyxml2: update to 7.1.0
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
X-List-Received-Date: Tue, 20 Aug 2019 09:26:37 -0000
Content-Transfer-Encoding: quoted-printable

Also use license from new LICENSE.txt instead of using text from
tinyxml2.cpp.

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../{libtinyxml2=5F7.0.1.bb =3D> libtinyxml2=5F7.1.0.bb}            | 4 ++=
--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2=5F7.0.1.bb =3D> li=
btinyxml2=5F7.1.0.bb} (69%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.0.1.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.1.0.bb
similarity index 69%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.0.1.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.1.0.bb
index e4bb3f326..9e197a918 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F7.1.0.bb
@@ -2,11 +2,11 @@ SUMMARY =3D "TinyXML-2 is a simple, small, efficient, C++=
 XML parser that can be e
 HOMEPAGE =3D "http://www.grinninglizard.com/tinyxml2/"
 SECTION =3D "libs"
 LICENSE =3D "Zlib"
-LIC=5FFILES=5FCHKSUM =3D "file://tinyxml2.cpp;endline=3D22;md5=3Dc19221dbd=
8a66ad3090462af4c5de5e7"
+LIC=5FFILES=5FCHKSUM =3D "file://LICENSE.txt;md5=3D135624eef03e1f1101b9ba9=
ac9b5fffd"
=20
 SRC=5FURI =3D "git://github.com/leethomason/tinyxml2.git"
=20
-SRCREV =3D "de6d164822076f9b1e26a7222808a25ac03867d8"
+SRCREV =3D "9c740e8d2341bd46dbe8e87053cdb4d931971967"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.22.1



