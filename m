Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KvnqZ-000867-85
	for openembedded-devel@openembedded.org; Fri, 31 Oct 2008 07:51:03 +0100
Received: (qmail 3287 invoked by uid 813007); 31 Oct 2008 06:49:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 31 Oct 2008 06:49:57 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Oct 2008 07:49:53 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <20081031013837.F2AD4189330@amethyst.openembedded.net>
In-Reply-To: <20081031013837.F2AD4189330@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200810310749.55874.openembedded@haerwu.biz>
Subject: Re: [oe-commits] Carsten Haitzler (Raster) : qemu: seems the move to the svn rev of qemu broke as there are compiler bugs
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
X-List-Received-Date: Fri, 31 Oct 2008 06:51:03 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46riday 31 of October 2008 02:38:37 GIT User account napisa=C5=82(a):
> Module: openembedded.git
> Branch: raster1
> Commit: c41413ec40d22cc123eb63e2adb9676a3879094d
> URL:  =20
> http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3Dc4141=
3e
>c40d22cc123eb63e2adb9676a3879094d
>
> Author: Carsten Haitzler (Raster) <raster@rasterman.com>
> Date:   Thu Oct 30 23:23:16 2008 +1100
>
> qemu: seems the move to the svn rev of qemu broke as there are
> compiler bugs
>
> svn qemu has compiler bugs and wont build (on ubuntu hardy), so rever
> back to the old 0.9.1 that works.

Can you send me error output? I built that qemu version on Ubuntu 8.04=20
many times.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




