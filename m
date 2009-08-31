Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Mi7c2-0007S4-BS
	for openembedded-devel@openembedded.org; Mon, 31 Aug 2009 16:12:03 +0200
Received: (qmail 12469 invoked by uid 813007); 31 Aug 2009 13:53:31 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 31 Aug 2009 13:53:31 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2009 15:53:25 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc6-00243-g53bc5c0; KDE/4.3.0; x86_64; ;
	)
References: <a63ecaf0908310519p3bc80147q6ad2d89e4c587d@mail.gmail.com>
In-Reply-To: <a63ecaf0908310519p3bc80147q6ad2d89e4c587d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908311553.26539.marcin@juszkiewicz.com.pl>
Subject: Re: Xorg int10 module missing?
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
X-List-Received-Date: Mon, 31 Aug 2009 14:12:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 31 sierpnia 2009 o 14:19:40 Sushi Sensei napisa=C5=
=82(a):
> I'm trying to use cirrus driver but I can't load int10 and xaa
> driver vesa also depends of xserver-xorg-module-libint10 but I can' find
> this!!

They are build as part of xserver-xorg recipe.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




