Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShmpH-0006gv-Q8
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 21:13:55 +0200
Received: by wgbdr1 with SMTP id dr1so881437wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6wP+gC7k26pf+dWS9fWKyO7lZb+12Dqk1L6tKgRuQUw=;
	b=D781vQq23YOph8aNDpPQWOUYPdGAxMz0V0uSpWkHgL8bYfdrEDnpxZZ67XTZXc+JUB
	QinHm5gqCt9ZHr9aX77L2gfFY0H7YcBDvVvm2YEIGuK97h6iruADlnnNTTW5qlxFmwDv
	vKts10SFPgHz5t6Bhk68LFvTkVUf7FKyWyOZU0sp03ZGCQidAQC9enanicFF5M3YsLbl
	o3AFPf6D9/ooiVZ0C+q7aRu63WCQmn9enupPSi1yOSqGwPlM/9zItqx7IQGxyzgHukuQ
	0/rYYLOK6axGRJ36u8mccVQLfyH9N6MTdGXrYWe3UsOFkTT99q+DN8/RI3dPjWWRUAzO
	M7FA==
Received: by 10.216.51.206 with SMTP id b56mr16477770wec.9.1340305389622;
	Thu, 21 Jun 2012 12:03:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gs7sm2545097wib.7.2012.06.21.12.02.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 12:02:54 -0700 (PDT)
Date: Thu, 21 Jun 2012 21:02:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120621190253.GH9352@jama.jama.net>
References: <1339364820-2880-23-git-send-email-schnitzeltony@googlemail.com>
	<1340264126-29651-1-git-send-email-Martin.Jansa@gmail.com>
	<jrvngo$vv$2@dough.gmane.org> <20120621181047.GF9352@jama.jama.net>
	<CALbNGRTMYfuL7YFCp=RG3cCzkVEuE6cbv00yFqioN4AH0UsMfQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTMYfuL7YFCp=RG3cCzkVEuE6cbv00yFqioN4AH0UsMfQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC, meta-oe 22/27 v2] xserver-nodm-init: move systemd support to meta-systemd
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
X-List-Received-Date: Thu, 21 Jun 2012 19:13:56 -0000
X-Groupsio-MsgNum: 39331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3LYUU6HlUDSAOzy"
Content-Disposition: inline

--h3LYUU6HlUDSAOzy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 08:30:53PM +0200, Andreas M=FCller wrote:
> On Thu, Jun 21, 2012 at 8:10 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > Andreas said off list
> unintended - sorry

no problem

> > that he plans to send v2 of whole patchset (there will be small change =
=66rom gpsd too).
> Did I miss something here?

this one needs a bit of attention while rebasing
http://git.openembedded.org/meta-openembedded/commit/?id=3D6ba88f7ad957bf2f=
6fb4527f77697429f7d98a52

> > Andreas: do you want me to send v3
> > or will you fix SOBs yourself?
> No need for V3.

OK
=20
> By the way: before I rebase this series: Are there patches around for
> latest oe-core updates ( at least connman was updated ).

Localy I've just renamed connman .bbappend to match and waiting for
rebuild from scratch to see if there is more issues from that.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h3LYUU6HlUDSAOzy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/jb90ACgkQN1Ujt2V2gByH3gCfQJR6+Vci4QHaJLLOMdpFjmSu
tR8AoKxmASqEIIHuQSUEBf8TGaO2BVGB
=q9QQ
-----END PGP SIGNATURE-----

--h3LYUU6HlUDSAOzy--
