Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1KqnL9-0001Fb-8W
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 13:17:55 +0200
Received: (qmail invoked by alias); 17 Oct 2008 11:17:47 -0000
Received: from p579E1958.dip.t-dialin.net (EHLO [192.168.10.3]) [87.158.25.88]
	by mail.gmx.net (mp060) with SMTP; 17 Oct 2008 13:17:47 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+QYP1pNkCQBD/dXIcmvbXOrF/jAJIyp2qjFCIf02
	5s94HoivIzcoA0
Message-ID: <48F8745B.2030001@gmx.net>
Date: Fri, 17 Oct 2008 13:17:47 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48F825DE.90104@miromico.ch>
In-Reply-To: <48F825DE.90104@miromico.ch>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: Adding support for our
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
X-List-Received-Date: Fri, 17 Oct 2008 11:17:55 -0000
X-Groupsio-MsgNum: 6258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig65FB6FA8FFB0C6F0A29F93D3"

--------------enig65FB6FA8FFB0C6F0A29F93D3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Alexm

Alex Raimondi schrieb:
> We have a new AVR32 based embedded linux board (www.miromico.com/hammer=
head), which is available now.=20
That is a nice little board you have there. I personally like the AVR32
architecture. Atmel also has the better policy when it comes to
specifications. So I really like to see more AVR32 being used. :)

> We would like to use OpenEmbedded as our major build system to allow ou=
r customers to build their u-boot,=20
> kernel and rootfs.
Great stuff. OE already supports the ATNGW100 (have one here) and the
AT32STK1000. If your board can boot with the same linux 2.6.24 (or with
patches to that) it will be quite easy to support your device.

> Of course we would like to contribute to oe, as well.=20
Very nice!

> Is there such a thing as a board maintainer in oe? If yes, how can we b=
ecome one?
We have a "MAINTAINERS" file. If you are a contributor you can add
information about the machines you are maintaining. This mainly means
that people will ask you when stuff breaks. In theory it should also
mean that people will ask you *first* if things are changed in OE that
affect your device but AFAIK we have no strict policies regarding this.

> We allready adapted a few bb files to get oe building our u-boot and ke=
rnel. Should we push out these changes?=20
> How?
Open a bug report.

> We have two developers working at this project. Our board is AVR32 base=
d.
 So, if oe is our major build system we would have to take care that
avr32 allway builds.
 This means testing, fixing, extending support. I hope this would be
benefit enough to endure our newbie questions
 while we are getting known with the build system.
OE has a very steep learning curve but when you managed it you will
benefit very much from its great flexibility.

Thanks for supporting our project!

Regards
Robert




--------------enig65FB6FA8FFB0C6F0A29F93D3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI+HRbG9cfwmwwEtoRAuXUAKCJezNkzNfUZQZwnu7WD/xTA8Pq4ACfaLXc
Lz9E+k2gOA6n7GCrAYbXE04=
=ucK5
-----END PGP SIGNATURE-----

--------------enig65FB6FA8FFB0C6F0A29F93D3--
