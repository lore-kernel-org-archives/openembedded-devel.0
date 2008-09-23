Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Ki8vG-0002Xd-D1
	for openembedded-devel@openembedded.org; Tue, 23 Sep 2008 16:31:26 +0200
Received: (qmail 16376 invoked by uid 813007); 23 Sep 2008 14:27:53 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Sep 2008 14:27:53 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-commits@lists.openembedded.org
Date: Tue, 23 Sep 2008 16:27:53 +0200
User-Agent: KMail/1.10.0 (Linux/2.6.27-rc6; KDE/4.1.1; x86_64; ; )
References: <20080923140653.1363E18806B@amethyst.openembedded.net>
In-Reply-To: <20080923140653.1363E18806B@amethyst.openembedded.net>
MIME-Version: 1.0
Message-Id: <200809231627.54581.openembedded@haerwu.biz>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] : wesnoth 1.4.5:
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
X-List-Received-Date: Tue, 23 Sep 2008 14:31:26 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 23 of September 2008 16:06:53 OE GIT Trial wrote:
> Author: =A0<thebohemian@openembedded.org>
> Date: =A0 Tue Sep 23 13:36:09 2008 +0000
>
> wesnoth 1.4.5:
> =A0- remove --enable-lite so we can package music and sound on our own
> =A0- added wesnoth-music, wesnoth-sounds, wesnoth-all-campaigns (all
> optional) binary packages - added nice descriptions to base packages

Can you read CommitPolicy and apply to it? I see lot of commits from you=20
which are unreadable in "git shortlog" type of changelogs.

=46irst line of commit message is for summary - not only for listing=20
affected recipes.

"wesnoth: split packaging of music/sounds/campaings" would be better=20
then your version.
=2D-=20
JID: hrw@jabber.org




