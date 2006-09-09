Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GM1s6-0004s6-1m
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 14:23:42 +0200
Received: by py-out-1112.google.com with SMTP id i75so1150006pye
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Sep 2006 05:20:33 -0700 (PDT)
Received: by 10.35.90.20 with SMTP id s20mr4821559pyl;
	Sat, 09 Sep 2006 05:20:33 -0700 (PDT)
Received: from CUBE ( [82.193.96.237])
	by mx.gmail.com with ESMTP id m1sm3076148nzf.2006.09.09.05.20.32;
	Sat, 09 Sep 2006 05:20:33 -0700 (PDT)
Date: Sat, 9 Sep 2006 15:20:31 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <597749586.20060909152031@gmail.com>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>, 
	Jamie Lenehan <lenehan@twibble.org>
In-Reply-To: <45028D5D.4020906@dominion.kabel.utwente.nl>
References: <E1GGZOX-0002WU-1s@linuxtogo.org>
	<20060827233927.GA9807@twibble.org>
	<200608281147.01329.openembedded@hrw.one.pl>
	<20060829011415.GA31668@twibble.org>
	<20060829011808.GB31668@twibble.org>
	<45028D5D.4020906@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Section list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2006 12:23:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Saturday, September 9, 2006, 12:46:05 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Jamie Lenehan schreef:
>> Updated list, including your changes:

> <list>

> Don't forget to mention that you added it do the usermanual:
> http://www.openembedded.org/user-manual&dpage=ch07s09 :)


  ... And I just wanted to write that it would be nice to add the
proposed list to http://www.openembedded.org/wiki/Policies . Maybe
it's better to let it stay for some time as RFC before adding to
the documentation? Organizing a good taxonomy is not an easy task,
would need some testing on existing package base, and even after that,
it's probably good idea to be prepared to refactors of it.

  Last week, I myself went thru few recipes to add/tweak SECTIONs for
them, and there already were few questions.

  One good example, is that ignorant user part of me is a bit
concerned with x11 section being so broard, with an SDL game, ye olde
MOTIF app and contemporary GNOME/GTK+ app would go into it. That
loses a bit deal of descreptivism. I know, that such taxonomy is
(wonder if there will be chance to say "was") pretty common, and I'm
afraid I don't have elegant proposal for split up. But my ignorant
user part, not concerned with formal correctness, but rather
with pragmatic convenience, says, that there might be possible to have
a "gnome" section (warning: do not mix with GNOME/Gnome ;-) ) for apps
written using contemporary GUI toolkit, like (and mostly) GTK+.

  So, is there any rational idea in that or should my ignorant user
part just shut up?


  Either way, as mood permits, I'm going to continue monkey's job of
applying SECTIONs, based on the list proposed. Just in case, I in
advance apoligize if my selections won't be every time 100% perfect -
as I told, we just should accept this as an iterative process. The
initial aim would be to offload default "base" section off stuff which
easily can be put elsewhere.

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



