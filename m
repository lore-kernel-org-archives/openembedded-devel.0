Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R20gW-00031J-00
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Sep 2011 14:59:56 +0200
Received: by fxi1 with SMTP id 1so93772fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Sep 2011 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GksJEI94PW7FV4Id7JATXhcRHIeNalIJcPni2S/PPv4=;
	b=aXR+wUsOvPLFKMjSsEz8kx6rrLNtDCIwLL0EDtP/8SnKpTSZrKt8lrXUYhR2576vCD
	fkIyzFJ4s0TFSmP23Kb/BARS6UbhpBDQ69xvOpcw3AXJfgQsCFX+LLVJwqialE6wKmwm
	CZ0/gszuY0ydxOpdU0IQBAXvvJ01OSkr9/ySU=
Received: by 10.223.48.211 with SMTP id s19mr441913faf.33.1315572891567;
	Fri, 09 Sep 2011 05:54:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c12sm2828078fad.14.2011.09.09.05.54.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Sep 2011 05:54:47 -0700 (PDT)
Date: Fri, 9 Sep 2011 14:54:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110909125440.GI4124@jama.jama.net>
References: <1315434958-5042-1-git-send-email-errordeveloper@gmail.com>
	<1315539201-6902-1-git-send-email-errordeveloper@gmail.com>
	<20110909065128.GA4124@jama.jama.net>
	<CAPhDKbGcJ4sGEWPimfHqxkbZGNBf47uO7=D9RcgSjP9dCB69MQ@mail.gmail.com>
	<20110909110614.GE4124@jama.jama.net>
	<CAPhDKbHT0-HCfGeexqY05W-kd8xx8rMuRcwQRN-uZcM+K2JSUA@mail.gmail.com>
	<20110909111519.GG4124@jama.jama.net>
	<CAPhDKbGgG_aYGT-oeUz1dqS3CC4h=Zo+L=KF-7+00n571r1PEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhDKbGgG_aYGT-oeUz1dqS3CC4h=Zo+L=KF-7+00n571r1PEw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 2/2] binutils-2.20.1: fix checksums
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
X-List-Received-Date: Fri, 09 Sep 2011 12:59:56 -0000
X-Groupsio-MsgNum: 34167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cf0hFtnykp6aONGL"
Content-Disposition: inline

--cf0hFtnykp6aONGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 09, 2011 at 01:28:57PM +0100, Ilya Dmitrichenko wrote:
> On 9 September 2011 12:15, Martin Jansa <martin.jansa@gmail.com> wrote:
> > I see, I cannot reset it too for you.. so I will change status of those=
 4,
> > but please send updated patch as suggested.
>=20
> No need to, see  f4faecdbd0b7c83e5787735ef1495a34aca861e4.

NO, need is still there, read the rest of
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/0349=
40.html

especialy the part
"that was for 2.21 not 2.20.1.."

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cf0hFtnykp6aONGL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5qDJAACgkQN1Ujt2V2gBz8/QCeLflx+CLbHx1+lO1QuxgUMrxJ
vigAoJlDeBKh6Fi706MEdef18+yJli24
=ZaeN
-----END PGP SIGNATURE-----

--cf0hFtnykp6aONGL--
