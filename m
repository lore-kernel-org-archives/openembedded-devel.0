Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N4t2v-0004tX-JK
	for openembedded-devel@openembedded.org; Mon, 02 Nov 2009 10:17:56 +0100
Received: (qmail 9657 invoked by uid 813007); 2 Nov 2009 09:16:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Nov 2009 09:16:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 10:19:59 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3-00052-g0eca52a; KDE/4.3.2; x86_64; ;
	)
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
	<200911020306.33189.holger+oe@freyther.de>
In-Reply-To: <200911020306.33189.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200911021019.59822.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 09:17:57 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 2 listopada 2009 o 03:06:33 Holger Hans Peter Freyt=
her=20
napisa=C5=82(a):

> the problem with archivename there is no gurantee that the name will be
> globally unique. E.g. with Open Palmtop Integreated Environment (OPIE) One
> Password.. (OPIE) there was a clash and we might or might not have had a
>  clash in release versions too...

So far we have nearly 9k entries and no repeated names. When we will get su=
ch=20
one then we can keep URLs for them as keys instead of archive names. OE=20
supports both situations (my scripts not).

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




