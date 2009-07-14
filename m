Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MQhVZ-0008BD-2f
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 14:53:21 +0200
Received: (qmail 25050 invoked by uid 813007); 14 Jul 2009 12:40:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 14 Jul 2009 12:40:03 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jul 2009 14:39:09 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <4A41C00B.3030409@tait.co.nz> <20090629174435.GD5905@denix.org>
	<h2dknm$t4n$1@ger.gmane.org>
In-Reply-To: <h2dknm$t4n$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200907141439.12585.marcin@juszkiewicz.com.pl>
Subject: Re: [STABLE][PATCH] /etc/profile: stricter root PATH - require absolute pathname for bins in cwd
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
X-List-Received-Date: Tue, 14 Jul 2009 12:53:21 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 30 czerwca 2009 o 20:15:18 Koen Kooi napisa=C5=82(a):
> On 29-06-09 19:44, Denys Dmytriyenko wrote:
> > On Wed, Jun 24, 2009 at 06:23:57PM -0400, Denys Dmytriyenko wrote:
> >> Having current directory (either '.' or empty string) in PATH is
> >> considered dangerous for root.
> >>
> >> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
> >> Acked-by: Phil Blundell<philb@gnu.org>
> >> Acked-by: Koen Kooi<koen@openembedded.org>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




