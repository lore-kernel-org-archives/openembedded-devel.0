Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSXGm-0000hE-TJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 18:03:01 +0100
Received: by wwp14 with SMTP id 14so8626566wwp.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 08:56:31 -0800 (PST)
Received: by 10.227.206.82 with SMTP id ft18mr9431520wbb.21.1321894590869;
	Mon, 21 Nov 2011 08:56:30 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w8sm4413241wiz.4.2011.11.21.08.56.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 08:56:29 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6297782.2EN2Ceo0kI@helios>
Date: Mon, 21 Nov 2011 17:56:24 +0100
Message-Id: <56E3395A-7667-4B92-9DE4-828E647CC560@dominion.thruhere.net>
References: <CAFU7RzPxXLOA2FUQC7v-VuOmZ_G6_5gwokHy4vNt_WB-pcOn7g@mail.gmail.com>
	<CAFU7RzMM=ur61PsQdBwbG2m9XT4ubCcD8Be4LiiUtFX=js_EhQ@mail.gmail.com>
	<jadt5n$67m$1@dough.gmane.org> <6297782.2EN2Ceo0kI@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 21 Nov 2011 17:03:01 -0000
X-Groupsio-MsgNum: 35497
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D34ADA57-AF4E-466D-A4D9-5832C9AA64A4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D34ADA57-AF4E-466D-A4D9-5832C9AA64A4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 21 nov. 2011, om 17:47 heeft Paul Eggleton het volgende geschreven:

> On Monday 21 November 2011 17:10:30 Koen Kooi wrote:
>> Worse, if you follow the offical yocto instructions you'll get only =
broken
>> and/or incomplete beagleboard support.
>=20
> Rather than vague assertions perhaps you would care to elaborate on =
what's=20
> broken and/or incomplete about our beagleboard support? If the =
implication is=20
> that it won't work at all, then that is simply not true.

For starters:

* no DSP support
* no SGX support
* no LCD support
* incomplete expansionboard support
* broken powermanagement

So if you only need serial port and audio yocto is all you need. Given =
that this thread was about DSP support the implication that the yocto =
support is broken and/or incomplete still stands.



--Apple-Mail=_D34ADA57-AF4E-466D-A4D9-5832C9AA64A4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7KgrsACgkQMkyGM64RGpEuOgCgqVVfVdUzDlCvQQM0+kdplOT8
ThAAoITRWQmx3V0lyaCuDowUA6fwMf5c
=zzQK
-----END PGP SIGNATURE-----

--Apple-Mail=_D34ADA57-AF4E-466D-A4D9-5832C9AA64A4--
