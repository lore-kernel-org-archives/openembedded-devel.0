Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lx2w0-0001vI-4p
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 19:42:04 +0200
Received: (qmail 1396 invoked by uid 813007); 23 Apr 2009 17:37:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 17:37:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 19:37:18 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1240504230-9936-1-git-send-email-marcin@juszkiewicz.com.pl>
	<gsq885$h7s$1@ger.gmane.org>
	<20090423173155.GB12956@smtp.west.cox.net>
In-Reply-To: <20090423173155.GB12956@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200904231937.24327.marcin@juszkiewicz.com.pl>
Subject: Re: [STABLE][PATCH 1/1] task-base: added btusb driver to list	of recommended BT drivers
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
X-List-Received-Date: Thu, 23 Apr 2009 17:42:04 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 23 kwietnia 2009 o 19:31:55 Tom Rini napisa=C5=82(a):
> >> +++ b/recipes/tasks/task-base.bb
> >> @@ -1,5 +1,5 @@
> >>   DESCRIPTION =3D "Merge machine and distro options to create a
> >> basic machine task/package" -PR =3D "r80"
> >> +PR =3D "r83"
>
> So it's OK to just jump PRs like this?  I assume in .dev there's 3
> changes made to task-base from 80 to 83, including this change.

Dev tree has r80 -> r82 jump when Raster introduced big change on how=20
splash tools work. This is not a change which was suggested for stable=20
(as it is big and not wide tested). And r83 task-base in stable/2009=20
will be same as r83 task-base from .dev after that patch.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




