Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M0A0l-0003p5-Md
	for openembedded-devel@openembedded.org; Sat, 02 May 2009 09:51:51 +0200
Received: (qmail 932 invoked by uid 813007); 2 May 2009 07:46:17 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 May 2009 07:46:17 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 2 May 2009 09:45:50 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <49FAE94F.2090101@doredevelopment.dk>
In-Reply-To: <49FAE94F.2090101@doredevelopment.dk>
MIME-Version: 1.0
Message-Id: <200905020946.08201.marcin@juszkiewicz.com.pl>
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Sat, 02 May 2009 07:51:51 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=C4=85tek, 1 maja 2009 o 14:21:35 Martin Lund napisa=C5=82(a):
> The "Micro" distribution/image is created because we feel that there
> is a need for a truly tiny and clean distro and image definition in
> OE for those users out there that needs a very tiny Linux rootfs with
> virtually nothing installed except busybox, libc, udev, and a few
> init scripts. On arm the jffs2 image size is only 1 MB (uclibc
> based). No bloat allowed.

You already mentioned that you have a bloat in that image - udev is not=20
required as busybox-mdev can also populate /dev/ with nodes.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




