Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1B53B6B3A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:52:46 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id l18so222694wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8swNCZbPy5n3qzH/aXgmgT/rg+kHe8ae5nB9lE7m8VY=;
	b=eQc5l0Cm29vAkOenKY2sFFz2B98qryzxaw24thsZ8aVO26shI7qGteqXVwOB7NH/U9
	PPwUye7fbgQBk74maNI+okksBHb0cuvTwgMzKDDOkC8Mi9NAwjKR8C6velqj2j5wKKsu
	4OFttOfnaXbWguqqmcSP8ECohS/xKvYwDZaWo0nbKk+ayvkjZnKQvinCULQu1z1JfUuW
	X6Bxr0eeX0lHR2TwMp52IuQ/01Hl+E+xNbQo1iUfqSUbPd/qCmHlfvraPa7UNw5QhVoT
	KoI3SJ5aQEaV1ZDVNUQXHCJTvDzhtsHGEf3DXKsGTpX2PuvU0VpqitSH+ShWabxo4sJX
	DahA==
X-Received: by 10.14.246.68 with SMTP id p44mr6757805eer.8.1401925966679;
	Wed, 04 Jun 2014 16:52:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z7sm9729520eeo.42.2014.06.04.16.52.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 16:52:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Jun 2014 01:53:00 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140604235300.GV2426@jama>
References: <1401878650-3362-1-git-send-email-chmorgan@gmail.com>
	<CAP9ODKoqUaswvNbhR02aX16EgKLmv6g6ws1Lkgpb00Gdmctg=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoqUaswvNbhR02aX16EgKLmv6g6ws1Lkgpb00Gdmctg=g@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] Remove dfu-util svn recipes, these point at deprecated svn repositories, dfu-util uses git now
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
X-List-Received-Date: Wed, 04 Jun 2014 23:52:47 -0000
X-Groupsio-MsgNum: 50194
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PjLo8P/CG6vpADRe"
Content-Disposition: inline

--PjLo8P/CG6vpADRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2014 at 08:38:35PM -0300, Otavio Salvador wrote:
> On Wed, Jun 4, 2014 at 7:44 AM, Chris Morgan <chmorgan@gmail.com> wrote:
> > Signed-off-by: Chris Morgan <chmorgan@gmail.com>
>=20
> Please rewrite the commitlog to adhere to
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

In this case I've updated both commit messages when cherry-picking them
to master-next, so no need to resend, but as Otavio says, please use
better commit messages next time.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PjLo8P/CG6vpADRe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOPsVwACgkQN1Ujt2V2gBzUSACePy/FWLNNKyDfVVh+06Tx4mP/
hGcAnjCRV5jffgRTzbMMeyOFrh5pqYih
=tNJt
-----END PGP SIGNATURE-----

--PjLo8P/CG6vpADRe--
