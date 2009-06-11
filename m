Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MEm8P-0007fs-0U
	for openembedded-devel@openembedded.org; Thu, 11 Jun 2009 17:24:09 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5BFE4GB028629 for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 16:14:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Gp9myEowJ5G1 for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 16:14:04 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5BFE1X9028590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 11 Jun 2009 16:14:03 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: OE-Devel <openembedded-devel@openembedded.org>
Date: Thu, 11 Jun 2009 16:12:56 +0100
Message-Id: <1244733177.6018.35.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [Fwd: [poky] Packaged Staging Improvements]
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
X-List-Received-Date: Thu, 11 Jun 2009 15:24:10 -0000
X-Groupsio-MsgNum: 11227
Content-Type: multipart/mixed; boundary="=-RxQknHo35vCAgh8z+uyE"

--=-RxQknHo35vCAgh8z+uyE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Forwarding this as there is problem some interest here too...


--=-RxQknHo35vCAgh8z+uyE
Content-Disposition: inline
Content-Description: Forwarded message - [poky] Packaged Staging
	Improvements
Content-Type: message/rfc822

Return-Path: <richard@o-hand.com>
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.4
Received: from localhost (dan.rpsys.net [127.0.0.1]) by dan.rpsys.net
	(8.14.2/8.14.2/Debian-2build1) with ESMTP id n5BExhc2027124 for
	<o-hand@[127.0.0.1]>; Thu, 11 Jun 2009 15:59:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1]) by localhost (dan.rpsys.net
	[127.0.0.1]) (amavisd-new, port 10024) with LMTP id z9HOY6jX20ko for
	<o-hand@[127.0.0.1]>; Thu, 11 Jun 2009 15:59:43 +0100 (BST)
Received: from pug.o-hand.com (postfix@3a.49.1343.static.theplanet.com
	[67.19.73.58]) by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP
	id n5BExe3L027121 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT) for <o-hand@rpsys.net>; Thu, 11 Jun 2009 15:59:42 +0100
Received: by pug.o-hand.com (Postfix, from userid 1008) id 4367C12EC415;
	Thu, 11 Jun 2009 10:07:25 -0500 (CDT)
X-Original-To: richard@openedhand.com
Delivered-To: richard@openedhand.com
Received: from pug.o-hand.com (localhost [127.0.0.1]) by pug.o-hand.com
	(Postfix) with SMTP id 65D5812EC3FD for <richard@openedhand.com>; Thu, 11
	Jun 2009 10:07:22 -0500 (CDT)
X-Original-To: poky@o-hand.com
Delivered-To: poky@o-hand.com
Received: from [192.168.1.3] (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237]) (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256
	bits)) (No client certificate requested) by pug.o-hand.com (Postfix) with
	ESMTP id 7BD3B12EC35D for <poky@o-hand.com>; Thu, 11 Jun 2009 10:07:12
	-0500 (CDT)
Subject: [poky] Packaged Staging Improvements
From: Richard Purdie <richard@openedhand.com>
To: poky@o-hand.com
Content-Type: text/plain
Date: Thu, 11 Jun 2009 15:58:22 +0100
Message-Id: <1244732302.6018.32.camel@dax.rpnet.com>
Reply-To: poky@o-hand.com
Precedence: list
List-Id: Poky mailing list
List-Unsubscribe: <mailto:poky+unsubscribe@o-hand.com>
List-Archive: http://lists.o-hand.com/poky/
List-Post: <mailto:poky@o-hand.com>
List-Help: <mailto:poky+help@o-hand.com>
List-Subscribe: <mailto:poky+subscribe@o-hand.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Loop: richard@o-hand.com
Content-Transfer-Encoding: 7bit

When packaged staging was written there was a performance bottleneck
introduced which I always wanted to fix at some point. I've just started
the ball rolling with this commit in Poky:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=5a4c688958a7dc1258575c0f6c3bd1af165b2585

and related commits from about that time.

The idea is that instead of do_stage looking like:

1. Take staging lock
2. Take snapshot of staging files
3. Run real staging function
4. Take snapshot of staging files, see what changed
5. Save changed files for staging package
6. Release staging lock

It looks like:

1. Run real staging function to a DESTDIR
2. Take staging lock
3. Install files into staging from DESTDIR
4. Save files from DESTDIR for staging package
5. Release staging lock

which removes the need for the snapshot and reduces the time the lock is
held. This speedup currently only works for packages which have a
do_stage just calling autotools_stage_all so an aim would be to increase
the number of packages we have using this function only.

I noticed one thing stopping this from happening in many cases which was
"inherit pkgconfig" which changes do_stage. The do_stage_append from
pkgconfig.bbclass shouldn't be needed for any sane package using uses
autotools_stage_all. I also noticed that:

* pkgconfig.bbclass does an "inherit base" which is totally pointless 
  as base is *always* inherited
* After the sysroot support addition to pkgconfig, the do_install 
  mangling in pkgconfig.bbclass in OE shouldn't be needed. If it is, 
  code should be patched. Poky doesn't have this but I'll mention to 
  the OE people.

Patches improving the do_stage functions welcome and hopefully this will
give a significant speedup to builds which people can enjoy.

Cheers,

Richard


-- 
To unsubscribe send a mail to poky+unsubscribe@o-hand.com


--=-RxQknHo35vCAgh8z+uyE--
