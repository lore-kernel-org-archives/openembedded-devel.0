Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Mdked-0002Gw-AJ
	for openembedded-devel@openembedded.org; Wed, 19 Aug 2009 14:52:43 +0200
Received: (qmail 4623 invoked by uid 813007); 19 Aug 2009 12:35:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO host4.kei.pl)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 19 Aug 2009 12:35:28 -0000
References: <1250515743-10823-1-git-send-email-msmith@cbnco.com><1250515743-10823-2-git-send-email-msmith@cbnco.com><1250515743-10823-3-git-send-email-msmith@cbnco.com>
	<200908171612.13311.holger+oe@freyther.de>
In-Reply-To: <200908171612.13311.holger+oe@freyther.de>
Received: from 83.22.159.1
	(Poczta WWW KEI.pl authenticated user marcin@juszkiewicz.com.pl)
	by poczta813.kei.pl with HTTP; Wed, 19 Aug 2009 14:35:28 +0200 (CEST)
Message-ID: <d57bdce1dd0da9c8c6e7caf3f9da7e3f.marcin@juszkiewicz.com.pl>
From: <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2009 14:35:28 +0200
MIME-Version: 1.0
X-Priority: 3
X-Mailer-Version: 1.0
X-Mailer: Poczta WWW KEI.pl
X-Organisation: KEI Provider
X-User-IP: 83.22.159.1
X-Http-User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10.5; pl;
	rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2
Subject: Re: [PATCH 3/3] syslinux: upgrade to 3.82 and split into a fewPackages
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
X-List-Received-Date: Wed, 19 Aug 2009 12:52:51 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Dnia Mon, 17 Aug 2009 16:12:13 +0200 napisano:

> Haha, this might sound =
weird... Could you
> write a section for our usermanual=20
> on how to us=
e syslinux?

Check classes/bootimg.bbclass for code. It was imported from=
 Poky some time ago.





