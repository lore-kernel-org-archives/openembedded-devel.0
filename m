Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RRPAP-0001oP-Al
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 15:11:45 +0100
Received: by bkbzs2 with SMTP id zs2so3419841bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CFW6chSofv8JBqzmc+pRq0dmmA9/OxkCA4lpWukLs5g=;
	b=h5LahxcwgpWVFEwY+jpMBNgGRJBZqIMgjrQIi+n31RU9v9r79iy2v06Y77Gg5Bx/io
	6+Go3diCWTxeku0i6lQEMwQhKLDSj3tae6Y2NupeEG5WSOa888GyBtsRm8RIG4ouYk0x
	p0ITVMUn4Fw45SmlTH5XAf+BkxFEfDeJFVwqU=
Received: by 10.205.117.134 with SMTP id fm6mr253435bkc.93.1321625119046;
	Fri, 18 Nov 2011 06:05:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r5sm5460935fam.4.2011.11.18.06.05.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 06:05:18 -0800 (PST)
Date: Fri, 18 Nov 2011 15:05:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111118140506.GC3549@jama.jama.net>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<20111118131116.GB3549@jama.jama.net>
	<CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
	<3257489.OMhGnQsRki@helios>
	<CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 14:11:45 -0000
X-Groupsio-MsgNum: 35454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 03:02:58PM +0100, Andrea Adami wrote:
> On Fri, Nov 18, 2011 at 2:51 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 18 November 2011 14:45:32 Andrea Adami wrote:
> >> My thoughts are that Pavel is always testing bleeding edge way before
> >> we commit it in OE while Dmitry told me repeatedly he prefers to base
> >> his patches on stable, older kernels.
> >
> > You're right, but I figure if we have the mechanism to allow people to =
build a
> > bleeding edge kernel already, let's keep it for the moment.
> >
> > Cheers,
> > Paul
> >
> > --
> >
> > Paul Eggleton
> > Intel Open Source Technology Centre
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> Ok, I'll refresh and refactor the recipe then. Patch will follow.

Thanks,

btw I have patch for 3.2-rc2 here:
https://gitorious.org/shr/meta-handheld/commit/4386c0092fcdfcb90e294972d339=
f33fa6e80786?format=3Dpatch

but waiting to get home and reboot my spitz to test it..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7GZhIACgkQN1Ujt2V2gBySowCgkvc3eYqkdK34kM8VUgjVNRg9
sCcAoIJI5a0k5eKcR/7WkjMF+Obl9EwD
=DuuL
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
