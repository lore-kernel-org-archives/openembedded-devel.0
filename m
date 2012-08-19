Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3BTH-00084r-0J
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Aug 2012 21:47:39 +0200
Received: by wibhq4 with SMTP id hq4so2802146wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2012 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w1T2zoZFXv63jAPpVljkUx9xWOtiPcWhFl63zGh3aMc=;
	b=KsXuUKghoIsqvyY7Zymi2ropU+LB1qhiO36J5OKExN1RrotYigPyI5/3J7PAUE+Y8n
	VDssWMAlyOd060t3c3Eo2H3EqpP+QNAbm/6qETtHbI/MFWqZrcdj6rfHiK8OMYuqc3/5
	JeGl1sJPGFtwjaSNS6OAnCM7gTL+3LINxOdZ0MD/qr5wWaL7S7/mbYazCja2qnraJltC
	zESMceqPgLMy5DyD/SySS0Cw555uzku7fzo33ejXyEohVI3w4hAQfGxEym511IQhg5wT
	B6hDHQs4/AxQuo5koe+Ab1GBwf1A5xnM2nDqPPXcOWOkZgOyZ6eTpxgJH0aM4gCmw0Zd
	7BSg==
Received: by 10.180.105.163 with SMTP id gn3mr22705739wib.2.1345404937558;
	Sun, 19 Aug 2012 12:35:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm35387039wib.2.2012.08.19.12.35.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 19 Aug 2012 12:35:36 -0700 (PDT)
Date: Sun, 19 Aug 2012 21:35:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120819193538.GA3063@jama.jama.net>
References: <1345056951-14036-1-git-send-email-ross.burton@intel.com>
	<1345056951-14036-3-git-send-email-ross.burton@intel.com>
	<20120817115300.GF3625@jama.jama.net>
	<CAJTo0LZdQ_fNkxZ0CthJHKS4ciVr7wRGw1UCYUedKoAuTR4bKg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZdQ_fNkxZ0CthJHKS4ciVr7wRGw1UCYUedKoAuTR4bKg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] meta-gnome: add evolution-data-server
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
X-List-Received-Date: Sun, 19 Aug 2012 19:47:39 -0000
X-Groupsio-MsgNum: 40251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 19, 2012 at 08:26:49PM +0100, Burton, Ross wrote:
> On 17 August 2012 12:53, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Wed, Aug 15, 2012 at 07:55:51PM +0100, Ross Burton wrote:
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >
> > Can you add dates too?
> >
> > Some users are still using that here.
>=20
> Really?  Can you ask them to fix the bugs then?  Your users must be
> very forgiving!

I can, but usually they ask me to fix them in the end .. :)

> (yes, I can)

Please do, so this bug doesn't became valid again :)
http://www.shr-project.org/trac/ticket/2052

It can be without those poky overrides and at least it can be used to
demonstrate how bad upstream version is (I never used it), but it
probably doesn't have any good alternatives at least in OE metadata.

Thanks,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAxQAoACgkQN1Ujt2V2gBxo5ACfZkT4ld9h9dLEG0Dv3eGTMUOK
ltEAoLGjmnvsdeiMUSOxPKXSjC5xTHNr
=RDG6
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
