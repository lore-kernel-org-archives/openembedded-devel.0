Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LOHqu-0007nI-2F
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 21:33:08 +0100
Received: (qmail 13954 invoked by uid 813007); 17 Jan 2009 20:26:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Jan 2009 20:26:18 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Jan 2009 21:26:10 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <20090117175209.1ABE7188463@amethyst.openembedded.net>
In-Reply-To: <20090117175209.1ABE7188463@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200901172126.10851.openembedded@haerwu.biz>
Subject: Re: [oe-commits] Tim 'timtim' Ellis : dns323: Add machine config for D-Link DNS-323, another Orion based NAS
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
X-List-Received-Date: Sat, 17 Jan 2009 20:33:08 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Saturday 17 of January 2009 18:52:06 GIT User account wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 33172ddea53386be40b4177fce3dcdee4456e209
> URL: =A0
> =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcommit;h=3D33=
172d
>dea53386be40b4177fce3dcdee4456e209
>
> Author: Tim 'timtim' Ellis <tim.ellis@foonas.org>
> Date: =A0 Sat Jan 17 17:50:54 2009 +0000

> diff --git a/conf/machine/dns323.conf b/conf/machine/dns323.conf

> +MACHINE_EXTRA_RDEPENDS =A0 =A0 =A0 =A0 =A0=3D "u-boot-utils"

Can you add 'uboot' into MACHINE_FEATURES and add 'u-boot-utils' into=20
proper part of 'task-base' recipe? Other devices with u-boot would be=20
able to get this package too.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




