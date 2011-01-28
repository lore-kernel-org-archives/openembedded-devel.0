Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PirFr-0004Mr-F5 for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 17:32:59 +0100
Received: from f053044076.adsl.alicedsl.de ([78.53.44.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PirF5-0003wl-7k for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 16:32:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=Oqmf7KsN=_ygrZ4YkuO+aLCTsyn9e1jE13QYo@mail.gmail.com>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
	<1296220508.3831.8.camel@mattotaupa>
	<AANLkTi=Oqmf7KsN=_ygrZ4YkuO+aLCTsyn9e1jE13QYo@mail.gmail.com>
Date: Fri, 28 Jan 2011 17:32:10 +0100
Message-ID: <1296232330.21132.17.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 16:32:59 -0000
X-Groupsio-MsgNum: 28572
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-lNOxUe4D/9WMDBDepkOv"

--=-lNOxUe4D/9WMDBDepkOv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Marek,


A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top
http://en.opensuse.org/openSUSE:Mailing_list_netiquette#Interleaved_style


Am Freitag, den 28.01.2011, 14:44 +0100 schrieb Marek Sujak:

> I'm sorry that i don't typed that.

no problem. It is no hard requirement and unfortunately often left out
in the commit message.

> I checked:
> console-image -> OK
> base-image -> OK
> x11-image -> OK
> qt4e-image -> +/-OK (Alignment trap)
> qt4e-demo-image -> +/-OK (Alignment trap)

What distribution (and Git branch) did you use? The tool chain depends
on this choice.

> It depends on:
> barebox 2010.10 + patch.
> kernel 2.6.35 + patch.
>=20
> I will commit these files today.
>=20
> There are of-course bugs in kernel, but the images works fine for me.
> I corrected my Git username as you recommended. (thanks)

Thank you for your answer. I do not have any commit access, so I hope
that the other developers will push your patches soon.


Thanks,

Paul

--=-lNOxUe4D/9WMDBDepkOv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1C74UACgkQPX1aK2wOHVhROQCeJOnbxdRAX8577ipc79Vj12Wu
++gAniZKOWvI6KhPt6PN4B970zRyxjKB
=QhNE
-----END PGP SIGNATURE-----

--=-lNOxUe4D/9WMDBDepkOv--
