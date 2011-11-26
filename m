Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1RU9NE-0005sp-V9
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 04:56:21 +0100
Received: from trisquel.localnet (80.116.58.40) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 4ECA5ECD002C1985; Sat, 26 Nov 2011 04:49:45 +0100
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Nov 2011 04:49:45 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-12-generic; KDE/4.6.5; x86_64; ; )
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<4ECD76E2.3040001@opendreambox.org>
	<CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
In-Reply-To: <CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201111260449.45351.GNUtoo@no-log.org>
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 03:56:21 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>If we're wrong,
>someone needs to tell us what's missing.
A lot of recipes are missing in the new core-based oe

>We've now finally reached the point where it's really
>just mechanical "migrate recipes A/B/C" (and not to trivialize these
>efforts!).
What about recipes that have patches without the correct header?
Migrating the patches to the new core-based oe may be trivial, but in order to 
be able to submit them you need to have the correct patch headers, right?

Some recipes are kept in the contrib/shr branches because of that issue.

I was thinking of a kernel-like staging area for recipes of bad quality. (for 
instance that lack the correct patch headers) so porting a big recipe like 
mplayer1 would not be a one-person effort anymore.

Or are the recipes with multiples patches lacking the correct headers not so 
common?

Denis.


