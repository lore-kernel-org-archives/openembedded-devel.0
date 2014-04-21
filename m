Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6E58765D10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:43:58 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so3589779eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+T7QWOoDtPSGf56PoSxUdwswiYVWUbhWRhtcdpUJCk0=;
	b=cFeVwqV9YBKUndb35D5xC4igNYl4F7nUhO98UJUIXLQHUJjP2uCEazJ7aJlVpvSpNC
	YSGaqfV3kvckQ8kLq1pXw5RzoF2y1qGBX/Ped1lXspXC+W1DQXaLlDWODkcNlP44siSs
	CFKD7pR0hduZ7SIB3XpMZcY1YQhBbe9OgWtnbew0VT9tWVehEJXzKD+aB7g3Jr7N+off
	dpCQudafmQ6OcFObFEq5YdijcvIyN8er/k3IlFWnjE3JlY4+rXLTEFMGSdmvC3OtY2Xb
	/p+EHbcqDtxHxhoAmyVhEWHQ8uaDj5EtCTIWg8SLPQBR1kj49CJvzEJfiZZB8i+S1ye3
	B+cA==
X-Received: by 10.14.218.193 with SMTP id k41mr46908629eep.16.1398080639224;
	Mon, 21 Apr 2014 04:43:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	4sm102908393eeq.33.2014.04.21.04.43.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:43:58 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:43:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421114355.GC2486@jama>
References: <1393618507-29414-1-git-send-email-obi@opendreambox.org>
	<1393618507-29414-3-git-send-email-obi@opendreambox.org>
	<CAJ86T=VCOWmE-eyYvpKLjfYhgyFSn0URjo_9yu7V9OGoUUD8aA@mail.gmail.com>
	<CAJ86T=XJ4XN5bDs4yKgUS7DFSkp9jSti7cKrDCYrcHRDyOtA6g@mail.gmail.com>
	<533F180A.80900@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <533F180A.80900@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 3/3] qtwebkit: add packageconfig for gstreamer, qtlocation and qtsensors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Apr 2014 11:43:58 -0000
X-Groupsio-MsgNum: 49395
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFw2VRElW3V0Y7aQ"
Content-Disposition: inline

--nFw2VRElW3V0Y7aQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 04, 2014 at 10:37:30PM +0200, Andreas Oberritter wrote:
> Hello Andre,
>=20
> thanks for your reminder. After your first mail I got distracted and
> forgot about looking into this.
>=20
> I was able to reproduce it and just submitted a patch to the mailing
> list. I build-tested it with PACKAGECONFIG =3D "", "gstreamer" and
> "gstreamer qtlocation" on dora.

Merged, thanks

>=20
> Regards,
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nFw2VRElW3V0Y7aQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVBHsACgkQN1Ujt2V2gBx9rgCfej1jHaDYYGJDvhOf2nNOyjxr
r5UAn3hmPlJw9sqbauuiyoqXVBZm8uU5
=0Ir2
-----END PGP SIGNATURE-----

--nFw2VRElW3V0Y7aQ--
