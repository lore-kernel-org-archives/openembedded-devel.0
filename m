Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgMqc-0002X3-Pu
	for openembedded-devel@openembedded.org; Mon, 31 Mar 2008 18:27:03 +0200
Received: by an-out-0708.google.com with SMTP id b38so445709ana.6
	for <openembedded-devel@openembedded.org>;
	Mon, 31 Mar 2008 09:27:00 -0700 (PDT)
Received: by 10.100.251.18 with SMTP id y18mr16391607anh.88.1206980820859;
	Mon, 31 Mar 2008 09:27:00 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 36sm748232agc.9.2008.03.31.09.26.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 09:27:00 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 11:26:45 -0500
User-Agent: KMail/1.9.7
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<c384c5ea0803310844l1e91faa0m86a699174afeabf7@mail.gmail.com>
	<fsr2gk$t6o$1@ger.gmane.org>
In-Reply-To: <fsr2gk$t6o$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200803311126.50655.e.robertson.svg@gmail.com>
Cc: openembedded-devel@openembedded.org,
	Koen Kooi <koen@dominion.kabel.utwente.nl>
Subject: Re: New OE user question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Mar 2008 16:27:03 -0000
X-Groupsio-MsgNum: 4856
Content-Type: multipart/signed; boundary="nextPart14372257.aJkv8zZDrC";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart14372257.aJkv8zZDrC
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 31 March 2008 11:12:03 am Koen Kooi wrote:
> Leon Woestenberg schreef:
> | On Mon, Mar 31, 2008 at 4:07 PM, E Robertson
>
> <e.robertson.svg@gmail.com> wrote:
> |> Hi All,
> |>
> |>  I'm brand new to OE and I've been following the documentation steps
>
> along the
>
> |>  way. I notice the documentation is either missing sections or not
>
> clear and
>
> | Good catch, our default example seems to be unmaintained.  Probably
> | the "generic" distribution lacks good maintenance, at least for this
> | configuration.
> |
> | DISTRO         =3D "generic-uclibc"
> |
> | The error which stops your build is:
> |>  | Unable to determine version for kernel headers
> |>  |       provided in
> |
> | Can someone suggest a saner distribution for this Samsung chip?
>
> angstrom maybe?
>
> It's an atmel chip, and atmel itself recommends angstrom:

Yes, I'm using an atmel chip but not necessarily going with atmel=20
recommendations. Eventually I would build a custom distro (on a custom boar=
d)=20
unless Angstrom is the best way to go. Seeing that I'm new, I don't know=20
anything about Angstrom so my decision point is a aways off.

regards,
Ezban

--nextPart14372257.aJkv8zZDrC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8RDK2sS31XKVICURAmAfAJ0TxKDlBPM9TTCBPUMkNJsDfQGBtACeONN4
qaq6sw6WV80cHNBnNDODvf4=
=I/tt
-----END PGP SIGNATURE-----

--nextPart14372257.aJkv8zZDrC--
