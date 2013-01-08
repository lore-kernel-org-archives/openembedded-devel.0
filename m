Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tshkf-0004IW-OZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jan 2013 23:34:34 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so400160dam.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 14:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N/I9gN4yvpC8no2BR9qoj+b6QMExWkcwu0RoAXEycAI=;
	b=EmzZmAHJPGwLQs18Smxd8VDJjOjsdhiTAeA2eO+u0X+A2MUyQLOQbssRgNvruQSJJy
	QIXQIZuvootpvZoEpBXfVDPklo4Xk+juOPbSGEfd9evgDBMwfriENBLpgi7e8R3hZDHM
	FbDKLC6jtScQNTprEwA7goMkfzFahbj1eVQJGBFsOCj1iELltIv1rfcngN5VUPJ8RG7R
	ZOZh6CDxPhT8jE/OeI/RoGmyGeBKJFR3gRibbUFOR/eCa4hOD0a12ZOq7+hPBmElG7L1
	MYZcbRJBbXki5bmUFcrl0chh5dJbkgLp+wnT7ScMtr8h6Kn0czTYti2XhZb1moEdNEdo
	BJUg==
X-Received: by 10.68.243.69 with SMTP id ww5mr202787992pbc.45.1357683561803;
	Tue, 08 Jan 2013 14:19:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jv1sm35019688pbc.36.2013.01.08.14.19.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 14:19:20 -0800 (PST)
Date: Tue, 8 Jan 2013 23:19:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130108221924.GB3722@jama.palm1.palmone.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
	<1357463568-26241-3-git-send-email-raj.khem@gmail.com>
	<20130107155808.GE6154@windriver.com>
	<CAMKF1sosuv-y3vkcXC=pfhjEcixH1cfoHHuLGJ6vR_MwNXOmmQ@mail.gmail.com>
	<CAMKF1sp_Qi_G4kkYCJSVLnPC-jAx9Exi73k=uqU-kjdvmnD87g@mail.gmail.com>
	<20130108190301.GH10677@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20130108190301.GH10677@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7
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
X-List-Received-Date: Tue, 08 Jan 2013 22:34:35 -0000
X-Groupsio-MsgNum: 42580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 08, 2013 at 02:03:01PM -0500, Joe MacDonald wrote:
> [Re: [oe] [meta-networking][PATCH V2 03/25] autofs: Add recipes for 5.0.7=
] On 13.01.08 (Tue 09:33) Khem Raj wrote:
>=20
> > On Mon, Jan 7, 2013 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > > Fair enough. I will remove it in V3 and push it to branch
> >=20
> > I have now pushed a V3 into the pull branch where the commented do_inst=
all
> > is removed.
>=20
> The meta-networking bits look good to me.

Will you merge them, or should I merge whole branch together?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDsm2wACgkQN1Ujt2V2gByRaQCZASfCXGpeaCzRoNS0FSxsPkCk
PUMAn3VzX2PQCpl+XRQVVXHfhKk5UMSt
=u5+0
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
