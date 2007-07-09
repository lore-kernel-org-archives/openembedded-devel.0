Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1I7uzO-0007J5-Hd
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 17:17:26 +0200
Received: (qmail 10612 invoked by uid 813007); 9 Jul 2007 15:11:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 9 Jul 2007 15:11:51 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 9 Jul 2007 17:11:48 +0200
User-Agent: KMail/1.9.7
References: <513012886.20070708041151@gmail.com>
	<20070709140338.GE2336@p3n3tr4t0r.internal>
	<15110327374.20070709172537@gmail.com>
In-Reply-To: <15110327374.20070709172537@gmail.com>
MIME-Version: 1.0
Message-Id: <200707091711.49865.openembedded@hrw.one.pl>
Subject: Re: [RFC] Adding screen dimensions to machine configs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2007 15:17:27 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 9 lipca 2007, Paul Sokolovsky napisa=B3:
> > for spitz the screen is 480x640 by default. Deal with it in packages
> > that wish to use rotation correctly. Not just this value makes it
> > easy for my magic background generator.
>
> =A0 Maybe your generator can use fbset right away?

fbset was broken in busybox 1.6.0 so it not always can be used ;(

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Fear leads to anger, anger leads to hate, hate... leads to suffering.
   		-- Yoda




