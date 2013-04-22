Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUOU7-0005TI-Tw
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 23:41:17 +0200
Received: by mail-pa0-f54.google.com with SMTP id fa11so19314pad.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2013 14:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dhYlc3IstIOpkjgv5o2UzNw2ZeLLyQ3AS4LWfYlk1JY=;
	b=BYbyaXGtkek2OG+BSE/xOX2EE/5Nll8EaDPf45Hkn6pRS+HWwpfcm8iP94egQRVx9S
	t55fmA05ifUjJfZEQalhR19LHNG/0nJQvIxdsxAhqG+YaRF3e05r4DUH+lWjyf24dmtr
	PnNujeYNYGII4yZIXldnPBGpcoFh12vE9Gh0tTt0FZaB5B0j9tPuPn2luaHaipWOAiK2
	jIl39GUCFijwhCcPWNtpjATQYtP0XIgoBQ8iSHu+lpXvPZ6ienjZgH3jIxfSNTmNQ2Q1
	IMtS71ZQPivfBpbXaFAb4BH5MB2nJknw/EPbr/+RxIDDrvoNNV9xpNNcpzgjvYxG2x6G
	O1aw==
X-Received: by 10.68.129.232 with SMTP id nz8mr34638207pbb.25.1366665815605;
	Mon, 22 Apr 2013 14:23:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPS id
	li15sm28675578pab.2.2013.04.22.14.23.32
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 14:23:34 -0700 (PDT)
Date: Mon, 22 Apr 2013 23:23:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130422212342.GB3217@jama>
References: <CAP9ODKrT9eS6pYhUnW1JgqJL3b9cevdYAiH-WLTLBhSuQuEy3Q@mail.gmail.com>
	<20130422221415.1e88893e@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130422221415.1e88893e@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Meta-OpenEmbedded - Dylan maintenance
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
X-List-Received-Date: Mon, 22 Apr 2013 21:41:22 -0000
X-Groupsio-MsgNum: 44374
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline

--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 10:14:15PM +0200, Eric B=E9nard wrote:
> Hi Otavio,
>=20
> Le Mon, 22 Apr 2013 16:08:55 -0300,
> Otavio Salvador <otavio@ossystems.com.br> a =E9crit :
> > The upcoming release of dylan is very close and we should start think
> > about its maintenance; is someone intending to be the maintainer of
> > the 'dylan' branch of meta-oe?
> >=20
> I can continue maintenance with dylan as experience of the switch from
> denzil to danny showed that n-1 gets very few updates once n is
> released (and as my BSP are switching to dylan next month ;-).

Great, you did well with danny, it would be great to see you taking care
of dylan too.

Feel free to create dylan branch when you see fit.

I don't plan to merge any master-only change soon if I don't have to or
overlook it (jenkins is still testing against master).

When someone is sending patch which shouldn't go to dylan, please
indicate it in subject (something like [master-only] should do).
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF1ql4ACgkQN1Ujt2V2gBy/JACeP98mVnMG1ddoja1D7OwxBoy6
DegAn2hYvYGxsQTNdTdgYSTx+LqH3LDX
=/2CK
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
