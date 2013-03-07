Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDdRl-0003I1-Be
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 17:13:37 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so552662pad.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=q3iuAJey2aJa1aqFNDfyhU6UIKM37WnAvRfNrk5o7ME=;
	b=SlEZwYcITa2Baywfh+Y82JjE21E/An5/KDoKN4yh0+ogd/kXaq6RPMKsaaY4vvTC5T
	vep8zbxPkR8Fo18HYrJY7U26Q+yxfuTvc53+CV5ZGIPuqA3zGuHteJ/qMp+DG6RFUwof
	QPxezkNrcvejQuaCgDIsKwaf1akn6ovnyiyDvJP6QtuEppPnqAOUPTcy21dnGTZPOWhQ
	sJhL093lged4SAH4VBZ7qMbRxAGdZHSSfDUhaaZ5lBVxVU7MThGsiZm2YjnG48wOS7In
	2OSegvBoR3mFVZSkJUZgaDuHgnIs/yBAq5WnmziDwVewzW0LaFbx6JcgQ6hwxTaX5GnK
	R0yA==
X-Received: by 10.68.211.37 with SMTP id mz5mr55480233pbc.83.1362671820463;
	Thu, 07 Mar 2013 07:57:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iv3sm2091591pbc.40.2013.03.07.07.56.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:56:59 -0800 (PST)
Date: Thu, 7 Mar 2013 16:56:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130307155654.GQ32228@jama.dyndns-home.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<20130307150552.GN32228@jama.dyndns-home.com>
	<CAGiJk9cS8WG5pyJ7Op1XTqxTXk_xRhcAUGXq4hie01FL3vi5SA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9cS8WG5pyJ7Op1XTqxTXk_xRhcAUGXq4hie01FL3vi5SA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Thu, 07 Mar 2013 16:13:38 -0000
X-Groupsio-MsgNum: 43444
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YzdYn+D7cUqe+VA3"
Content-Disposition: inline

--YzdYn+D7cUqe+VA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 04:20:42PM +0100, Samuel Stirtzel wrote:
> 2013/3/7 Martin Jansa <martin.jansa@gmail.com>:
> > On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
> >> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
> >> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> > ---
> >> >  README | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/README b/README
> >> > index 0635e10..cab1e21 100644
> >> > --- a/README
> >> > +++ b/README
> >> > @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
> >> >  Contributors:
> >> >  Copyright 2012 - Kai Kang
> >> >  Copyright 2013 - Khem Raj
> >> > -Copyright 2012 - Koen Kooi
> >> > +Copyright 2012, 2013 - Koen Kooi
> >> >  Copyright 2012 - Robert Yang
> >> >  Copyright 2011, 2012 - Samuel Stirtzel
> >> >
> >> > --
> >> > 1.8.1.4
> >> >
> >>
> >> Thanks for your patches,
> >> I applied them all.
> >
> > Can you update status on:
> > http://patches.openembedded.org/bundle/jama/meta-kde/?archive=3Dboth
> >
> > To keep patchwork clean?
> >
>=20
> I would, but unfortunately I have no Patchwork account.
> Also there seems to be no possibility to register a new account.

Adding khem to CC: I guess he can arrange account for you.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--YzdYn+D7cUqe+VA3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4uMYACgkQN1Ujt2V2gBxeKgCggOCHJDzs9jawR4oVuKq6EcwG
Ab8AoJWKAEp617dNHMVwyALuK2iGF69Z
=IsDT
-----END PGP SIGNATURE-----

--YzdYn+D7cUqe+VA3--
