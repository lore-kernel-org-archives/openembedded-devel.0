Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QzkQ2-0005kI-8l
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Sep 2011 09:13:34 +0200
Received: by fxg11 with SMTP id 11so2413932fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 00:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AIy3qMZ36jvlXbBMkW02kpzM0QBdylexJfpyLIImDOk=;
	b=BpNXoePeNlUWJzcDMacTCV8fmxwh8U/EpmF1dGZTJeYkcSFQzFP3INqW3NOudUibw9
	DYMcjgcQFBA/qW3hgqdtmKhgPf86RA4Yso7gKJIbshfoTSZYrvDB/HhtmZx8odjsqrh4
	XvzbQ4tkoEklT+nJayiOjRGLrhNX3MZq8oAY8=
Received: by 10.223.91.75 with SMTP id l11mr3175990fam.66.1315033716565;
	Sat, 03 Sep 2011 00:08:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l21sm753920fac.8.2011.09.03.00.08.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 00:08:35 -0700 (PDT)
Date: Sat, 3 Sep 2011 09:08:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110903070828.GL3634@jama.jama.net>
References: <1314962732.3526.32.camel@mattotaupa>
	<1314976910.3526.36.camel@mattotaupa>
	<1314989318.17121.11.camel@lenovo.internal.reciva.com>
	<201109022129.26555.schnitzeltony@gmx.de>
	<j3ri5g$dal$1@dough.gmane.org>
	<1315000152.6109.14.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1315000152.6109.14.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Please merge lists openembedded-devel and openembedded-core again.
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
X-List-Received-Date: Sat, 03 Sep 2011 07:13:34 -0000
X-Groupsio-MsgNum: 34033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline

--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2011 at 11:49:10PM +0200, Paul Menzel wrote:
> Am Freitag, den 02.09.2011, 23:34 +0200 schrieb Koen Kooi:
> > Op 02-09-11 21:29, Andreas M=FCller schreef:
> > > On Friday, September 02, 2011 08:48:38 PM Phil Blundell wrote:
> > >> On Fri, 2011-09-02 at 17:21 +0200, Paul Menzel wrote:
> > >>> Am Freitag, den 02.09.2011, 14:19 +0100 schrieb Richard Purdie:
> > >>>> I do find the split useful...
> > >>>=20
> > >>> Hmm, could you please elaborate?
> > >>=20
> > >> Not that I'm Richard, but I do find the split useful as well.=20
> > >> Personally I am much less interested in the traffic on the oe-devel
> > >> list and I often ignore that one; I've been somewhat tempted to just=
=20
> > >> unsubscribe altogether since there doesn't appear to be all that much
> > >> of value (to me) going on there.
> >=20
> > > I would even prefer having additional meta-oe list separated from
> > > oe-dev.
> >=20
> > If there's enough need for it, that can get arranged.
>=20
> Why should that be needed? Maybe proposals could be explained and backed
> up with arguments for a discussion.

I don't care if it's all in one list or N > 2 separate lists because
I'll be subscribed to all and filter will merge all those e-mails to one
folder anyways..

But I see your point that it's harder to decide to which list(s) someone
should send his question..

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5h0mwACgkQN1Ujt2V2gBzQJgCeNDTwgLFmB1GZVZeM6R2T3qLG
S7UAnjD6tfrAN8QNNJGduOzqDghFXRk5
=slt/
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
