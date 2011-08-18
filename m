Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qu30v-0003jp-MH
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 15:52:05 +0200
Received: by fxg11 with SMTP id 11so1445713fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 06:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ds+9DsWqVP1YnljWVmhYMNfbeA7MS+aTbd+DzLnOoeo=;
	b=q97g/xjRCA80PmpVv1Zf/Rb2yE6NFtNUxBYZ9LtkcWuO7EIbLLcXM+D7OM4gAa5sJA
	CFKhefWcUXAZX7mJhB+c0BZ8Tx4u+iyztSfZ7LbusWW4P+IlT5n0tSqjWEQwHvufmRLk
	AK/oAHaShGVV+qCBPM7VtY1p1eT/kB0XenkQk=
Received: by 10.223.100.71 with SMTP id x7mr1147353fan.18.1313675246356;
	Thu, 18 Aug 2011 06:47:26 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c7sm1745225fac.36.2011.08.18.06.47.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 06:47:25 -0700 (PDT)
Date: Thu, 18 Aug 2011 15:47:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110818134718.GD6465@jama.jama.net>
References: <1f806520f152cbda2bc4aa7cbfde0dbfea7dc9b7.1313655444.git.Martin.Jansa@gmail.com>
	<30fb538629c6a307b0e574028a11ae196e8a791f.1313655444.git.Martin.Jansa@gmail.com>
	<1313656223.4016.12.camel@mattotaupa>
	<20110818083723.GA6465@jama.jama.net>
	<1313657121.4016.21.camel@mattotaupa> <4E4CF908.5080107@eukrea.com>
	<4E4D1663.7060703@balister.org>
MIME-Version: 1.0
In-Reply-To: <4E4D1663.7060703@balister.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH 2/2] e-wm: remove SHR specific patch
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
X-List-Received-Date: Thu, 18 Aug 2011 13:52:05 -0000
X-Groupsio-MsgNum: 33698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2011 at 06:40:51AM -0700, Philip Balister wrote:
> On 08/18/2011 04:35 AM, Eric B=E9nard wrote:
> > Hi Paul,
> >
> > Le 18/08/2011 10:45, Paul Menzel a =E9crit :
> >> Thank you for the explanation. So to find out if some distribution or
> >> machine adapts something I might find interesting I need to look in all
> >> layer (repositories) to find it instead of looking in one recipe.
> >
> > yes, that's one of the "benefits" of using the new OE ...
>=20
> On the other hand, if a distro or machine adapts something in a way you=
=20
> do not like, it does not impact you.

well if they adapted it with machine/distro override then it didn't
impact you too unless you were using that distro or that machine..

now you'll have the same override if you're using that distro because
you'll have their meta-distro and the same with machine and its
meta-bsp.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5NF+YACgkQN1Ujt2V2gBw4TACfSIDKD1x+r+YcZ29erElSK9VE
gmUAn38yujnVtZYRrQrXjAS9KhI0gHWy
=bk+3
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
