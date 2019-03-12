Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 12 Mar 2019 09:19:47 UTC
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4B99E6C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 09:19:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 02:10:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,470,1544515200"; d="scan'208";a="140060141"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Mar 2019 02:10:15 -0700
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.121]) by
	PGSMSX101.gar.corp.intel.com ([169.254.1.250]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 17:10:14 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "mingli.yu@windriver.com" <mingli.yu@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 2/3] librelp: Upgrade to 1.4.0
Thread-Index: AQHU2K58Ybe/ECzM9kSuXXRh2XtojKYHtRXA
Date: Tue, 12 Mar 2019 09:10:12 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F30230FEA0@PGSMSX105.gar.corp.intel.com>
References: <20190312083415.87524-1-mingli.yu@windriver.com>
	<20190312083415.87524-2-mingli.yu@windriver.com>
In-Reply-To: <20190312083415.87524-2-mingli.yu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzRjYWM2OGEtMDZmYS00Mzg0LWJjMGQtMzhkYTlkMDM1NTljIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieVVva3lsNHYwcTBsOTk1bWViSjdpMkJQVndUcjJRVDlUeE9ERGZRYVV6YkNDV080c3NYc0I5dnNxQWFONGY1XC8ifQ==
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 2/3] librelp: Upgrade to 1.4.0
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
X-List-Received-Date: Tue, 12 Mar 2019 09:19:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>  .../rsyslog/{librelp_1.2.18.bb =3D> librelp_1.4.0.bb}               | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-
> extended/rsyslog/{librelp_1.2.18.bb =3D> librelp_1.4.0.bb} (100%)
>=20
> diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb b/meta-oe=
/recipes-
> extended/rsyslog/librelp_1.4.0.bb
> similarity index 100%
> rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
> rename to meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb

You forgot to bump SRCREV to point to this revision.

