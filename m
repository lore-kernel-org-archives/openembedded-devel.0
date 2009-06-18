Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MHCiF-00061F-IT
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 10:11:11 +0200
Received: (qmail 16735 invoked by uid 813007); 18 Jun 2009 08:00:41 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Jun 2009 08:00:41 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Jun 2009 10:00:19 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.30-00002-g9396b7b; KDE/4.2.4; x86_64; ; )
References: <1245265221-19129-1-git-send-email-clarson@mvista.com>
In-Reply-To: <1245265221-19129-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200906181000.23470.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] bitbake.conf, package_ipk.bbclass: rather than including FILE in SRC_URI, move that fallback to package_ipk.
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
X-List-Received-Date: Thu, 18 Jun 2009 08:11:12 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =C5=9Broda, 17 czerwca 2009 o 21:00:21 Chris Larson napisa=C5=82(a):
>  classes/package_ipk.bbclass |    3 ++-
>  conf/bitbake.conf           |    2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

What if I use package_deb or package_rpm?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




