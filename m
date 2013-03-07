Received: from mail-pa0-f41.google.com ([209.85.220.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDceN-0000F6-HD
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:22:33 +0100
Received: by mail-pa0-f41.google.com with SMTP id fb11so531557pad.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0QeWLq5HOHxpsfn8ZqiomiDmNWoRsjVm4OvrHZkaWpI=;
	b=f/kWyf5/R/cg6iwRPL60tuiJI6ngnf2o9/WIiCsedxdiflujKrjCiCGiIcsI4Zholt
	7VwDlKSclBotfWBgcTirjIcZtN4mWOO0VEbbSctDaR1GiAqk0RzsN9O+bfGuQh/ZZPAG
	CDptfpOsB/HJqC78yAnHkRvfrPsrKxgWnJSk54etPG02ynf5UU/36y+KiibL2SeteXHQ
	xA5j18Wuy824ta/3qAz6YOe01VY5FTe/vROIrLd5oV+6D8ZHNzFzm/cnlbVrl7rz3PnQ
	l2vxA5Yc21GvRt5OKYZ5Rfx2gR5Nt6OvVNOQ3YwkHTa50sM9HADrxAjj7ZAmVwDD/Zl6
	XShA==
X-Received: by 10.68.234.100 with SMTP id ud4mr53114479pbc.8.1362668758664;
	Thu, 07 Mar 2013 07:05:58 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id is1sm1977286pbc.15.2013.03.07.07.05.55
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:05:57 -0800 (PST)
Date: Thu, 7 Mar 2013 16:05:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130307150552.GN32228@jama.dyndns-home.com>
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
X-List-Received-Date: Thu, 07 Mar 2013 15:22:48 -0000
X-Groupsio-MsgNum: 43431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XLsjFikA86nwwlhe"
Content-Disposition: inline

--XLsjFikA86nwwlhe
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

Can you update status on:
http://patches.openembedded.org/bundle/jama/meta-kde/?archive=3Dboth

To keep patchwork clean?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XLsjFikA86nwwlhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4rNAACgkQN1Ujt2V2gBz25ACgs8z39NQSOTGvOtGgno9vWHTq
MC8AoJD0HgMnJEReCoc+OFaHBugwzjSA
=u8jl
-----END PGP SIGNATURE-----

--XLsjFikA86nwwlhe--
