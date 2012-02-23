Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b6W-0004U3-DV
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:01:12 +0100
Received: by eekd41 with SMTP id d41so621786eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:52:51 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.28.75 as permitted sender) client-ip=10.213.28.75; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.28.75 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.28.75])
	by 10.213.28.75 with SMTP id l11mr606717ebc.47.1330012371206 (num_hops
	= 1); Thu, 23 Feb 2012 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Px+W/qEebmdCopkoSeuUE0a1v3Qd0KrQDH+WvLhSlFE=;
	b=BcGhHGpjMbYz3LSQr7Imru7W3i2S4l+nfHUvJQjq1DTf3xzcCgYwy69CwUuR8KZj68
	VjnVqY/hi1m9zPkfYh5FRbQeQn6aqUQ3JO3LGNkQGwRiTpH5Qb4CV83Z3X3fnJd5aGwB
	JXYqhnHEpJWxIGZRfnWJS0ltUoIOjNZMlaE6w=
Received: by 10.213.28.75 with SMTP id l11mr477907ebc.47.1330012371014;
	Thu, 23 Feb 2012 07:52:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q49sm6454819eeh.1.2012.02.23.07.52.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:52:50 -0800 (PST)
Date: Thu, 23 Feb 2012 16:52:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120223155248.GX3769@jama.jama.net>
References: <CAP9ODKoFvg4s4Omew3pdtw3GVZyvpAF+cZCKKP6StJkjWhua9A@mail.gmail.com>
	<1330000807-30379-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP9ODKpLMpBNSqx0MUuzUbYCcapGrJccojjyQrYHjaN6TNqcSA@mail.gmail.com>
	<20120223125833.GS3769@jama.jama.net>
	<CAP9ODKqGbUADkfqjBDTaD2ASKhZbxAnEMmJ22MsK1w+UKKX8yA@mail.gmail.com>
	<20120223145305.GW3769@jama.jama.net>
	<CAP9ODKq0aY94-hZVpYkPVY47tgQ5FBvWStroQsyLpbmXsaB0=w@mail.gmail.com>
	<ji5mse$lbq$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ji5mse$lbq$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] gateone, networkmanager, cloud9, ntp: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 16:01:12 -0000
X-Groupsio-MsgNum: 37406
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="je0mZywpqEo4t1RU"
Content-Disposition: inline

--je0mZywpqEo4t1RU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 04:44:27PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 23-02-12 15:58, Otavio Salvador schreef:
> > On Thu, Feb 23, 2012 at 12:53, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >> splitted and with PR bumps in contrib/jansa/pull
> >=20
> > I think Koen would prefer if you resend them so he can get them from=20
> > patchwork. Not sure though...
>=20
> I'm fine with jansa/pull as well. As a rule of thumb: resending allows mo=
re
> people to review them again.

OK, will resend

will remove not changed patches from pull-* so they are not resent by
send-pull-request (probably easiest way to send new patches in same
branch without spamming ML with patches which weren't changed at all)

Cheers,

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk9GXtkACgkQMkyGM64RGpHLXACgqZNixEjxlA2vC4/8dy264qoz
> 36sAoLi9mt5kyUTIPjIPDHP5Do7ZHbCE
> =3DmlVt
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--je0mZywpqEo4t1RU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GYNAACgkQN1Ujt2V2gBxpcQCeNhyEGbqwctPsBMRttaY5MJd7
TNwAn0ruX3xReAKU55+5jJjZEEDOY020
=UQ2Q
-----END PGP SIGNATURE-----

--je0mZywpqEo4t1RU--
