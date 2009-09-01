Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MiLzd-0005ZC-Km
	for openembedded-devel@openembedded.org; Tue, 01 Sep 2009 07:33:21 +0200
Received: (qmail 21155 invoked by uid 813007); 1 Sep 2009 05:14:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Sep 2009 05:14:46 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Sep 2009 07:14:18 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <E1MiFtX-0004bk-4A@melo.openembedded.org>
In-Reply-To: <E1MiFtX-0004bk-4A@melo.openembedded.org>
MIME-Version: 1.0
Message-Id: <200909010714.39790.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Florian Boor : xserver-common: add 1.31
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
X-List-Received-Date: Tue, 01 Sep 2009 05:33:22 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 1 wrze=C5=9Bnia 2009 o 01:02:39 git version control napisa=C5=
=82(a):
> Branch: org.openembedded.dev
> Commit: a8b95ab31b0fddb90ef9279c5436cc568d58b6e7
> URL: =20
>  http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3Da8b9=
5ab31b0f
>ddb90ef9279c5436cc568d58b6e7
>
> Author: Florian Boor <florian.boor@kernelconcepts.de>
> Date:   Wed Aug 26 12:23:57 2009 +0200
>
> xserver-common: add 1.31

Please use 1.30 recipe instead of 1.31. Why?

I started changing xserver-common some time ago to merge xserver-kdrive-com=
mon=20
into it (so we will be able to drop it). First set of my patches landed in =
GPE=20
repository and 1.30 was released. It does not work without one patch anyway=
 so=20
I added that patch into 1.30 recipe. Then I continued hacking xserver-commo=
n.=20
Next batch of patches landed in GPE and 1.31 was released. But as there was=
 no=20
recipe for it in OE (for me 1.30 recipe was enough) I used 1.30 as base sti=
ll.=20
Now 1.30 recipe is more advanced then 1.31 one but I hope that those patche=
s=20
will also land in GPE so 1.32 will be released and we will then drop 1.30 a=
nd=20
1.31 recipes.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




