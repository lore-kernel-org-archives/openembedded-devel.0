Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6B5EB60557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:14:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 May 2015 08:13:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,373,1427785200"; d="scan'208";a="724036706"
Received: from irsmsx153.ger.corp.intel.com ([163.33.192.75])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 08:13:55 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.178]) by
	IRSMSX153.ger.corp.intel.com ([169.254.9.6]) with mapi id
	14.03.0224.002; Tue, 5 May 2015 16:13:54 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to
	bluez5_5.29.bbappend,
	to fix build issue below: ERROR: No recipes available for:
	/home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
Thread-Index: AQHQhyuPenUd3g4zQU+5R0pPYwxzGZ1te2eQ
Date: Tue, 5 May 2015 15:13:53 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F4BBCDC@irsmsx105.ger.corp.intel.com>
References: <1430824709-22286-1-git-send-email-thomas.perrot@tupi.fr>
	<20150505120132.GB2378@jama>
In-Reply-To: <20150505120132.GB2378@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: tprrt <tprrt@tupi.fr>
Subject: Re: [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to bluez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available for: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
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
X-List-Received-Date: Tue, 05 May 2015 15:14:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin, can I help with the aforementioned build failures?
Also, NACK for the original patch.
/Cristian

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Martin Jansa
Sent: Tuesday, May 5, 2015 3:02 PM
To: openembedded-devel@lists.openembedded.org
Cc: tprrt
Subject: Re: [oe] [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to blu=
ez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available fo=
r: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-c=
onnectivity/bluez/bluez4_4.101.bbappend

On Tue, May 05, 2015 at 01:18:29PM +0200, Thomas Perrot wrote:
> From: tprrt <tprrt@tupi.fr>

NAK, see pending patches for bluez4 (I plan to merge them as soon as builds=
 stop failing completely).

> Signed-off-by: tprrt <tprrt@tupi.fr>
> ---
>  .../bluez/{bluez4_4.101.bbappend =3D> bluez5_5.29.bbappend}             =
 |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)  rename=20
> meta-systemd/oe-core/recipes-connectivity/bluez/{bluez4_4.101.bbappend=20
> =3D> bluez5_5.29.bbappend} (100%)
>=20
> diff --git=20
> a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappen
> d=20
> b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
> similarity index 100%
> rename from=20
> meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
> rename to=20
> meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bbappend
> --
> 1.7.10.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

