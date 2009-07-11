Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MPXEZ-0006VU-C4
	for openembedded-devel@openembedded.org; Sat, 11 Jul 2009 09:42:59 +0200
Received: (qmail 32591 invoked by uid 813007); 11 Jul 2009 07:30:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 11 Jul 2009 07:30:02 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 11 Jul 2009 09:29:53 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <1247272621-26730-1-git-send-email-msmith@cbnco.com>
	<1247272621-26730-3-git-send-email-msmith@cbnco.com>
	<h39dju$tfg$1@ger.gmane.org>
In-Reply-To: <h39dju$tfg$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200907110929.56270.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 3/4] hicolor-icon-theme: don't inherit gnome
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
X-List-Received-Date: Sat, 11 Jul 2009 07:42:59 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 11 lipca 2009 o 09:05:34 Koen Kooi napisa=C5=82(a):
> On 11-07-09 02:37, Michael Smith wrote:
> > inherit autotools instead, so the theme doesn't end up depending
> > on gconf and gnome-common.
>
> NAK, it's dragging gnome for gtk-icon-cache.bbclass to update the
> theme cache files, your change would break that.

So maybe it should inherit autotools and gtk-icon-cache?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




