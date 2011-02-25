Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pszuj-0004Rd-3j
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:49:05 +0100
Received: by fxm8 with SMTP id 8so1700618fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 07:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZznZesUvC3ZlQRPZh0v+WqqOV54dQOLM1QmK5V4gvEA=;
	b=LzdhZ9b9FGE8kdPP8Zswl8oXqRbpwXoNRrX34lIQ7ZdSlc81HvM8f846ILl/mniYD+
	HQzlkMV39mK4X4aib2A6UBeaz2XIc9yPn10YXIhAehG5M3T8rY6xN39aP/ARaQEH7L/y
	NUs4rj2dMMj1jI6Au7Y3FXsJw/fjZk+IrolSE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=W7H2ZWiINmy2Alg20FOMB7lmnm49V/dxd6CE97yYhp95PBGSsDXONYSo59v1JX+Vgj
	kY/FjmryUSqmFPSUDC1S9DAj9HIaT54V+SfAHg7CMDEzWMqlrSj6KobZfACwjpeX1ICZ
	sbRlG0LE3IiBYGFGe/YIX+uyPWt+yFsua4XMw=
Received: by 10.223.71.197 with SMTP id i5mr2774109faj.127.1298648400082;
	Fri, 25 Feb 2011 07:40:00 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e6sm351852fav.32.2011.02.25.07.39.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Feb 2011 07:39:58 -0800 (PST)
Date: Fri, 25 Feb 2011 16:39:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110225153957.GB5886@jama.jama.net>
References: <1298645128-32394-1-git-send-email-otavio@ossystems.com.br>
	<AANLkTinzw2OKZ0RTGEOgNf_i=X7qZhTj0R2epjc+FqTU@mail.gmail.com>
	<AANLkTinBVU7rYfS8GPK0v=-d1aWQM1nOXcd1rdrf7paa@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinBVU7rYfS8GPK0v=-d1aWQM1nOXcd1rdrf7paa@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] linux: update 2.6.37 to 2.6.37.2
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
X-List-Received-Date: Fri, 25 Feb 2011 15:49:05 -0000
X-Groupsio-MsgNum: 29706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline

--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 03:15:01PM +0000, Otavio Salvador wrote:
> On Fri, Feb 25, 2011 at 15:02, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Commit message should say update from 2.6.37.1, not 2.6.37
> > otherwise ok.
>=20
> I disagree. The recipe is 2.6.37, not 2.6.37.1.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1nzUwACgkQN1Ujt2V2gBxlgQCfSoqbIaCcLf2Qrlz3rS2TLOpU
BgoAn0RlA1fJPx9hs5qHgCFasyD3tjQQ
=zi7k
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
