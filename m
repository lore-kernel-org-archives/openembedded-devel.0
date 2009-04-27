Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LyMZF-0000l3-2P
	for openembedded-devel@openembedded.org; Mon, 27 Apr 2009 10:52:06 +0200
Received: (qmail 30506 invoked by uid 813007); 27 Apr 2009 08:46:58 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 27 Apr 2009 08:46:58 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2009 10:46:29 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <gsst4a$cvj$1@ger.gmane.org>
	<200904252318.18413.marcin@juszkiewicz.com.pl>
	<gt19e9$u1e$1@ger.gmane.org>
In-Reply-To: <gt19e9$u1e$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904271046.30672.marcin@juszkiewicz.com.pl>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Mon, 27 Apr 2009 08:52:22 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 26 kwietnia 2009 o 11:27:36 Koen Kooi napisa=C5=82(a):
> On 25-04-09 23:18, Marcin Juszkiewicz wrote:
> >> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/&id=3D
> >> 8101ad8e1229b3b9f8aa0be0fdc262b5283034d0
> >
> > This one looks quite sane.
>
> Maybe if you use debian.bbclass, if you don't -> broken upgrade paths

Ah, right - I am too used to debian.bbclass being in use...

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




