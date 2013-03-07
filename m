Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDal1-0003qx-24
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 14:21:19 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so451956pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=2MdCaXtas3JWqlr6rne4H7uDgp7xtn/v/TViHWDRddU=;
	b=j4hPBAOkyinlT0pMlo09BgAoAReBqe7EXPJJ9KX9MxagzXTJcFKiMv5zUfWv6iJzNu
	BIld3txAqIoeABq5+jNb3LUVEBBOsb9h0hdMdI3nfGark7Sp5qV1M/opiEnewi740Y0b
	NAlCdG6sPY4K+oOU7uvqhFF8gcPXbSltTkF3zNKf4dtmk7TAo6pVg/fGl7iTUN8kmAlO
	4/6J9V7BMQ5REiMQgDUQL5UZhHaF5FoZzmeRsgAhgfgdy8qLDeuF7zHK0UBUmbGIUmBi
	nmTp/s2GtdGYetWjKVN3KfZZChD1JLrOnv3TTNN+W/3MbyRi+7NEYR/80pU5cVDHjT+n
	Zw8A==
X-Received: by 10.68.231.70 with SMTP id te6mr52728656pbc.159.1362661482212;
	Thu, 07 Mar 2013 05:04:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id pg6sm1677434pbb.0.2013.03.07.05.04.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 05:04:41 -0800 (PST)
Date: Thu, 7 Mar 2013 14:04:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130307130435.GI32228@jama.dyndns-home.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 13:21:22 -0000
X-Groupsio-MsgNum: 43417
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline

--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> >  README | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/README b/README
> > index 0635e10..cab1e21 100644
> > --- a/README
> > +++ b/README
> > @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
> >  Contributors:
> >  Copyright 2012 - Kai Kang
> >  Copyright 2013 - Khem Raj
> > -Copyright 2012 - Koen Kooi
> > +Copyright 2012, 2013 - Koen Kooi
> >  Copyright 2012 - Robert Yang
> >  Copyright 2011, 2012 - Samuel Stirtzel
> >
> > --
> > 1.8.1.4
> >
>=20
> Thanks for your patches,
> I applied them all.
>=20
>=20
> Unrelated to your patches:
> There are some upcoming changes, but they don't fit into yocto 1.4
> (assumed that yocto is the orientation point for third-party OE-layer
> releases).
> So there will be a yocto-1.4 branch in advance and the development
> will continue on master.

It would be nice to know yocto-1.4 release name in advance and name it
the same as branch in oe-core/meta-oe will be (denzil, danny, ...), but
I guess it can be renamed later.

> Hopefully meta-angstrom + meta-oe + oe-core + <bsp-layer> is a
> supported use case in yocto ...
>=20
> --=20
> Regards
> Samuel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4kGMACgkQN1Ujt2V2gBy4LgCcDD2o0UQxIQ/KycZvUj3l/6uQ
eXcAn1livVVGjDVa8Xa0L8xZH/TBM7w8
=ngz1
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--
