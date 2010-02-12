Received: from relay04.stack.nl ([131.155.140.107] helo=mx1.stack.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ruud@il.fontys.nl>) id 1NfrKf-0000cn-MO
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 09:57:04 +0100
Received: by mx1.stack.nl (Postfix, from userid 65534)
	id AB2F81DD72F; Fri, 12 Feb 2010 09:54:28 +0100 (CET)
Received: from mail.il.fontys.nl (mail.il.fontys.nl
	[IPv6:2001:4128:1000:1000::7])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.stack.nl (Postfix) with ESMTPS id 762A31DD642
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 09:54:26 +0100 (CET)
Received: by mail.il.fontys.nl (Postfix, from userid 1004)
	id 3C1131147E; Fri, 12 Feb 2010 09:54:26 +0100 (CET)
Received: from charm.il.fontys.nl (charm.il.fontys.nl
	[IPv6:2001:4128:1000:1000::34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.il.fontys.nl (Postfix) with ESMTPS id EB3F911459
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 09:54:14 +0100 (CET)
Received: by charm.il.fontys.nl (Postfix, from userid 1838)
	id 99FC240B5; Fri, 12 Feb 2010 09:54:14 +0100 (CET)
Date: Fri, 12 Feb 2010 09:54:14 +0100
From: Ruud Althuizen <ruud@il.fontys.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100212085414.GG1638@il.fontys.nl>
References: <20100203104829.GL17820@il.fontys.nl>
	<1265195232.5591.75.camel@mattotaupa>
	<20100203111649.GN17820@il.fontys.nl>
	<20100210072033.GF1638@il.fontys.nl>
	<ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b11002092333s3a90d623xd6234e392d84925d@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 131.155.140.107
X-SA-Exim-Mail-From: ruud@il.fontys.nl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Fri, 12 Feb 2010 08:57:04 -0000
X-Groupsio-MsgNum: 16705
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xA/XKXTdy9G3iaIz"
Content-Disposition: inline

--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 10 Feb 2010 08:33 AM, Frans Meulenbroeks wrote:
> 2010/2/10 Ruud Althuizen <ruud@il.fontys.nl>:
> > On Wed 03 Feb 2010 12:16 PM, Ruud Althuizen wrote:
> >> On Wed 03 Feb 2010 12:07 PM, Paul Menzel wrote:
> >> > Am Mittwoch, den 03.02.2010, 11:48 +0100 schrieb Ruud Althuizen:
> >> > > In the attached patches there is a machine config and kernel recip=
e for the
> >> > > LPC3250 based Embedded Artists development board.
> >> > >
> >> > > If you have any suggestions for the attached patches, please give =
them so I
> >> > > can fix it.
> >> >
> >> > Please attach them. ;-)
> >> Ah, now I remember that mutt discards attachments when forwarding :/.
> > So, it's been a week now. And not even an reply. Any chance of this get=
ting
> > into the dev tree?
>=20
> I just skimmed over it.
> First impression is ok, and as this will not break anything else, I
> have no problems getting it added.
I just found out about the patch queue and that my patch is added[1]. The
problem is though that I attached _patches_. Both patches are useless on
their own. The new kernel recipe contains all the patches for the board to
be able to boot.


1: http://patchwork.openembedded.org/patch/1541/

--=20
Kind regards,
Ruud Althuizen

--xA/XKXTdy9G3iaIz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (FreeBSD)

iEYEARECAAYFAkt1FzUACgkQkqncCMFskRUjWQCZAa6LfEhZgkWFAYfPZ1Q50o5e
yJ8An3hOJD32ofnu9reYtmMhlHtck6xV
=SMP7
-----END PGP SIGNATURE-----

--xA/XKXTdy9G3iaIz--
