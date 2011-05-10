Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJljj-0007kw-2T
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 14:08:24 +0200
Received: by fxm19 with SMTP id 19so4773717fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 05:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WBxtq+LIRB9Yb5gUAmpTYCL4EvspIDl4Nja/0oSfhq0=;
	b=Lmc9W8wV1ieE4jdA686Mw5l8rtAHc5SjilVg6am1MJSgD0QOi5ErseyufP5Gehw7SJ
	zXSEQ019hq+ronP1zoArWLZ3nTDL7cTUUBoPEozV/btIm9peDmtp5BcrrkbPd7HpAY1y
	ixqLBVSArXoGFP7rJFmcSlXM/gagH5chqI+WI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=acWTqRps5ktK/QXojIXva3ScdOtWRKrU+Dzau90ijJEOs1SBeh9WAamx5WAMqvp9x4
	zEX591dtpfF7BicOwVkJr4J3nM8/qxNZU+KWSJc+T1PhffOm1qDF0l/rPSrJIvK5827E
	lycPt9TxrVcfkpUY6onT4EjsbsopRdp+DFqnw=
Received: by 10.223.86.130 with SMTP id s2mr593459fal.115.1305029137829;
	Tue, 10 May 2011 05:05:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 14sm2357460fas.6.2011.05.10.05.05.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 05:05:37 -0700 (PDT)
Date: Tue, 10 May 2011 14:05:30 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110510120530.GD3673@jama.jama.net>
References: <cover.1305027503.git.Martin.Jansa@gmail.com>
	<3ce8046fc75c61d0eed6b58152acee0c665383e7.1305027503.git.Martin.Jansa@gmail.com>
	<iqb99k$uh2$3@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <iqb99k$uh2$3@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH 1/9] udev: drop udev-compat for zaurus devices
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
X-List-Received-Date: Tue, 10 May 2011 12:08:24 -0000
X-Groupsio-MsgNum: 31863
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="48TaNjbzBVislYPb"
Content-Disposition: inline

--48TaNjbzBVislYPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 01:58:44PM +0200, Koen Kooi wrote:
> We should consider using 168 in meta-oe, it's a lot faster than 168. 169
> breaks crosscompilation, I'm talking to Kay to get that fixed before the
> release.

Agreed, I had this in my queue, because I was trying to build my spitz
images from meta-shr before meta-handhelds was announced (and I stopped
trying for now).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--48TaNjbzBVislYPb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3JKgoACgkQN1Ujt2V2gBxI+gCgm8h8zw03wBVmQ+Kv0SutYoCh
t4IAn1udwcFroc9FUtO2I9XVSgxkkDDB
=KOIH
-----END PGP SIGNATURE-----

--48TaNjbzBVislYPb--
