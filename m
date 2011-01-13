Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PdJRf-0006DY-2J
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 10:26:15 +0100
Received: by fxm17 with SMTP id 17so1418800fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 01:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Eqm00iqyi2dooqkELi4n2muFDn8HRyyEULuaaWzURJo=;
	b=n29bU0lPDG4m/dBirP8UjOqxlfTIvyoekzuju1mhFwLC6F7QPZgTBf9ZGqmxerJ0d2
	WfBI17ayR40cqk0DEpAJP7m1tfA30o43dFrvUDwVHoDjlMw65FOvJ/3JUsukOM+LM4JJ
	iN1mCeGhINOjmDf+MbrmNnt6I6bCrrw9qsL7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=bmS973NBgXifrCmfELfDveIJMODVcFRaq0Ekm3cafIBCJ0oVAkS44NrzA4+7MM4mGC
	mLyHNM2zwukOv/R3ESMUdmsxpdm6BUkvGzC6mIqBc1EgCp2CwiFSd5PwiDU4MP668qvN
	33x1X34nVk7YmfCowCjlvlVj4LIGyrRyLfEYo=
Received: by 10.102.234.4 with SMTP id g4mr311715muh.75.1294910742418;
	Thu, 13 Jan 2011 01:25:42 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a6sm1542683fak.1.2011.01.13.01.25.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Jan 2011 01:25:40 -0800 (PST)
Date: Thu, 13 Jan 2011 10:25:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110113092555.GP3244@jama>
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
	<20101214205943.GF6662@jama> <4D07DF4B.7000800@balister.org>
	<20101214215011.GG6662@jama> <4D095CA5.5020400@balister.org>
	<AANLkTikKhNKT4kB4BC5Tog8bJvtzTyto9s7hRoPNW_TE@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikKhNKT4kB4BC5Tog8bJvtzTyto9s7hRoPNW_TE@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Thu, 13 Jan 2011 09:26:15 -0000
X-Groupsio-MsgNum: 27988
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FbmEh7Ek6NM6xKh/"
Content-Disposition: inline

--FbmEh7Ek6NM6xKh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2010 at 09:58:37AM +0100, Frans Meulenbroeks wrote:
> 2010/12/16 Philip Balister <philip@balister.org>:
> > On 12/14/2010 04:50 PM, Martin Jansa wrote:
> >>
> >> Then please remove all older coreutils versions which doesn't provide
> >> complete set of bindir_progs, base_bindir_progs, sbindir_progs, because
> >> ie coreutils-6.0 now breaks ie timeout:
> >
> > So it looks like we can remove the coreutils-7.2 directory since there =
is no
> > recipe for it. Does anyone object to removing coreutils-6.0?
> >
> > Philip
>=20
> You have my ack to remove both.
> Frans

ping?
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FbmEh7Ek6NM6xKh/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEARECAAYFAk0uxSMACgkQN1Ujt2V2gBxzRgCfWaTqkX0sy3MVx3Rhu2GffZ0M
d3gAn0XfR9Lkzjl8l04o4VpYSXKLjIs4
=01vP
-----END PGP SIGNATURE-----

--FbmEh7Ek6NM6xKh/--
