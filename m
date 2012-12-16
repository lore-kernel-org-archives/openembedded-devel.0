Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TkHvN-0004ks-Sp
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 18:22:51 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2692470eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=33UeE64hJJPaSp1pKOrJdaWxyBhWkSbAAqynBp1F/UI=;
	b=aRjyi+VBma3pZKLiQ63lfyKUsDRN76eimXQbfvUF146WE9kBYoMe3rLPBTz4wMMGX+
	3kMLLpAH579QutsuB+q4TMWGPPb25Frmrck1xieqc53XkkALuqe7IA2Evn7fETxs2MFf
	geqaOEeCFlQQ1CjvcUX+RCdfGrbMuF5gRpTOTx8z2hh8ltumPZypwM/wbc1w+qLSEfDh
	mbh6SjUysfdM7LtB2SqWlS2R1AlrdCWBq+9QKlEq0Qncswp42c5uxKtTX7cV9U1fiSS4
	1I/xpmS7ZzBoU1DN+JDTv31TKvVBRiBZMJuNquXq3G3RXf5PLQmhfOzeN8IS3LkvPMW1
	Vm/A==
Received: by 10.14.215.197 with SMTP id e45mr33981268eep.0.1355677690728;
	Sun, 16 Dec 2012 09:08:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm23625740eel.17.2012.12.16.09.08.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Dec 2012 09:08:10 -0800 (PST)
Date: Sun, 16 Dec 2012 18:08:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121216170809.GA3448@jama>
References: <20121216105611.7746c440@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20121216105611.7746c440@eb-e6520>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Liu Ting-B28495 <B28495@freescale.com>
Subject: Re: Denzil updates
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
X-List-Received-Date: Sun, 16 Dec 2012 17:22:51 -0000
X-Groupsio-MsgNum: 42183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 16, 2012 at 10:56:11AM +0100, Eric B=E9nard wrote:
> Hi Koen, Hi Liu,
>=20
> as per your requests the following patches were applied to
> denzil-next :
> 35f92b4 systemd: use system variables instead of hardcoded paths
> 6e0ddd4 systemd: update to v189 66e169f gdm: do not rely on
> dev-tty7.device
> 0f17a3f meta-systemd: systemd-systemctl-native: Also add support for
> WantedBy=3D*.service
> d6dd53c systemd-systemctl-native: handle ALIAS tag
> e5b3091 systemd-systemctl-native: extend systemctl wrapper to support
> mask action
> f713db3 systemd-systemctl-native: Add additional messages for better
> debugging
>=20
> patchwork # : 36615 36613 36609 36611 36605 36607 36535 (with manual
> rework for the last one).
>=20
> Please don't forget to cc me for patches for denzil or danny.

did git push show some errors/warnings when searching for patchwork
commits to mark as applied? interestingly none was marked by hook

http://patches.openembedded.org/bundle/jama/denzil/

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDN//kACgkQN1Ujt2V2gBzolQCfS5qYel4NMoC0fGu5IytOcEHw
tUoAn1nxPF6SNWkom5eZvcROEQfORTYD
=faTc
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
