Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAh5F-0001xF-Vy
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 13:53:22 +0200
Received: by bke11 with SMTP id 11so5256299bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 04:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GD76ywQaz/Jo1QQipx5bwnpkJeAvXW+Ts4uQ/lWEhTw=;
	b=aHxmdnTHkPCKaIhdX9ckFXUkavGNJLo7SMYKXvTZtJtDQ62sDvwX+ySV0zFVvVGBzl
	Flplaj4QV2G18AdYbnZo+tJYaeKDGMwsb/+xp20Y2sZB7eiDtT9spnI9x3UZEexWlPur
	FfkwnmYhzNXn4NyHKOd/078sHnrXzyPj00GMs=
Received: by 10.204.136.194 with SMTP id s2mr6719797bkt.23.1317642469102;
	Mon, 03 Oct 2011 04:47:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l3sm5292870bkv.12.2011.10.03.04.47.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 04:47:47 -0700 (PDT)
Date: Mon, 3 Oct 2011 13:47:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111003114741.GO7364@jama.jama.net>
References: <cover.1317387144.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1317387144.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-efl][PATCH 00/15] Pull request #23
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
X-List-Received-Date: Mon, 03 Oct 2011 11:53:22 -0000
X-Groupsio-MsgNum: 34545
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GEn4szYucjS2InE7"
Content-Disposition: inline

--GEn4szYucjS2InE7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 02:56:39PM +0200, Martin Jansa wrote:
> Hi,
>=20
> this patchset depends on oe-core changes from:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/010=
393.html
> but first few patches from that patchset are already in master-next and w=
e need to=20
> be ready to adapt.

I've sent another patchset to oe-core which renames xserver-xf86 to
xserver-xorg as we're used to call it.. so I'll resend consolidated pull
request with new xorg/glib/poppler changes.

Regards,

--GEn4szYucjS2InE7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6JoN0ACgkQN1Ujt2V2gBzDIgCffDZqtnlcKZKWFmLacYlru5bU
/EkAoKYd7HAaz18kaTzNTFb/+TZEFe6n
=+lAG
-----END PGP SIGNATURE-----

--GEn4szYucjS2InE7--
