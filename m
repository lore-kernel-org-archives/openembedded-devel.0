Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id D8CF4781F0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:59:19 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id 63so30723224ywr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WGWDkKlj0GhO0OoNFhlE8b1CSzMGJ+7WiSLr6sI5kN4=;
	b=Ge7WbWEPFoH403K/prEH60283MoKMNZu9WKSPFK/DifdQFNGO1CvARBNOQck+vye9y
	dIOJKSDPaqOi2VDXKvR/zr6vrN1yu6E8DXSCysayThzwmubEGWd6JFoJAsvO1C+UzgTU
	DxyhQddAqCYoglEKKwgx21McywBDcstIxTrfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WGWDkKlj0GhO0OoNFhlE8b1CSzMGJ+7WiSLr6sI5kN4=;
	b=If44T9MTyVaiGNNOLxAnaMRnzhDX069TwlFHjFkvaUOLrQw+86gndmjitYWAtCdgUe
	xEChy2g0TjM7EkapWUn6yu6qIH4oEG/V35ShThx9W9Wq5qEywHg0PjkSIx65Z1pre5ky
	yAX+EHdCvOBqOFfOQJXHHm759kPzLfvpfyY8GasVMSWUsDv+yIIfhl9iiP1fJZWr2MUy
	o+pSGhPyDtNezr2SdscOoALca1F9Ve+khuHJEk54URDwVXsHk3bhY4M9u7PeR94sJZLK
	e60+3QQBDZNBFeKW3MxBRRBgo6hF8wo9oJkkywgizJNBfbDv6zXQDWcPw7fwqmd23wd2
	Lcnw==
X-Gm-Message-State: AODbwcCHW5j4itRGkhmCmUlJ0U2Rw6Emk/tbfL0vLMjh+0P+S/JRAEd+
	pnVINcEQU1o5R2rx
X-Received: by 10.129.105.67 with SMTP id e64mr21350667ywc.129.1497200360841; 
	Sun, 11 Jun 2017 09:59:20 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	q65sm2977024ywq.63.2017.06.11.09.59.19
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 09:59:19 -0700 (PDT)
Date: Sun, 11 Jun 2017 12:59:39 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170611165939.GT10782@bill-the-cat>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
	<1497193576-3774-2-git-send-email-trini@konsulko.com>
	<CAMKF1soYoKjRue_y6w=yjZRP5ByOkLcrtZ=RwBTfopammubT1w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soYoKjRue_y6w=yjZRP5ByOkLcrtZ=RwBTfopammubT1w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] debsums: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 16:59:20 -0000
X-Groupsio-MsgNum: 67112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="guNv2oDMRRFCs4ev"
Content-Disposition: inline

--guNv2oDMRRFCs4ev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 11, 2017 at 08:59:02AM -0700, Khem Raj wrote:
> On Sun, Jun 11, 2017 at 8:06 AM, Tom Rini <trini@konsulko.com> wrote:
> > A tool for verification of installed package files against MD5 checksums
> > debsums can verify the integrity of installed package files against MD5
> > checksums installed by the package, or generated from a .deb archive.
>=20
> order of directives seems a bit displaced, may be running
> meta-openembedded/contrib/oe-stylize.py
> will be good.

I'm not sure about that, I copied the order here from prelink_git.bb in
oe-core.  Unless you're referring to something outside of the -cron
part?  Thanks!

--=20
Tom

--guNv2oDMRRFCs4ev
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZPXb7AAoJEIf59jXTHXZS2+sP/0bK90oFtniCv2/piNoMcLWa
C+WMeioSZka9MPRhqd6Y0Vdkqeunw2b1NCn4T5n6vXSUflCShRoByue6w0/P3z1m
YKXg2vfBjHan6CL49+VO2CBaeoDA7Pgh0xJRWtKZI+lYqa7MeRaTnhhD6I4tU0yx
Q0cYu5A6JtyuEAHE/yiNzUUMLJKqgdh5797br1rTF5rgf/GU0+aDMuMbJcXu/Lfa
mw17SBxgD7ca0fdh94CX5OpfeFe9LzQ46fC4lpjScPQ30hYFjbk3tk1FppX8nMZV
VsHyzZaGc+NZ0JGEi8fDQGuWsDrVOO9YhB3A20Bl17acETf8/2tbD1/JaF0rgmB/
BtyZyVI7xV+fDGVqxbSvOQmqHZ3YYrvUBwxw/qv52mwJmZZuRHz92548k4jYljmL
8QRelavKL+Lujs05gqVKmongiiBq7PX/4qKzhN31xqLOA+quE2Y3r6Nup6y4swEn
i19KAx9bjcGnMXT3eUbCAzS7r7gz+HKGxXFcrbyA7KhEVgvUnD0MA/EgJNhyXXAC
SZrQqIJxRl76WHsiGuz6ub0UjBRv5Oz0gDEfoBaAhiqwaayqbDjhwpKkijNlrO7O
Kleaty1KH5m4D2rSUiOkFsod+t6KEwVGHJzXJ79tTj4CYdw0tWGcGjus3Yij+ZUw
PdVDn1FlTFihUwQUCQWA
=51wy
-----END PGP SIGNATURE-----

--guNv2oDMRRFCs4ev--
