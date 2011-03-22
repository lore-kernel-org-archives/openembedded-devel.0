Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q1xYh-0007QX-K7
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:07:23 +0100
Received: by bwz10 with SMTP id 10so5458604bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=80ZGyxq+MSkTt1NaDK2xZy6wLRf4J3sDgo++P9DOfp8=;
	b=clsyOQDl3fIPcLETn6J9y30H9/oYcEsGFXZpUBlhXCSUhdYPD5NDGD65l2gEOeHI1C
	5FJsGkVXwB7wKx0XEyb7gM7DWkKZDrT2CFbBqWKoOuE4nCp48fWpKiCQgr7msS6ehunG
	8EUMfA0WJPSaTZcp/ICtJubGaxsG4RqJvSlEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=sLXpULkV2L+tbumBnJdKpYa9i6Bej2fr9SMuigtgOUqBmaOOMfk89biM6/OwIqvuxD
	qRYVFyR8gNIjpDBOdl6s7wr8SQoEq55v4+I17Gnf5Rf8DQIlKebD1WiZJsQ63/52A8cX
	KEOudC9GlpvXSHS1S234YuFHGzmOAp36tf85w=
Received: by 10.204.33.22 with SMTP id f22mr2586679bkd.72.1300784727181;
	Tue, 22 Mar 2011 02:05:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm4953827bkf.20.2011.03.22.02.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 02:05:25 -0700 (PDT)
Date: Tue, 22 Mar 2011 10:05:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322090523.GA3418@jama.jama.net>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-2-git-send-email-heinold@inf.fu-berlin.de>
	<im9m2q$pse$1@dough.gmane.org>
	<20110322090004.GA13738@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20110322090004.GA13738@rhein.zuhause.netz>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/3] libatomic-ops: switch to own directroy and use cvs version
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
X-List-Received-Date: Tue, 22 Mar 2011 09:07:23 -0000
X-Groupsio-MsgNum: 30486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2011 at 10:00:05AM +0100, Henning Heinold wrote:
> On Tue, Mar 22, 2011 at 09:19:38AM +0100, Koen Kooi wrote:
> > Where are you setting SRCDATE for this recipe?
>=20
> Ah sorry,
>=20
> I left this over for discussion and forget to mentioned it.
>=20
> Is it better in inside the recipe now or per the sane-revdate.inc?

In recipe please

http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D26b7830cab29=
b04c2a3db1799fb171550e7d83fb

>=20
> Bye Henning
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2IZlMACgkQN1Ujt2V2gBxqGgCfSz7LvG6ZCa3ot6GwhIip/i0S
aJIAn0m7YJJq+8eJi1fekbcx3P5Oj4nO
=ygx1
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
