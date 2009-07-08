Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MOTVO-00058P-0M
	for openembedded-devel@openembedded.org; Wed, 08 Jul 2009 11:31:58 +0200
Received: (qmail 694 invoked by uid 813007); 8 Jul 2009 09:19:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 8 Jul 2009 09:19:19 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 8 Jul 2009 11:19:05 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
In-Reply-To: <022254FBC8645942BBF88A022862CDD33C60BA@3putt.int.lantronix.com>
MIME-Version: 1.0
Message-Id: <200907081119.06148.marcin@juszkiewicz.com.pl>
Subject: Re: How does OE determine the kernel version that gets build?
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
X-List-Received-Date: Wed, 08 Jul 2009 09:31:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 8 lipca 2009 o 00:13:56 Lars Holowko napisa=C5=82(a):
> Now I want to switch to a 2.6.30 kernel (for better wireless support)
> but bitbake linux or bitbake console-image always builds 2.6.28
> instead. I copied a defconfig to
> recipies/linux/linux-2.6.30/at91sam9g20ek, copied the AT91 patches
> for 2.6.30 in its place and added a
> DEFAULT_PREFERENCE_at91sam9g20ek =3D "30" line to
> recipies/linux/linux_2.6.30.bb hoping to make the 2.6.30 kernel
> active.

I will work on updating Atmel devboards to 2.6.30 this week. Thanks for=20
information that 2.6.30-at91 is already present.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




