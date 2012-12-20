Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlgTb-0006JR-KD
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:47:56 +0100
Received: by mail-pb0-f43.google.com with SMTP id um15so1997879pbc.16
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RAVd7fsZzpWOUaMbU13vGv63zWzdYqgQ41WNkh59HQo=;
	b=n70u+x5mzkoBgNN8NRk035ZpGpTK34T+HpHupietZAyGifyAFrdDyVBiX7rG+R++h5
	E0lAuDey0yLxalqcxue/z2mtD76eo6jDos8iICa/0lvWQ9BBY5AkNJyJXcw8JkixFX6M
	RkvV9/C0OsOoIVrF+5OdiNA1efY6Ptx1IFggQHOQUpH6uL0/Ok/I7gEfEp0nwkW1/zWa
	2F5I80FkBDr8gkoT9hUMRah8B89UhIneWomZ6uRwmVZsb4oErcHeF4ydcbVh3tjPSMWe
	WPl5hHu9sTFPkEvVxd0E84m/GBpTiISmsN2f6D82QzBCpT/W2JqPVoRMAqdPjTsbvayO
	jFdw==
X-Received: by 10.68.234.167 with SMTP id uf7mr29693012pbc.20.1356010390366;
	Thu, 20 Dec 2012 05:33:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id oj5sm5058785pbb.47.2012.12.20.05.33.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:33:09 -0800 (PST)
Date: Thu, 20 Dec 2012 14:33:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220133307.GK14543@jama.palm1.palmone.com>
References: <20121220133018.GJ14543@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121220133018.GJ14543@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] patches on patchwork
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
X-List-Received-Date: Thu, 20 Dec 2012 13:47:56 -0000
X-Groupsio-MsgNum: 42281
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9kwpIYUMbI/2cCx"
Content-Disposition: inline

--M9kwpIYUMbI/2cCx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, can you check and update patche in meta-webserver bundle?
http://patches.openembedded.org/bundle/jama/meta-webserver/?archive=3Dboth

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--M9kwpIYUMbI/2cCx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTE5MACgkQN1Ujt2V2gBxUaACfYCBl20d1miW1oJVJ3w0eNSxZ
XK8AoIGchW+3VYEpkiMihfdItywfn4/h
=7yjL
-----END PGP SIGNATURE-----

--M9kwpIYUMbI/2cCx--
