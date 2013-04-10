Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQ2fC-0001oC-FR
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 23:34:45 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so531260pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 14:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=r1wWxJaXRJfU7D2uNUFHN0zUhaN9Lq2tLKdqbwm+WsQ=;
	b=v0bYIHCxAqBlxySzbwu5dtSH3D3YhljFDBazPtw8weTT5jau+vanYp5sawYXHJfMXL
	LBXGMMiRDY9heiqVZnPE8QMQBsWHnFTq/X3Gi1OoS8RNdcEuiTdxxSZIpzla6z3CrhFn
	R6fvSo+IANFeUe9MixEK0OSFWr+EzjgrXjsdcCpCqhbOCN64rVSfy+MPbxWFcnPsdJ3P
	UpjrsqNAj+nHDCAvIBZteU0neOFWMvrftFZs7BFcwIriCeRGIye2C7B+bAUwZyhMYhYM
	zyRtaLRE04NqrkDarCNOxncdTAh1REFHkU//hS2uS46l++7c5hAjvPs/THVRCYWh7dwN
	GjSg==
X-Received: by 10.66.119.5 with SMTP id kq5mr5719791pab.193.1365628639801;
	Wed, 10 Apr 2013 14:17:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d6sm1309017pbr.6.2013.04.10.14.17.16
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 14:17:18 -0700 (PDT)
Date: Wed, 10 Apr 2013 23:17:11 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130410211711.GG2471@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<F52AA45C-FB86-4749-95C0-0DA24BC50DFB@dominion.thruhere.net>
	<CAJTo0LZga4SoPiHOCVTQizutkcfe-417jx+fuHxCira--QWiGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZga4SoPiHOCVTQizutkcfe-417jx+fuHxCira--QWiGQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Wed, 10 Apr 2013 21:35:08 -0000
X-Groupsio-MsgNum: 44046
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JkW1gnuWHDypiMFO"
Content-Disposition: inline

--JkW1gnuWHDypiMFO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 12:06:49PM +0100, Burton, Ross wrote:
> On 9 April 2013 21:08, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > Upgrade paths are totally broken anyway, so let's go for 3 + A
>=20
> As you keep saying this, it would be great if someone would do an
> upgrade from danny to dylan and actually report the breakages.  Thanks
> mainly to Martin the bulk of the package transitions that I'm aware of
> have replaces/conflicts/provides in place.

I should have asked which Monday he meant.. it's still not fixed
connman:
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/037355.ht=
ml

util-linux:
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/34410

and I can find a lot more in my sent folder if I really care :/.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JkW1gnuWHDypiMFO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFl1tcACgkQN1Ujt2V2gBwwxwCbB0f6tDxsqibv2swdbK9eBNyB
cKAAoJGPaXLVh/vqKmfS+mI+ysofey4i
=OoFo
-----END PGP SIGNATURE-----

--JkW1gnuWHDypiMFO--
