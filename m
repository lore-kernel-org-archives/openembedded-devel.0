Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1Jh4Dc-00061o-H4
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Apr 2008 16:45:41 +0200
Received: by an-out-0708.google.com with SMTP id b33so691980ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Apr 2008 07:45:31 -0700 (PDT)
Received: by 10.100.214.16 with SMTP id m16mr22808499ang.101.1207147531362;
	Wed, 02 Apr 2008 07:45:31 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 6sm2120127agd.23.2008.04.02.07.45.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Apr 2008 07:45:30 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 2 Apr 2008 08:45:05 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804020845.22135.e.robertson.svg@gmail.com>
Subject: usermanual
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
X-List-Received-Date: Wed, 02 Apr 2008 14:45:41 -0000
X-Groupsio-MsgNum: 4897
Content-Type: multipart/signed; boundary="nextPart2905302.dKj9WS74Qn";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2905302.dKj9WS74Qn
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi all,
I'm attempting to take on the task to update and add to the user manual bei=
ng=20
a newcomer. Naturally their are sections in the manual that are a beyond me=
=20
at this point but I will ask questions along the line to solicit materials =
so=20
feel free to add any other useful into I can use. Hopefully I didn't take o=
n=20
more than I can chew :).

Section 3.4 (Building Software) I would like to build the helloworld packag=
e.
This would mean talking about modifying the local.conf file explained in=20
section 5.5.3.2. However, after reading through this section I realize this=
=20
is outdated as several configurations have moved to their own files (like=20
MACHINE for example). This would need updating and I would also suggest=20
moving the local.conf from section 5.5.3.2 to section 3.4. Any suggestions?
If their are other sources that talked about this file other than the wiki,=
=20
please send me the link.

Section 4.5 Overrides seem to be different from the Bitbake manual on=20
Overrides. Could someone explain what this is?

I would also like any information on Classes in Section 2.3 on how to "FIXM=
E".
Is this a bitbake thing?

Thanks.=20

--nextPart2905302.dKj9WS74Qn
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH843y2sS31XKVICURAjiBAKCUE1pQvRGGvyuFZMGjg6SUrRuvTQCePqtU
8EG07gNN4IE9JxcW/5Q/OLs=
=hajU
-----END PGP SIGNATURE-----

--nextPart2905302.dKj9WS74Qn--
