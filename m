Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgMjt-00068v-KS
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 18:20:05 +0200
Received: by an-out-0708.google.com with SMTP id b33so461093ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 09:20:04 -0700 (PDT)
Received: by 10.100.33.13 with SMTP id g13mr16278648ang.96.1206980403571;
	Mon, 31 Mar 2008 09:20:03 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 20sm2437352agd.11.2008.03.31.09.20.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 09:20:02 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 11:19:47 -0500
User-Agent: KMail/1.9.7
References: <200803310907.56781.e.robertson.svg@gmail.com>
	<f96d234e0803310833g4565e51u2abbc47312c05f07@mail.gmail.com>
In-Reply-To: <f96d234e0803310833g4565e51u2abbc47312c05f07@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200803311119.53596.e.robertson.svg@gmail.com>
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
X-List-Received-Date: Mon, 31 Mar 2008 16:20:06 -0000
X-Groupsio-MsgNum: 4855
Content-Type: multipart/signed; boundary="nextPart24635690.W3Ii7BJxZI";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart24635690.W3Ii7BJxZI
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

> The "User Manual" is maintained in the monotone repo, and can be
> checked out and edited.
>
> http://amethyst.openembedded.net/oe/viewmtn/viewmtn.py/branch/changes/org=
=2Eo
>penembedded.documentation
>
> Patches welcome.

I'm not sure how your patch system works. I could checkout the documentatio=
n=20
branch and edit it but should I do a diff and submit it? Or would it be bes=
t=20
to edit the wiki?

> The rest of the documentation is in a Drupal wiki, and can be edited.
> You may need a user account.
>
> >  I got the tools built and running bitbake 1.8.10 and pulled
> >  org.openembedded.dev branch. I tried to build both nano and helloworld
> > and couldn't get pass the following error. I have chosen the
> > generic-uclibc DISTRO for starters.
>
> Try the angstrom distro first, as I don't think generic is currently
> maintained.  Sigh -- the OeFaq page has been spammed :-(

Would it be better to stick to one distro for the documentation? I think th=
at=20
would be best. Having said that, would Angstrom be the best place to start?=
=20
I was looking for a simple distro to start with and I thought Angstrom migh=
t=20
be a bit bulky. I'll use which ever the suggested one it.=20

> This older page will tell you how to set Angstrom to uclibc until I
> figure out how to restore the correct page.
> http://www.openembedded.org/node/28/diff/964/1042




--nextPart24635690.W3Ii7BJxZI
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8Q8p2sS31XKVICURAjpJAKCCJermPTEHNyz82tQAzKcls0HF3ACeJ1lk
6FMCSAmVFZ4GcpSvVob0zTQ=
=Orvr
-----END PGP SIGNATURE-----

--nextPart24635690.W3Ii7BJxZI--
