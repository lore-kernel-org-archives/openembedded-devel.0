Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USBZz-0004Cb-Ni
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 21:30:16 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq13so453785pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2013 12:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D7KwviHQFVaVBsLMGhSrtibXv7Z69zT8gKAJ8JiT0jI=;
	b=bKeSpnV8IWelPOVoTxlIPclH9908/GYsfkLINUqAUqi0x8kfsFFENyFeq87VvIVRrD
	LUZ6S0wkNGZzSrRnLe+90or3q5EsgGz+3k4clR0B/GDmiYYCniB15aR/zo+/Jg06T+eS
	dx5MdfWwRb01Dk2lESQFWNNKbyNmeLQuH2Whleskh0xNeu7rBAYLMhgd1HtA4N1crXID
	3wUtKaY+/n56hXm08VBTmWdHEs0ja2MWPhoUAnFwQy8drQCxCiKKu9Yp4dDRwWHdhOAP
	D4ixmCgct6DUU/yud9JYi993mIeCvW3fOPFAFC3yC/d0pd72YkAMtvyezhhUYpE7h8Ed
	MpHg==
X-Received: by 10.68.114.100 with SMTP id jf4mr2137192pbb.144.1366139560199;
	Tue, 16 Apr 2013 12:12:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id dg5sm3075578pbc.29.2013.04.16.12.12.37
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 12:12:39 -0700 (PDT)
Date: Tue, 16 Apr 2013 21:12:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130416191237.GT10628@jama.dyndns-home.com>
References: <1366059851-7972-1-git-send-email-mario@ossystems.com.br>
	<85zjwzo63d.fsf@cl-t066-141cl.privatedns.com>
MIME-Version: 1.0
In-Reply-To: <85zjwzo63d.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] goffice: update to version 0.10.1
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
X-List-Received-Date: Tue, 16 Apr 2013 19:30:25 -0000
X-Groupsio-MsgNum: 44258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OowMmFE4aK71mEhh"
Content-Disposition: inline

--OowMmFE4aK71mEhh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 05:07:50PM -0400, Mario Domenech Goulart wrote:
> Hi,
>=20
> Out of reflex I ended up setting the subject tag for the gnumeric and
> goffice patches as [meta-oe].  They are actually in the meta-gnome
> directory.
>=20
> Do you want me to resend the patches to fix that?

Not needed, with patchwork clean and very few oe-classic recipes I
noticed it and it's already in queue for jenkins.

> I noticed the meta-gnome directory has no README with instructions for
> submitting patches.
>=20
> Best wishes.
> Mario
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OowMmFE4aK71mEhh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFtoqUACgkQN1Ujt2V2gBxOVgCfbc8M+UQmLToW0FyIkqMOBlFR
dTEAnjenXw5szbOtMngSJWqKADXVsJss
=yc07
-----END PGP SIGNATURE-----

--OowMmFE4aK71mEhh--
