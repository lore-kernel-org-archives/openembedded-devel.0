Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id EBCCD71C69
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 20:03:39 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id ip10so5424207wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 12:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cuaDZzbWtaUy4WRce9/9eG2LZfDCYmgF4DC03uNr4s0=;
	b=VY3j3BdBoKIMusObIrJ0nrJTByyXwhx+niXp6D3vz2nHCXDSyq12TyjeXin1iQmwQn
	hk0lC8iE8moJLiB9J1cBkARQwhnCW2g/rbgoyQk0Uf0Orx/IkpkJoEXSolZQ08N1UYLC
	tRrk1mO82ofSBAvr/Bk3a3U1YkV8OnH7jDow/TOHktEGrGI6nmq96UPiqNdG+qBm5nGB
	FkOZV5DH7pSqUrZXr54h92ExpSLhCsWGpxlpu+CaX2r12/FW4imYG5AtzwNdqxmrS2cF
	g1vCZyxnxA+r0H0uGkcpJJvgNQvc3qupQzrpDSRvQf63x1XC0owK+ddogbG9moPrvxaR
	Anaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cuaDZzbWtaUy4WRce9/9eG2LZfDCYmgF4DC03uNr4s0=;
	b=SXkl87+oqdcmkYCTtvx3lMFHIU9wFwGtsJzCtleSK9Jx/pQjBsn8WhlwfDzmVZYBgj
	90vxnJheXPIiItnFd1l3k3mVZHd7FFRa0BLPWLMzNzt0u72QSZw2Cg8h1BO9bgOIP+ph
	2sTxDlFNYXrNRuBGP4nC3LzPogVC61DO0pioSE1R7ntT+RM+GG/N8Z53wosXfeCnEWnT
	ug3Ylbc+Fb3ZhkqN6MyYDINO1yDJeW6qz3GcWnJ2Aw+DmZDndIdhSw2qhDB913xCjbqM
	C4ENL0B4658jX6R41aCivbjXrGTzzyt+go5PpVGANi+4MSB+n7bIQQ3s1hOmD1AKD4Hf
	+9mw==
X-Gm-Message-State: AIkVDXL9aoQFBoomGsRECvNQ1aubGhvoERI0m/1imqRm1CslSLIT6FRRUy48dBuZS+gu/w==
X-Received: by 10.223.171.22 with SMTP id q22mr4753720wrc.70.1485461019275;
	Thu, 26 Jan 2017 12:03:39 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u47sm4222023wrb.15.2017.01.26.12.03.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jan 2017 12:03:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 Jan 2017 21:03:38 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170126200338.GC3016@jama>
References: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
MIME-Version: 1.0
In-Reply-To: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-qt5][PATCH v6] Upgrade to Qt 5.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 20:03:40 -0000
X-Groupsio-MsgNum: 64880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Ek0hoCL9XbhcSqy"
Content-Disposition: inline

--9Ek0hoCL9XbhcSqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 04:54:50PM +0200, Samuli Piippo wrote:
> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> the contents of an environment value when qmake is run instead of when
> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> for qmake to find them. configure's setBootstrapVariable function needs
> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>=20
> qt.conf generation for qtbase recipes is not needed, as configure will
> generate its own version based on configure arguments. Skip running
> qmake, since configure is now automatically invoked when it's run in
> qtbase's root folder.
>=20
> Update PACKAGECONFIGs for qtbase to match current configure options.
>=20
> The new Qt configuration system [1] can be used with a new variable
> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> arguments.
>=20
> Merge the two qtwayland recipes to one that supports all three targets
> (target, native, nativesdk) without need for additional patch.
>=20
> Recipes for new Qt modules: QtSCXML, QtNetworkAuth, QtGamepad.
> Removes qtdeclarative-render2d

Thanks this resolved the -no-alsa issue, now it failing a bit further
with:

|
/OE/build/oe-core/tmp-glibc/work/i586-oe-linux/qtwebkit/5.8.0+gitAUTOINC+74=
ac5b0f34-r0/git/Source/ThirdParty/ANGLE/src/compiler/preprocessor/Tokenizer=
=2El:2779:26:
error: 'yylex_destroy' was not declared in this scope

which might be caused by flex upgrade as I'm seeing similar issues in
other recipes and Khem reported the same here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1315=
55.html
and Patrick here:
http://lists.openembedded.org/pipermail/openembedded-core/2017-January/1313=
26.html

Hopefully there will be upgrade to flex-2.6.3 to test this completely.

> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>=20
> Change-Id: Ib37c4d7323e8b45aa2b171e8427b6ec15aaee213
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>

--9Ek0hoCL9XbhcSqy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIpWGQAKCRA3VSO3ZXaA
HCBHAJ46R/IAW5EHhy8r9xyR6A9oZFo0egCgpovHEyo+FwdKdnf32ErF4suovUA=
=E3kf
-----END PGP SIGNATURE-----

--9Ek0hoCL9XbhcSqy--
