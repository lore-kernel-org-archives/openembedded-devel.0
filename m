Received: from [213.39.232.198] (helo=mail.fh-wedel.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <di@fh-wedel.de>) id 1LmNaV-00067L-Bt
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 08:31:47 +0100
Received: by mail.fh-wedel.de (Postfix, from userid 959)
	id 5247D547D1; Wed, 25 Mar 2009 08:30:12 +0100 (CET)
Date: Wed, 25 Mar 2009 08:30:12 +0100
From: Martin Dietze <di@fh-wedel.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090325073012.GU20006@fh-wedel.de>
References: <20090324233009.GC9461@fh-wedel.de>
	<19c1b8a90903242057v4873c28if94f14f5631ecd6d@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90903242057v4873c28if94f14f5631ecd6d@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Strange name for cross binutils binaries
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
X-List-Received-Date: Wed, 25 Mar 2009 07:31:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, March 24, 2009, Khem Raj wrote:

> Well nylon distro is using quite old tools and I dont think anybody
> has been using
> gcc 3.3 binutils 2.14 and glibc 2.3.3 combo.
>=20
> Thats your problem. Now if you can help in testing this distro I can
> certainly put new toolchain in
> but that could mean more changes.

Yes I can. Actually I am in the progress of getting nylon to run
again with the current OE toolchain (after leaving 4G I did not
even have my own cube, but this has changed now).

Now just to simplify things for me, can you give me one or two
more hints - I can't believe that "mipsel-linux-mipsel-ar" is
right, or is it? I.e., is the name under which it is installed
from binutils wrong or does gcc-cross-initial look for it under
the wrong name?

Cheers,

Martin

--=20
----------- / http://herbert.the-little-red-haired-girl.org / -----------=
--
=3D+=3D=20
Nachts wache ich schwei=DFgebadet auf, weil OE-begeisterte Newbies mit Bi=
ll=20
Gates hinterm Newsserver Schwarze Messen feiern, und auch mein Psychologe=
=20
ist schon total ratlos. Ich habe einfach fertig.  -- anonymer Troll in ds=
nu


