Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3poI-0002Ve-Ql
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 13:06:11 +0200
Received: (qmail 31319 invoked by uid 813007); 12 May 2009 10:59:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 10:59:32 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 12:58:51 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1242089668-11610-1-git-send-email-denis@denix.org>
	<1242089668-11610-2-git-send-email-denis@denix.org>
In-Reply-To: <1242089668-11610-2-git-send-email-denis@denix.org>
MIME-Version: 1.0
Message-Id: <200905121258.56395.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 1/8] davinci.inc: add common DaVinci machine configuration
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
X-List-Received-Date: Tue, 12 May 2009 11:06:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 12 maja 2009 o 02:54:21 Denys Dmytriyenko napisa=C5=82(a):
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  conf/machine/include/davinci.inc |   24 ++++++++++++++++++++++++
>  1 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/include/davinci.inc
>
> diff --git a/conf/machine/include/davinci.inc
> b/conf/machine/include/davinci.inc new file mode 100644
> index 0000000..1f688f4
> --- /dev/null
> +++ b/conf/machine/include/davinci.inc

> +HOTPLUG =3D "udev"

Is this really required in machine config?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




