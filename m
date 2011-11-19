Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1RRjbt-0007HO-5M for openembedded-devel@lists.openembedded.org;
	Sat, 19 Nov 2011 13:01:29 +0100
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAJBpoRi017468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 05:51:50 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAJBpoq0004530
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 05:51:50 -0600 (CST)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAJBpo14014028
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Nov 2011 05:51:50 -0600 (CST)
Received: from DFLE34.ent.ti.com ([fe80::c12:d795:2e56:2d02]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%20]) with mapi id
	14.01.0323.003; Sat, 19 Nov 2011 05:51:50 -0600
From: "Kridner, Jason" <jdk@ti.com>
To: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  dm3730
Thread-Index: AQHMppI5W1XF7BSJMEe8nIH53K7FJ5W0Fhox
Date: Sat, 19 Nov 2011 11:51:49 +0000
Message-ID: <294F4A1A-29D7-492E-9E2F-2414F63F7C77@ti.com>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
In-Reply-To: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: dm3730
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Nov 2011 12:01:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Nov 19, 2011, at 3:07 AM, "Raffaele Recalcati" <lamiaposta71@gmail.com> =
wrote:

> I'm sorry for so easy question!
> It seems that if I compiling for beagleboard I get a 2.6.39 running
> also on dm3730 cpu.

I recommend moving on to OE-core and meta-ti if you are doing new developme=
nt. That is 3.0 today, but I expect we will bring it in-line with the Beagl=
eBone kernel.=20

> It's not clear to me how can dsp codec work correctly at the same time
> with omap3530 and with dm3730.

Same DSP?  There are fairly few differences between those two devices.  Mos=
tly a process shrink and incremental improvements.=20

>=20
> Thx,
> Raffaele
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


