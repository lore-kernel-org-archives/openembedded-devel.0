Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <frederik.sdun@googlemail.com>) id 1OxxNs-00020l-Iy
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 09:35:39 +0200
Received: by bwz2 with SMTP id 2so5278548bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=AUJHXqe0m7bTCoz2MRY8bVkn7XuYAguvYulDgoETGaw=;
	b=er5D1tZE40PCQ/6vQ09Fdd/cDTw+jpABk5fG894R+lcbyM+G8/O/0gs+sh2C+10NeF
	q8z1Fvw3OvmL5NCN/htxpXQypsd0YkDvqodWR8EMMZG8gwf5ur4LYoBjJRpHXJ2fhFvA
	Dv0hJP1uGBygOUHWmQT/XwRvuP2yuCmcXq9Ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C+JBnfl5AOQ16hgQnAKGIV6/kjdNtUyobtGvQ0dgiK72F7HB1Pdc33OxOdf1weWGCO
	2g0wxYFY45hFPVvoyREwvcIKe/3xskfXcEL92IyenW2SEgaIkTABQmL75Sd1olZr9UDn
	bePx2RRvtHZTXTx9aHj5+mDBYGFAz3hfTb+pA=
Received: by 10.204.68.145 with SMTP id v17mr2523141bki.81.1285054522926;
	Tue, 21 Sep 2010 00:35:22 -0700 (PDT)
Received: from smtp.googlemail.com ([93.216.213.29])
	by mx.google.com with ESMTPS id f10sm7295972bkl.5.2010.09.21.00.35.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Sep 2010 00:35:21 -0700 (PDT)
Received: by smtp.googlemail.com (nbSMTP-1.00) for uid 1000
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128/128 bits))
	frederik.sdun@googlemail.com; Tue, 21 Sep 2010 09:35:12 +0200 (CEST)
Date: Tue, 21 Sep 2010 09:35:09 +0200
From: Frederik Sdun <frederik.sdun@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100921073508.GA5506@thinky>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
	<20100921051747.GA3989@thinky>
	<AANLkTim6_S3DW_U5V3P0HkFTcAsSWqbu3T5q2UWPajKE@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTim6_S3DW_U5V3P0HkFTcAsSWqbu3T5q2UWPajKE@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: frederik.sdun@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Tue, 21 Sep 2010 07:35:39 -0000
X-Groupsio-MsgNum: 23750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Khem Raj <raj.khem@gmail.com> [21.09.2010 07:43]:
> On Mon, Sep 20, 2010 at 10:17 PM, Frederik Sdun
> <frederik.sdun@googlemail.com> wrote:
> > * Paul Menzel <paulepanter@users.sourceforge.net> [21.09.2010 00:18]:
> > Hi,
> >
> > fso is quit untested with none GNU libcs and we partly depend on it. I
> > wrote a short patch which add a --enable-no-gnuism switch for configure,
> > but want to talk to Michael, before commiting it. Could you test it and
> > report more gnuism in our code? And is possible to get a backtrace with
> > uClibc which is not gnuism, but available in all none-GNU
> > implementations?
>=20
> instead you could use the defines like __UCLIBC__ which are there when
> using uclibc.
>=20
This is only available when compiling the C code. In the stage of
compiling vala code it's not available.
--=20
IRC: playya @ Freenode, Gimpnet
xmpp: playya@draugr.de
identi.ca: playya

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkyYYCwACgkQvbwBzXsbjyqPvACfaz9IB5VoEOryse0Ny1azfqC3
ahEAn1UvFeSUj+s9KXdG7opBUqeiNyGv
=fQ+e
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
