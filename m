Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1JGuP8-0007d7-N3
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2008 12:01:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 51F80308010
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 12:01:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ZVGDT4vYd5Pq
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 12:01:26 +0100 (CET)
Received: from [192.168.5.10] (xdsl-87-78-218-198.netcologne.de
	[87.78.218.198])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 65B6A308004
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 12:01:26 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1697236488.20080121001353@vanille-media.de>
References: <E1JGgkN-0004go-O8@linuxtogo.org>
	<1697236488.20080121001353@vanille-media.de>
Date: Mon, 21 Jan 2008 12:01:24 +0100
Message-Id: <1200913284.7719.1.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.2 
Subject: Re: [oe-commits] org.oe.dev altboot: Add SVNR77
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2008 11:01:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


Am Montag, den 21.01.2008, 00:13 +0100 schrieb Michael 'Mickey' Lauer:

> > 1
> > packages/altboot/altboot_1.1.1+wip-SVNR76.bb
> > packages/altboot/altboot_1.1.1+wip-SVNR77.bb
> 
> Is there a good reason why you are not doing this by adding
> altboot_1.1.1+wip-svn.bb and increasing the svn revision by using
> conf/distro/include/sane-srcrevs? This seems to be the usual way of
> dealing with fixed-revision svn packages nowadays in OE.

I didn't know about sane-srcrevs, thanks for bringing it to my
attention. I will look into it.
-- 
Matthias 'CoreDump' Hentges 
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice





