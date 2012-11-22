Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbSjA-0005dn-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 10:05:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4368692eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ck2A0hbrjY9gVHTsAgsCHp/UsFJfQ7InaRz9Mnv72EE=;
	b=l5UF0mTLTf+zegdRAM4pd3zuH9tE7KubDt16Xjf6pu3/Wv1Bg1jnu5gLNp9cgDoEeB
	0DlfRdAud0FmlpoKzvcVg1bE5ELGC12sSryTx5R1DB7x34g1GR0lOsZPZ29gjuwOZVXP
	Jf8XzmDJmXhlmgv+SQJZhO9+ZntKoA2RfyOY1YfqRVBwp86HhHPM0s5ssc/zGzWQpMQL
	iW/45xiSHsvk32U/XFJwn78XAqFcY1qKeiBtaTbg5eSGqQ7glPu57vTNVR5ZvbHxZOIZ
	Sf/Io073PbbH+seI+Z9spnEYd5Vf1m4HZkUQ028MxEo5l7l/uK64+jYRzKeIbq4UVsXx
	hwKg==
Received: by 10.14.214.2 with SMTP id b2mr55580211eep.32.1353574299056;
	Thu, 22 Nov 2012 00:51:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f2sm5684618eep.2.2012.11.22.00.51.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 00:51:38 -0800 (PST)
Date: Thu, 22 Nov 2012 09:51:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121122085136.GV12637@jama.jama.net>
References: <20121122084944.2288A10397@opal>
MIME-Version: 1.0
In-Reply-To: <20121122084944.2288A10397@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Martin Jansa : qt4-x11-free: drop bbappend for 4.8.1
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
X-List-Received-Date: Thu, 22 Nov 2012 09:05:45 -0000
X-Groupsio-MsgNum: 41621
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XDqeUMnLaDfDQgU1"
Content-Disposition: inline

--XDqeUMnLaDfDQgU1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 22, 2012 at 08:49:43AM +0000, git@git.openembedded.org wrote:
> Module: meta-openembedded.git
> Branch: danny
> Commit: bb3d744481c148ef570d9dfe0eb5f6821d02318b
> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit=
;h=3Dbb3d744481c148ef570d9dfe0eb5f6821d02318b

This isn't right ^, should be in master only.

Both qt4 bbappends and dhcp bbappend change

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XDqeUMnLaDfDQgU1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCt55gACgkQN1Ujt2V2gBwG2wCglDrmdyT79RmYFnUgZRucB0D7
sP0AnR52eOFy1sbqth9ClRyfCghfR/Mk
=ooBv
-----END PGP SIGNATURE-----

--XDqeUMnLaDfDQgU1--
