Received: from host4.kei.pl ([94.152.8.4] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1PkCO0-0005iL-ER
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 10:18:56 +0100
Received: (qmail 10060 invoked by uid 2404007); 1 Feb 2011 09:18:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89-73-120-20.dynamic.chello.pl (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@89.73.120.20)
	by host4.kei.pl with ESMTPA; 1 Feb 2011 09:18:04 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 1 Feb 2011 10:18:00 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.37-12-generic; KDE/4.6.0; x86_64; ; )
References: <1296508688-5770-1-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-3-git-send-email-ulf.samuelsson@atmel.com>
	<1296508688-5770-4-git-send-email-ulf.samuelsson@atmel.com>
In-Reply-To: <1296508688-5770-4-git-send-email-ulf.samuelsson@atmel.com>
MIME-Version: 1.0
Message-Id: <201102011018.00657.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH v3 04/08] Add X arguments for AT91 boards
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
X-List-Received-Date: Tue, 01 Feb 2011 09:18:56 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 31 stycznia 2011 o 22:18:04 Ulf Samuelsson napisa=
=C5=82(a):
> * CAP9
> * SAM9RL
> * SAM9G10
> * SAM9M10
> * SAM9G45

> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
> ---
>  .../files/xserver-common-at91sam9.patch            |   18

With Xserver-common 1.33 you do not have to patch /etc/X11/Xserver file. Th=
ere=20
is a support for /etc/default/xserver which can keep board settings. I adde=
d=20
that long time ago.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz


