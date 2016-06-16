Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6B57160589
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 09:08:03 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f126so41997966wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jun 2016 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4kQTHTZlrSIvPzNjlhcM9wl7dqzbRQ+cV9djQgthkr8=;
	b=bSzQPfv2LxXPhmotYSwy/FfG21meNYv2P7jiDvbKyMcmSZ86CCmcTHAbwZBpVi7TqJ
	yQ9OFRyVeOeOgEDhspu9eo1sl1PMM6ZCeWD+GSErnbbvBqH5hIujJ4Opp+pqQKHicTQT
	dNf1Z+Y1GTfou+8TxMu/3+7oF18Z3m925qXjPuVYzIFDQIBbAMXFi1eHDMjVKfkR24bj
	Lq1t3J5vPAOJ6xKFP3vK/KS75izOc05faptctk6UTXCwMl7Lz1pdsIcqCtyG1vdkHbfX
	68WZ4ldlADHcYCAimbCZwYEZZ6bdfQU6RqUOwDIyTkMt2cqQcRH7xHMuVliAp9qr4sLR
	aN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4kQTHTZlrSIvPzNjlhcM9wl7dqzbRQ+cV9djQgthkr8=;
	b=EO1AaNLeDI4HM9TlA6RmIwg/2jI/AFAkx+8QNqf3o3owDPFaPeSSYYJ4kos3ni2da9
	EUziulsuA8x3Lso/Lr5WKUxKNvOE5svzgLp1mAXkzN/PTZ2e9I1nclDztLh+1INzpKSG
	4/9Hqfo4Oin6k/yC5/4cb/dpnRquTLnDHl/k7+uCW5SOgE3vejC11r1nBS3iDDvqYVtS
	thbraa2gFkXNRKqf5tlxOquwayc1ea7BveFjoq6vvkNfgkwr1XH5foLb3WlbzMSwN271
	Hk+vlnezIblSohnoVfZId9LU+oFAvkQe3eeRwmaGEXAd2sw41SOMmt9qxNURoG9boGfj
	04bw==
X-Gm-Message-State: ALyK8tIbZdwBCCD4YwTVsZzk/6Q1GiWb2djb+KAAT1dw7cTGhqUcxCMdnb3JHWVtTPdV7A==
X-Received: by 10.28.164.193 with SMTP id n184mr3715168wme.12.1466068084250;
	Thu, 16 Jun 2016 02:08:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ag3sm1939680wjc.39.2016.06.16.02.08.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Jun 2016 02:08:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Jun 2016 11:08:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160616090833.GA2563@jama>
References: <57625081.8000304@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <57625081.8000304@mlbassoc.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [meta-browser] Browser blacklists
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jun 2016 09:08:05 -0000
X-Groupsio-MsgNum: 61852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2016 at 09:08:49AM +0200, Gary Thomas wrote:
> I notice that both firefox and chromium are currently blacklisted
> as "fails to build with gcc-6".  What about those of us that aren't
> using gcc-6?  This seems an overly broad blacklisting :-(

You can easily unblacklist them in your configuration where you also
change the gcc version, but they are broken in default configuration, so
they are blacklisted.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldiatYACgkQN1Ujt2V2gBwJHwCcC8vkN28oVrnodbRbZdhmGAPf
3uwAnj/wvwLeT+Tj0H7LrGNWznCjtwpL
=LjQl
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
