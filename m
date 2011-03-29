Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q4eOt-0006lS-A0
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 21:16:23 +0200
Received: by bwz5 with SMTP id 5so463012bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WMHTsONU5WyH1v+R6SZGlkM4i6MKqFocBtAAX4cRA74=;
	b=PzapmarIRS6/ii4Jd8Gaf+ZXNNdTEX6aHoataybf4Js9MRQ14RQMigqHN72qvA2NH8
	53AtgLmbNQn42qWTJc37ZQAh2XRr/3o0b95ZVWABiJ9TZnBUlSsSFYh4SpdbdOqxNmt/
	KNtdXC4mcM0yX5UgRLYQF0VhLw0UWzDhjqiMA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GvuVnPWqEaOLXqFK/Rk2tRzd+1nWdfIIuJKnZ8W2eq6rejr3cnxpCZQpQme3hi5D4p
	VEsT7nJzU2ZrCkwT7CSXZIboJPcmNR1p5j+cbqnQsJVbWFRbE9SqOyKdoTNBxrKfBDal
	QVRXP7aBhLFmYfA2Fgl/mYUPpbQm51MQ8kO3E=
Received: by 10.204.19.3 with SMTP id y3mr149703bka.180.1301426065171;
	Tue, 29 Mar 2011 12:14:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id w3sm3636598bkt.17.2011.03.29.12.14.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2011 12:14:23 -0700 (PDT)
Date: Tue, 29 Mar 2011 21:14:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Message-ID: <20110329191416.GB3439@jama.jama.net>
References: <1301348740-30018-1-git-send-email-philippedeswert@gmail.com>
	<1301354673.6649.10.camel@mattotaupa>
	<AANLkTi=6hSKs9aJqHEWsYturvxYGaFTxk-jkb5bO6+Rc@mail.gmail.com>
	<1301411420.25311.4.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1301411420.25311.4.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eeze: update to 1.0.1
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
X-List-Received-Date: Tue, 29 Mar 2011 19:16:23 -0000
X-Groupsio-MsgNum: 30706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2011 at 05:10:20PM +0200, Paul Menzel wrote:
> Dear Martin,
> what do you prefer? Keep or remove Eeze 1.0.0?

feel free to remove 1.0.0

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2SL4gACgkQN1Ujt2V2gByoNACgmK4C3E8jGcAmI7ZohZBQzG8D
su4AniyEGYk/WAHuWl98ilkl22sQ0+Yi
=yEbS
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
