Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NnC9C-00066U-CM
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 15:35:35 +0100
Received: (qmail 28736 invoked by uid 813007); 4 Mar 2010 14:32:40 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 4 Mar 2010 14:32:40 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 4 Mar 2010 15:32:22 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc7-00064-gac73fdd; KDE/4.3.4; x86_64; ;
	)
References: <1265832780-19939-1-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201003041532.23523.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 7/8] autoconf: add 2.65
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
X-List-Received-Date: Thu, 04 Mar 2010 14:35:35 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia =C5=9Broda, 10 lutego 2010 o 21:12:59 Bernhard Reutner-Fischer napisa=
=C5=82(a):
> xz needs >=3D 2.64
> Also add patches to recognize BusyBox versions of programs.
> Add patch for gettext-0.17 to nop out m4_copy on autoconf > 2.63
=20
Can you update that changeset?

Also please split it to 1. autoconf 2. gettext - will be more readable.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




