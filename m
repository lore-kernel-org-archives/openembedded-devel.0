Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F310B65E94
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Oct 2014 14:11:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2014 07:11:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,796,1406617200"; d="scan'208";a="621379435"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2014 07:10:36 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX102.ger.corp.intel.com ([169.254.2.25]) with mapi id
	14.03.0195.001; Mon, 27 Oct 2014 14:05:23 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH 0/3] Multimedia packages upgrades
Thread-Index: AQHP7uAnTTKBMLm1okCaLwG/S99QuJxEADCw
Date: Mon, 27 Oct 2014 14:05:23 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F3807BB@IRSMSX105.ger.corp.intel.com>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Multimedia packages upgrades
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
X-List-Received-Date: Mon, 27 Oct 2014 14:11:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.
/Cristian

-----Original Message-----
From: Iorga, Cristian=20
Sent: Thursday, October 23, 2014 7:40 PM
To: openembedded-devel@lists.openembedded.org
Cc: Iorga, Cristian
Subject: [PATCH 0/3] Multimedia packages upgrades

mpd and mg123 upgrades and fixes.

mpd add some new dependencies, as signaled by buildhistory.

Cristian Iorga (3):
  mpd: fix fetch failure for 0.18.x
  mpg123: upgrade to 1.21.0
  mpd: upgrade to 0.19.1

 .../mpg123/{mpg123_1.19.0.bb =3D> mpg123_1.21.0.bb}                | 4 ++-=
-
 .../recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D> mpd_0.19.1.bb}  | 9 +++=
+-----
 2 files changed, 6 insertions(+), 7 deletions(-)  rename meta-multimedia/r=
ecipes-multimedia/mpg123/{mpg123_1.19.0.bb =3D> mpg123_1.21.0.bb} (94%)  re=
name meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.9.bb =3D> mpd_0.1=
9.1.bb} (89%)

--
1.9.1


