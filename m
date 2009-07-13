Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MQQ7B-0002y9-0T
	for openembedded-devel@openembedded.org; Mon, 13 Jul 2009 20:19:01 +0200
Received: (qmail 1450 invoked by uid 813007); 13 Jul 2009 18:05:48 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Jul 2009 18:05:48 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jul 2009 20:05:08 +0200
User-Agent: KMail/1.11.4 (Linux/2.6.31-rc1-00272-g404d6df; KDE/4.2.4; x86_64; ;
	)
References: <E1MQNDW-0007ur-Rm@melo.openembedded.org>
In-Reply-To: <E1MQNDW-0007ur-Rm@melo.openembedded.org>
MIME-Version: 1.0
Message-Id: <200907132005.09088.marcin@juszkiewicz.com.pl>
Subject: Re: [oe-commits] Marco Cavallini : Added linux version recipes/linux/linux-2.6. 29 for taskit Stamp9G20 Evaluation Board
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
X-List-Received-Date: Mon, 13 Jul 2009 18:19:01 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 13 lipca 2009 o 17:13:22 git version control=20
napisa=C5=82(a):

> Author: Marco Cavallini <m.cavallini@koansoftware.com>
> Date:   Mon Jul 13 17:12:49 2009 +0200
>
> Added linux version recipes/linux/linux-2.6.29 for taskit Stamp9G20
> Evaluation Board=20
> * based on a patch from http://www.armbedded.eu/documentation

> Author: Marco Cavallini <m.cavallini@koansoftware.com>
> Date:   Mon Jul 13 17:09:02 2009 +0200
>
> Added linux version recipes/linux/linux_2.6.29.bb for taskit Stamp9G20
> Evaluation Board=20
>  * based on a patch from http://www.armbedded.eu/documentation=20
>  * bump PR

Please read CommitPolicy in wiki - first line of commit is summary and=20
should fit in 7x chars (weekly changelog script cuts at 78 chars) and=20
next lines are used for description. Also those two changes should be=20
squashed into one ("git rebase -i origin" would be useful command for=20
next patch set).

So commit would be better in this style:

linux: added taskit Stamp9G20 board support in 2.6.29
 * based on a patch from http://www.armbedded.eu/documentation=20

And as this is new machine which do not change others bumping of PR is=20
not necessary.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




