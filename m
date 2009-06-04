Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MCIuo-0000qx-FT
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 21:47:54 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 4 Jun 2009 21:38:47 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 4 Jun 2009 21:38:47 +0200
Received: from [192.168.1.166] ([80.117.37.182]) by FBCMCL01B08.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 4 Jun 2009 21:38:46 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
Date: Thu, 04 Jun 2009 21:38:40 +0200
Message-Id: <1244144325.6678.0.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 04 Jun 2009 19:38:47.0233 (UTC)
	FILETIME=[13FC0B10:01C9E54C]
Subject: Re: How to convert OE hardware platform from ARM into X86
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
X-List-Received-Date: Thu, 04 Jun 2009 19:47:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-06-01 at 18:39 +0800, =E5=88=98=E8=8A=B3=E5=8D=8E wrote:
> Hi!
>=20
> I need to convert OE hardware platform from ARM into X86,but I don't know=
 the correct step, I tried as follows:
>       Change the contents of file  ~/stuff/build/conf/local.conf, the cha=
nges are:
>                            MACHINE =3D "i586-generic";
>                            #TARGET_ARCH =3D "arm"
>                            TARGET_OS =3D "linux"
> then, build ,but a error occured:
>   ERROR: Build of /home/build/stuff/openembedded/packages/xorg-lib/libx11=
_1.2.1.bb do_compile failed
>   ERROR: Task 3164 (/home/build/stuff/openembedded/packages/xorg-lib/libx=
11_1.2.1.bb, do_compile) failed
we need more info on the build error
such as the log of the build
Denis.




