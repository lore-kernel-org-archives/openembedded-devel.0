Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4FAF0696A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 09:30:04 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hr14so2277037wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fvkL4R7ykiXRrAeHZy8L3ma7s+C2COcSJLzc7txxWAQ=;
	b=qVMqxyFXg+auI15UWgntdSZQ4yNjtUXjHAWdZ8qGCsyT+snTrljxCko2zrbnbi6YB2
	kFHpIjl92I7vgTrqkuHzUQwSjtFHIRDiT8l+xRCIgB7rVXbzrMQJjqH/mpQKIJP6CgHc
	J/AAWpXwfxg8kfFgGlcXkpIrNua/R8WH35+Sk1KDjxk8AeeHTNqYf72lP3QhwVLQKd6G
	J1+FQAsq3eKPVvSefZ+fTo9j+v1j7zNlLLYyoRj6w8JWin0hQyV92j3d8IOoqC0nFR1f
	hqoGogB0skP8zzuatvjhj13U4KOCeSGAETgfWfZE6vEvAm0R3ARtiaKwBK2GeK9HhnGI
	EpJw==
X-Received: by 10.180.108.175 with SMTP id hl15mr11226758wib.19.1369733404656; 
	Tue, 28 May 2013 02:30:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	fv11sm22942187wic.11.2013.05.28.02.30.03 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 02:30:03 -0700 (PDT)
Date: Tue, 28 May 2013 11:30:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130528093013.GF3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
	<20130528084655.GB3192@jama> <20130528105056.62ea3b76@e6520eb>
	<20130528092518.GE3192@jama> <20130528112724.32aa801d@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130528112724.32aa801d@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 8/8] qtbase: add option to enable tslib support
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
X-List-Received-Date: Tue, 28 May 2013 09:30:04 -0000
X-Groupsio-MsgNum: 44894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Wb5NtZlyOqqy58h0"
Content-Disposition: inline

--Wb5NtZlyOqqy58h0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 11:27:24AM +0200, Eric B=E9nard wrote:
> Le Tue, 28 May 2013 11:25:18 +0200,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > On Tue, May 28, 2013 at 10:50:56AM +0200, Eric B=E9nard wrote:
> > > true do you want a v2 ?
> >=20
> > No, I've already added it and merged it :)
> >=20
> perfect.
>=20
> > Normally I would take longer for testing it, but I know about other
> > people starting to work on 5.0.2 so I wanted them to start with your
> > fixes included.
> >=20
> FWIW all my tests were done with you patch
> e7a477a171bf0560939196eb7ebe8e0b05061072 applied so maybe it's
> interesting to also apply it.

But that will require to abandon 5.0.0 and 5.0.1, well I can at least
update that pull request to remove 5.0.0 and 5.0.1 together with this
SRCREV bump.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Wb5NtZlyOqqy58h0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkeSUACgkQN1Ujt2V2gBxfYgCeP+3+7JG+kyVMgBqduXvqvRAu
7EIAnjKqswvRzEeQuYPLSaXFNCKYEPPi
=GcIR
-----END PGP SIGNATURE-----

--Wb5NtZlyOqqy58h0--
