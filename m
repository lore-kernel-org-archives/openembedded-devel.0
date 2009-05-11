Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3WTi-00044L-DG
	for openembedded-devel@openembedded.org; Mon, 11 May 2009 16:27:38 +0200
Received: (qmail 30420 invoked by uid 813007); 11 May 2009 14:21:06 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 11 May 2009 14:21:06 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2009 16:20:38 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <d1b08f940905110120t2a2162a6rbc2bd7237b2df09e@mail.gmail.com>
In-Reply-To: <d1b08f940905110120t2a2162a6rbc2bd7237b2df09e@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905111620.39699.marcin@juszkiewicz.com.pl>
Subject: Re: locale_base_ar_kw
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
X-List-Received-Date: Mon, 11 May 2009 14:27:38 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 11 maja 2009 o 10:20:45 Andrea Adami napisa=C5=82(a=
):
> Inspecting the .dot files I discovered in my recent builds locale
> base is ar_KW. I did not know the new default locale is Arabic for
> Kuwait...

It is not default locale... this package contains files which had to be=20
in libc6 package... So it is *critical* level of bug.

> Not yet found out if it's angstrom-specific issue, will test.


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




