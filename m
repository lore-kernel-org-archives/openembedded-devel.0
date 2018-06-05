Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 901 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jun 2018 12:34:11 UTC
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id AF0DF771C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:34:11 +0000 (UTC)
X-AuditID: c0a80110-cc65b9e000000f28-11-5b167fbed4cc
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id B6.77.03880.EBF761B5;
	Tue,  5 Jun 2018 14:19:11 +0200 (CEST)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 5 Jun 2018 14:14:10 +0200
Message-Id: <20180605121410.16081-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.17.1
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 05/06/2018 14:19:09,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 05/06/2018 14:19:09,
	Serialize complete at 05/06/2018 14:19:09,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 05.06.2018 14:19:09
X-TNEFEvaluated: 1
X-Disclaimed: 20795
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnluLIzCtJLcpLzFFi42I5sILRRnd/vVi0QdNcRouLh5cyOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoEro3H9CqaC1xwV81ZPZmxg/MPexcjJISFgItG0YC8ziC0ksJlR
	Yt98ExCbV0BQ4uTMJywgNpuArcSRCV/BbBEBXYmPH+YygtjMAtYS75cvYAWxhQXMJFYv/AcU
	5+BgEVCRmNcbBTHGQ2LLn9XMEOXaEssWvmaGWCsvsXrDASCbC8juYJaY/30CK0RCSOL04rNQ
	RcISVy7+Z5zAyDcLyUmzkMxawMi0ilE8NzEzx0gvqUg3sbQkPzexJDM/Ty85P3cTIyR4BHYw
	7n6jfYhRgINRiYf3T5ZYtBBrYllxZe4hRgkOZiURXh53oBBvSmJlVWpRfnxRaU5q8SFGaQ4W
	JXHe4LXs0UIC6YklqdmpqQWpRTBZJg5OqQbGwE2M/dX3FNdMnyS/75g0q1rkEffe73f2rTTh
	2e+wfXbRjDS+qB9rIndc8PyS298f1nnzo3xrSnzYHfHpRVF7TN9euhiw9SrfoXU3LTy1GER3
	+Hy7zDQtmVuT+f2dB+rHz08OdMnl5LmSeiL5s4D4ovNGG7/PYUq7sze3+UJMdVTYQn6rey9a
	lFiKMxINtZiLihMBu2bXExoCAAA=
Subject: [meta-oe][PATCH] libtinyxml2: update to 6.2.0
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
X-List-Received-Date: Tue, 05 Jun 2018 12:34:12 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
---
 .../libtinyxml2/{libtinyxml2=5F5.0.1.bb =3D> libtinyxml2=5F6.2.0.bb}  | 2 =
+-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2=5F5.0.1.bb =3D> li=
btinyxml2=5F6.2.0.bb} (88%)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb b/m=
eta-oe/recipes-support/libtinyxml2/libtinyxml2=5F6.2.0.bb
similarity index 88%
rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F6.2.0.bb
index c763a6c2b..bbb69a1dd 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F5.0.1.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2=5F6.2.0.bb
@@ -6,7 +6,7 @@ LIC=5FFILES=5FCHKSUM =3D "file://tinyxml2.cpp;endline=3D22;=
md5=3Dc19221dbd8a66ad3090462af4
=20
 SRC=5FURI =3D "git://github.com/leethomason/tinyxml2.git"
=20
-SRCREV =3D "37bc3aca429f0164adf68c23444540b4a24b5778"
+SRCREV =3D "c1424ee4e1c1ed8129d9147ccc920ab92dd9ef86"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.17.1



