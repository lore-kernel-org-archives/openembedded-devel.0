Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1QHFvE-0003wR-JO
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 15:45:52 +0200
Received: (qmail invoked by alias); 03 May 2011 13:43:14 -0000
Received: from 230.118.101-84.rev.gaoland.net (EHLO [192.168.42.72])
	[84.101.118.230]
	by mail.gmx.net (mp018) with SMTP; 03 May 2011 15:43:14 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18ujl4ueW4uyiqG2jBLgpW26utV19cGfCXx9NuMzM
	T7Y7WpEQB0Mw4g
Message-ID: <4DC00670.6080601@gmx.net>
Date: Tue, 03 May 2011 15:43:12 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DBFC26B.2090006@gmx.net> <ipoo3s$h7c$1@dough.gmane.org>
In-Reply-To: <ipoo3s$h7c$1@dough.gmane.org>
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: Re: arduino IDE on beagleboard
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
X-List-Received-Date: Tue, 03 May 2011 13:45:52 -0000
X-Groupsio-MsgNum: 31586
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig2112510D8760C904CE5162CD"

--------------enig2112510D8760C904CE5162CD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Am 03.05.2011 13:15, schrieb Koen Kooi:
> First you have to fix the included rxtx install:
> http://dominion.thruhere.net/koen/cms/making-processing-arduino-ide-rep=
licaorg-work-on-arm
Yep, same story as on an amd64 machine. :)

>> Could you upload programs to the
>> arduino and receive stuff through the serial port?
>=20
> That works, and if you download and untar:
>=20
> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-binutils-2.2=
1.tar.bz2
> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-gcc-4.5.2.ta=
r.bz2
> http://dominion.thruhere.net/koen/angstrom/beagleboard/avr-libc-1.7.1.t=
ar.bz2
How did you build those? Directly on a BB using gcc? I looked into
making recipes for OE for this
but my toolchain-foo is way to small for this.

> You can even compile the included examples. I succesfully compiled and
> uploaded the serial test app to the
> http://elinux.org/BeagleBoard_Trainer expansionboard attached to my xM.=

> I haven't tried using it on a proper arduino board yet, but that uses
> the same bootloader as the trainer.
Great! Then I think this is going to work without problems!

Thanks for trying this out. So I am going to take a BB/PB to LinuxTag
along with an arduino starterkit ... :)

Regards,
Robert

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



--------------enig2112510D8760C904CE5162CD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3ABnAACgkQG9cfwmwwEtqonQCfUxC7OH3H1XmYuE94zbXAL7h3
v20An0i1Nc6HJ+7/rVTnN50vkx4r6cvd
=Kt8v
-----END PGP SIGNATURE-----

--------------enig2112510D8760C904CE5162CD--
