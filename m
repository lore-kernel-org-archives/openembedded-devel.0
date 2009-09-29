Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1Msbk5-0002IX-1A
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Sep 2009 14:23:44 +0200
Received: by ewy20 with SMTP id 20so12991717ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Sep 2009 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:mime-version:content-type:content-transfer-encoding
	:message-id; bh=XZCDC5MsGBGijN3+SHLacH5QEdR6hbRelvZNGt7H9xI=;
	b=wo3GC8ASgsIe/efSB4/9/Vs7fVTNs+Orf1EiMkyTwKpgwikHdsW4VsoubrieCTU7xK
	ww9JWDWxh4+ql7LN5yDNkAlWewyD9/ST080BQcG3BeciR5hv/dyeUfEU7i7Kkp1xhe+H
	ESOLVpI+/CuqEhA4BwLsY2SjZAdZEuKLUDoxo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:mime-version:content-type
	:content-transfer-encoding:message-id;
	b=TrrnNOK80WE9KQtIGHmJgCFlvbjH33S8uiACkGV51c/pNUVcJXjIV6bnPI9aXViPZU
	MlIKvZAbd59UkroBqQJgOuylHDtE28ag+g3P92pH5nBCl0SRUCOXoGAUcVeyqjEAJkQS
	r/mHUg4N2cEFojYw5q7alYr0jdmj3rOaXL+2Q=
Received: by 10.211.157.7 with SMTP id j7mr5185199ebo.2.1254226977829;
	Tue, 29 Sep 2009 05:22:57 -0700 (PDT)
Received: from anarsoul-laptop.localnet ([212.98.167.157])
	by mx.google.com with ESMTPS id 7sm2670453eyb.12.2009.09.29.05.22.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Sep 2009 05:22:57 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Sep 2009 15:22:25 +0300
User-Agent: KMail/1.12.1 (Linux/2.6.31-gentoo-anarsoul; KDE/4.3.1; i686; ; )
MIME-Version: 1.0
Message-Id: <200909291522.29707.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.220
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: tslib-1.0 is broken on rx1950
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
X-List-Received-Date: Tue, 29 Sep 2009 12:23:44 -0000
X-Groupsio-MsgNum: 13263
Content-Type: multipart/signed; boundary="nextPart2098889.Xz0oq1sQ36";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2098889.Xz0oq1sQ36
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, it seems that tslib-1.0 is broken for rx1950 machine, after calibrating=
=20
process, opie doesn't respond on touchscreen events. However, tslib-svn wor=
ks=20
flawlessly.

Any suggestions? :)

Regads
Vasily

--nextPart2098889.Xz0oq1sQ36
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrB/AUACgkQRM6pQpltKE4+sQCfWx2kauarlpjhDiq4xbTS9G4a
DkIAoNSzU65hoBDebbPz+YpgYbAQSwd0
=twgC
-----END PGP SIGNATURE-----

--nextPart2098889.Xz0oq1sQ36--
