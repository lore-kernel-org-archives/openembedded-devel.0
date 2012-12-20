Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tlgvi-00021f-Te
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 15:16:59 +0100
Received: by mail-pb0-f48.google.com with SMTP id rq13so2006289pbb.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=yc6r/6i1MCXHxN7vH9tEzlM4a/RrB0sbmjqLDBdHHRA=;
	b=uUI6VGtmo+4P/0M8CC/MvTLGkGgVfjATUkBpJufrVAaoQwoHPy5sQU6D1dtB6t17So
	Yk4eS7E1IH8UrsDH8irin+i/M9mnzzK8WXs/op3F0w5x5AD2J3wTNwOpEtjgVnNmM6zr
	PsdlpVtLnuJhImpz30fIH/ovpcMXcyq1ci7QsWd76+OuZuDQCLE0Ej7hgcUpCqkYRMY/
	j/k8biMORB/jPugdPkxMEMY8+0xEZXJVCUsec18LhBWLtSwEZwe9eVIbZUn65m4M595z
	13SXIHpSmtNT+hjFeLXOdXKE1mFLn1+UDOH9bIXtRuSSTJLNMANtTGShHsOyT9YRM1XX
	Sa/w==
X-Received: by 10.68.135.99 with SMTP id pr3mr29977593pbb.151.1356012133751;
	Thu, 20 Dec 2012 06:02:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id p10sm5458505pax.27.2012.12.20.06.02.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 06:02:12 -0800 (PST)
Date: Thu, 20 Dec 2012 15:02:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220140211.GO14543@jama.palm1.palmone.com>
References: <20121220133018.GJ14543@jama.palm1.palmone.com>
	<20121220133307.GK14543@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121220133307.GK14543@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-webserver] patches on patchwork
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
X-List-Received-Date: Thu, 20 Dec 2012 14:16:59 -0000
X-Groupsio-MsgNum: 42284
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H83aLI5Lttn3Hg7B"
Content-Disposition: inline

--H83aLI5Lttn3Hg7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 20, 2012 at 02:33:07PM +0100, Martin Jansa wrote:
> Hi, can you check and update patche in meta-webserver bundle?
> http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=3Dboth

I've forgot to mention there is also one in meta-opie and one in
meta-handheld
http://patches.openembedded.org/bundle/jama/meta-handheld/?archive=3Dboth
http://patches.openembedded.org/bundle/jama/meta-opie/?archive=3Dboth

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H83aLI5Lttn3Hg7B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTGmMACgkQN1Ujt2V2gBy3zACfS4038PrOCJMku05TRjU7qU66
I7UAn2CSuaLFYZ5Yf7vKkMvdIIfAKYGn
=Krpc
-----END PGP SIGNATURE-----

--H83aLI5Lttn3Hg7B--
