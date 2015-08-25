Return-Path: <jbriance@cisco.com>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Aug 2015 07:48:00 UTC
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mail.openembedded.org (Postfix) with ESMTP id C12B473E11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=808; q=dns/txt; s=iport;
	t=1440488881; x=1441698481;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=aaaOL7Bcn6j4K7SQMSIygOx9A+aObr2GT6w8ChFE6ck=;
	b=EY85mKmG/Z+6qo5kaxK6JEzBxP4uztSAuzh9OX/SBd0uTlnR1cCdVj5E
	bh8OmYDxfrRXvknLYpMSjkKD6X/xmFBnJYIVr8X/LeHfvyEs+CoKKlJLs
	0u6i8Q4k+hFeV0qkCZilPC58Ada4SAE4ECnd++32AQ5zpKlEvkJXTC4Im w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A0CbAgB7GtxV/4QNJK1dgxtUaQaqW5MfAQmBc4V/AoEvOBQBAQEBAQEBfwuEJAEBBDo/EAIBKhQQMiUCBA4FCIgmxzwBAQEBAQEBAQEBAQEBAQEBAQEBAQEXj3w0MQeDGIEUAQSVNAGFBaI7JoIPG4FUcYEFQ4EEAQEB
X-IronPort-AV: E=Sophos;i="5.15,744,1432598400"; d="scan'208";a="21403651"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by rcdn-iport-8.cisco.com with ESMTP; 25 Aug 2015 07:38:03 +0000
Received: from XCH-RCD-008.cisco.com (xch-rcd-008.cisco.com [173.37.102.18])
	by alln-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id t7P7c3Ku025976
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 07:38:03 GMT
Received: from xch-rcd-008.cisco.com (173.37.102.18) by XCH-RCD-008.cisco.com
	(173.37.102.18) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 25 Aug 2015 02:38:03 -0500
Received: from xhc-aln-x11.cisco.com (173.36.12.85) by xch-rcd-008.cisco.com
	(173.37.102.18) with Microsoft SMTP Server (TLS) id 15.0.1104.5 via
	Frontend Transport; Tue, 25 Aug 2015 02:38:03 -0500
Received: from xmb-aln-x12.cisco.com ([169.254.7.226]) by
	xhc-aln-x11.cisco.com ([173.36.12.85]) with mapi id 14.03.0248.002;
	Tue, 25 Aug 2015 02:38:02 -0500
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5][PATCH] qtquickcontrols: Remove LGPL-2.1 from
	LICENSE list
Thread-Index: AQHQ3wiq+Oe2w2ML0UKOTp1SRKvX054cU21A
Date: Tue, 25 Aug 2015 07:38:02 +0000
Message-ID: <5940D1D9F240BA44AEF939055CF1358D05A5064F@xmb-aln-x12.cisco.com>
References: <1440488138-5440-1-git-send-email-jbriance@cisco.com>
In-Reply-To: <1440488138-5440-1-git-send-email-jbriance@cisco.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.60.62.125]
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtquickcontrols: Remove LGPL-2.1 from LICENSE list
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
X-List-Received-Date: Tue, 25 Aug 2015 07:48:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

* LGPLv21 has been removed since 5.5 release

Signed-off-by: Julien Brianceau <jbriance@cisco.com>
---
 recipes-qt/qt5/qtquickcontrols_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquick=
controls_git.bb
index 51db1ae..823923e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
=20
-LICENSE =3D "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LG=
PL-3.0) | GPL-2.0"
+LICENSE =3D "GFDL-1.3 & BSD & LGPL-3.0 | GPL-2.0"
 LIC_FILES_CHKSUM =3D " \
     file://LICENSE.LGPLv3;md5=3Dc4fe8c6de4eef597feec6e90ed62e962 \
     file://LICENSE.FDL;md5=3D6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
--=20
1.9.5


