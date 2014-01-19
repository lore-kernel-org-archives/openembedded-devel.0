Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 44ACC6DED0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 09:06:00 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so2511743ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2014 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=571fU6GlBQ0fgOBA4BJEb8Cqx/a33fSn58Mx1KBFTrA=;
	b=Gu8YqfXP+4XPWhbgXaIVDDbjvncAIkOicJXkAV2nhjD7fnD/q06DHtBSRvJPXj4JSQ
	alceKgR1+Ww/QZFNCJyPr71Yu9B2jk0pWQAYRvQxMGnC/MVvTkqVjfwEn8isx/qZV82L
	3hIVcs4PrDTSnrV21aNsVr7+cuGmhR0x7PSYNAQl2Wdoxtm1UAFsuYVMJzRHwrpwNZJL
	AJmyLtNeHAr1tnXmPaopeTzHq8nPN5skt72CITyK1qiZYmvKxFiD+GJC7fyWnSPq4LK3
	pCyfa0wTRMtuazaxNE6m8434ws/i191rEvnt1yG/Aevpw91WTiJThlIaf5lb4AkkTYZL
	CrfA==
X-Received: by 10.15.41.140 with SMTP id s12mr11825068eev.50.1390122360804;
	Sun, 19 Jan 2014 01:06:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z49sm29122325eeo.10.2014.01.19.01.05.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Jan 2014 01:06:00 -0800 (PST)
Date: Sun, 19 Jan 2014 10:06:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140119090626.GA3742@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: meta-oe patch queue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jan 2014 09:06:00 -0000
X-Groupsio-MsgNum: 47817
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nuX4E7Vid9I2gnPU"
Content-Disposition: inline

--nuX4E7Vid9I2gnPU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Apologies for delay, there is blocking jenkins job running for 10days
already (which should take 40minutes tops).

It should finish very soon (well I'm thinking that since Monday).

For better visibility and consistency with oe-core, I've started pushing
my patch queue from patchwork "in-test" bundle (I'll rename it to
"master-next" when it's emptier) to

meta-openembedded/master-next
instead of
meta-openembedded-contrib/jansa/in-test

Please test patches in master-next and send reviews on ML, but be aware
that it's rebased often on top of master.

BTW: there is also meta-qt5/master-next now (with 5.2)

Cheers,

--nuX4E7Vid9I2gnPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLblZIACgkQN1Ujt2V2gBxJYQCgiEWIfInDUF7NVczfLzNqrM6g
lD8An04UaEkgQ7KXQugSiMDqhOqCxqa4
=j2FA
-----END PGP SIGNATURE-----

--nuX4E7Vid9I2gnPU--
