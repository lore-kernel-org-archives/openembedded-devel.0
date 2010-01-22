Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NYFV5-0002Lo-7w
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:08:22 +0100
Received: (qmail 10693 invoked by uid 813007); 22 Jan 2010 09:06:03 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jan 2010 09:06:03 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 10:05:57 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <> <1264150556-8147-1-git-send-email-camelguo@gmail.com>
In-Reply-To: <1264150556-8147-1-git-send-email-camelguo@gmail.com>
MIME-Version: 1.0
Message-Id: <201001221005.57787.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix a bug of COMPATIBLE_HOST defination in linux-sun4cdm_*.bb
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
X-List-Received-Date: Fri, 22 Jan 2010 09:08:22 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 22 stycznia 2010 o 09:55:56 Guo Hongruan napisa=C5=82(a):
> * Correct the defination of COMPATIBLE_HOST in linux-sun4cdm_2.4.26.bb and
>  linux-sun4cdm_2.6.8.1.bb, the previous defination causes linux-sun4cdm
>  never been selected.

Next time please read commit policy. I pushed that change.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




