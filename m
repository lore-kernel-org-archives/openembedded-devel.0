Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lwz9V-0004Ig-Vv
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 15:39:46 +0200
Received: (qmail 30738 invoked by uid 813007); 23 Apr 2009 13:35:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 13:35:07 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 15:34:57 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF772@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF772@hiob.intern.dresearch.de>
MIME-Version: 1.0
Message-Id: <200904231534.57945.marcin@juszkiewicz.com.pl>
Subject: Re: patch file duplicates
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
X-List-Received-Date: Thu, 23 Apr 2009 13:39:46 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 23 kwietnia 2009 o 15:21:26 Sledz, Steffen napisa=C5=82(a):
> Is there a way to avoid patch file duplicates in the oe tree?
>
> E.g.
>   recipes/linux/linux-2.6.24/powerpc-clockres.patch
>   recipes/linux/linux-rt-2.6.24/powerpc-clockres.patch

Move recipes/linux/linux-2.6.24/powerpc-clockres.patch to=20
recipes/linux/files/2.6.24-powerpc-clockres.patch then remove second one=20
and adapt recipes for new name.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




