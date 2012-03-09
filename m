Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S5xQo-0000Oq-PH
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Mar 2012 11:52:19 +0100
Received: by wgbdr12 with SMTP id dr12so1250607wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2012 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TQ47wgan81mrd8Aafg3vYxAaxaesnpzjgbZK6rdP6ik=;
	b=Wy5G4criVQTcC2uTaH7cc2pruUHKduoFVjEP34qnaxN8/KnxVl2+DvAaTVOssg+xVX
	DiDrFbOZR4z3U7B7QfvxOi7yP882+wbW7hsG9se1K5gtyjWT6qfmGozvWnbrWwXWRKn0
	noU777+bf7f4AohKEelyv2tm2z6vqY1tR72aSzmW6QIubjAxHjMHBvHYXGMKOfJwOJWw
	G82Js30f49DxQDkyS5xCogM35OIpDLUMdnJGVfbsE6oeiMZaXCVTNAx7zmpiZsTA1/Hz
	8IUoCxJGyc0XzUuuhuEapZ+77xQWm4rUIKOkuTnf1w6SxudpUVNMWj4GgVgfuYuIz4+0
	fBdA==
Received: by 10.180.95.105 with SMTP id dj9mr3476905wib.18.1331289819690;
	Fri, 09 Mar 2012 02:43:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc3sm8047666wib.7.2012.03.09.02.43.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Mar 2012 02:43:38 -0800 (PST)
Date: Fri, 9 Mar 2012 11:43:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120309104336.GF3813@jama.jama.net>
References: <CALbNGRQhPdwnDf7Jw0GG9Rx6rzECGAOzbrcwrKDUeU0jjp=4WQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQhPdwnDf7Jw0GG9Rx6rzECGAOzbrcwrKDUeU0jjp=4WQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Patchwork hooks seem to miss some commits
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
X-List-Received-Date: Fri, 09 Mar 2012 10:52:19 -0000
X-Groupsio-MsgNum: 37699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6v9BRtpmy+umdQlo"
Content-Disposition: inline

--6v9BRtpmy+umdQlo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 09, 2012 at 11:36:18AM +0100, Andreas M=FCller wrote:
> Hi,
>=20
> Just FYI: Patches seem to remain at state 'New' in patchwork although
> committed. Some examples [1]-[3]
>=20
> Andreas

It marks only first found match [1]-[2] had v2
http://patches.openembedded.org/project/oe/list/?state=3D*&q=3Dudev-173%3A+=
don%27t+hardcode+path+to+pidof&archive=3Dboth
http://patches.openembedded.org/project/oe/list/?state=3D*&q=3Dsystemd%3A+e=
nable+xz+compression&archive=3Dboth

sometimes it marks v1 sometimes more correctly v2...

not sure what caused [3].

>=20
> [1] http://patches.openembedded.org/patch/22897/
> [2] http://patches.openembedded.org/patch/22743/
> [3] http://patches.openembedded.org/patch/22893/
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6v9BRtpmy+umdQlo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9Z3tgACgkQN1Ujt2V2gByPSwCgtAGOtrR5X5m7CFJ2o1s70hhF
n20AnRhQ0Rk6x6eNAY+VhfHsqJoFUTj6
=SVbF
-----END PGP SIGNATURE-----

--6v9BRtpmy+umdQlo--
