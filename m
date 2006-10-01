Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GU1Mc-0000MM-EY for openembedded-devel@lists.openembedded.org;
	Sun, 01 Oct 2006 15:28:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 16B1FBB4;
	Sun,  1 Oct 2006 15:22:57 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 16215-09; Sun,  1 Oct 2006 15:22:53 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 46942BAD;
	Sun,  1 Oct 2006 15:22:53 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: =?UTF-8?Q?=E9=BB=84_=E5=8B=87?= <hakehuang@hotmail.com>
In-Reply-To: <1159708594.6791.53.camel@gandalf.tm.informatik.uni-frankfurt.de>
References: <BAY112-F21A1A41405810A5DE63282BD1E0@phx.gbl>
	<1159708594.6791.53.camel@gandalf.tm.informatik.uni-frankfurt.de>
Organization: VanilleMedia
Date: Sun, 01 Oct 2006 15:22:53 +0200
Message-Id: <1159708973.6791.55.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: problem with OE build amd db1200
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Oct 2006 13:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 01.10.2006, 15:16 +0200 schrieb Michael 'Mickey' Lauer:
> Forwarding this to the correct list.
>=20
> Am Sonntag, den 01.10.2006, 17:25 +0800 schrieb =E9=BB=84 =E5=8B=87:
> > Hi all,
> >=20
> > I am trying to make db1200 using OE but ....
> >=20
> > /tmp/work/glibc-2.3.5+cvs20050627-r0/build-arm-linux/bits/stdio_lim.h=
T=20
> > | In file included from ./bits/types.h:28,=20
> > | from ./posix/sys/types.h:31,=20
> > | from include/sys/types.h:1,=20
> > | from misc/sys/uio.h:24,=20
> > | from <stdin>:3:=20
> > | ./bits/wordsize.h:1:2: #error "This file must be written based on t=
he=20
> > data type sizes of the target"=20
> > | In file included from ./posix/sys/types.h:31,=20
> > | from include/sys/types.h:1,=20
> > | from misc/sys/uio.h:24,=20
> > | from <stdin>:3:=20
> > | ./bits/types.h:132:3: #error=20
> > | In file included from ./string/endian.h:37,=20
> > | from include/endian.h:1,=20
> > | from ./posix/sys/types.h:213,=20
> > | from include/sys/types.h:1,=20
> > | from misc/sys/uio.h:24,=20
> > | from <stdin>:3:=20
> > | ./bits/endian.h:13:2: #error Machine byte order unknown.=20
> > | make[1]: ***=20
> > [/usr/.home/cyrus/development/build/tmp/work/glibc-2.3.5+cvs20050627-=
r0/build-arm-linux/bits/stdio_lim.st]=20
> > Error 1=20
> > | make[1]: Leaving directory=20
> > `/usr/.home/cyrus/development/build/tmp/work/glibc-2.3.5+cvs20050627-=
r0/libc'=20
> >=20
> > | make: *** [all] Error 2=20
> > | FATAL: oe_runmake failed=20
> >=20
> >=20
> >=20
> > Any one can help me? Thanks a lot
> >=20
> > _________________________________________________________________
> > =E4=B8=8E=E8=81=94=E6=9C=BA=E7=9A=84=E6=9C=8B=E5=8F=8B=E8=BF=9B=E8=A1=
=8C=E4=BA=A4=E6=B5=81=EF=BC=8C=E8=AF=B7=E4=BD=BF=E7=94=A8 MSN Messenger: =
 http://messenger.msn.com/cn =20
> >=20
> > _______________________________________________
> > Oe mailing list
> > Oe@handhelds.org
> > https://www.handhelds.org/mailman/listinfo/oe
--=20
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




