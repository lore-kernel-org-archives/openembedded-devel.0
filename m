Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LpJgP-0005GH-VD
	for openembedded-devel@openembedded.org; Thu, 02 Apr 2009 11:58:07 +0200
Received: (qmail 31804 invoked by uid 813007); 2 Apr 2009 09:55:37 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 2 Apr 2009 09:55:37 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 2 Apr 2009 11:55:41 +0200
User-Agent: KMail/1.11.0 (Linux/2.6.29; KDE/4.2.1; x86_64; ; )
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<49D276F0.2060701@gmx.net>
In-Reply-To: <49D276F0.2060701@gmx.net>
MIME-Version: 1.0
Message-Id: <200904021155.42500.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Thu, 02 Apr 2009 09:58:07 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 31 marca 2009 o 22:02:56 Robert Schuster napisa=C5=82(a):
> is it possible/allowed to port things into the stable which IMO make
> its maintenance easier? E.g. I've just cleaned up the llvm recipes
> and made them side by side installable (multiple version). The stable
> branch would be more of a burden when these things differ so much
> from each other.

Read http://wiki.openembedded.net/index.php/Stable#Dealing_with_changes=20
and provide patches.

> Apart from that llvm is not used from anything but the llvm-gcc
> recipes which I saw and which look not inspiring confidence.

> Last but not least I was going to base the Jalimo recipes on that and
> then finally move them into OE.

As long as your changes will also land in .dev (in same of different=20
versions due to differences between .dev/stable) it will be ok.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




