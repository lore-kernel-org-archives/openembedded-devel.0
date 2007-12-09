Received: from [81.169.178.128] (helo=h6563.serverkompetenz.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <oe@hentges.net>) id 1J1U6N-0006J4-7K
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Dec 2007 22:54:19 +0100
Received: from localhost (localhost [127.0.0.1])
	by h6563.serverkompetenz.net (Postfix) with ESMTP id 9E899308011;
	Sun,  9 Dec 2007 22:50:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at hentges.net
Received: from h6563.serverkompetenz.net ([127.0.0.1])
	by localhost (h6563.serverkompetenz.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7+OiSjXmE-8M; Sun,  9 Dec 2007 22:50:14 +0100 (CET)
Received: from [192.168.5.2] (xdsl-87-79-225-105.netcologne.de [87.79.225.105])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by h6563.serverkompetenz.net (Postfix) with ESMTP id D1C3B308004;
	Sun,  9 Dec 2007 22:50:13 +0100 (CET)
From: Matthias Hentges <oe@hentges.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <bug-3446-13@http.bugs.openembedded.org/>
References: <bug-3446-13@http.bugs.openembedded.org/>
Date: Sun, 09 Dec 2007 22:50:12 +0100
Message-Id: <1197237012.10154.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.3 
Subject: Re: [oe-issues] [Bug 3446] New: zaurus-updater changes have broken	flashing on zaurus c760
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
X-List-Received-Date: Sun, 09 Dec 2007 21:54:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Sonntag, den 09.12.2007, 11:34 -0800 schrieb 

[...]

> After building a recent .dev branch angstrom release, flashing it to my c760, I
> only got the infamous jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found,
> repeated constantly.
> 
> The problem seems to have been introduced by some change in the updater.sh
> script, from the zaurus-updater package. After replacing updater.sh with a
> version from some openzaurus release, it flashed fine at once.
> 

Interesting. So not only Akita is affected. Do we have _any_ reports of
successful rootfs flashes with the new updater.sh?

-- 
Matthias 'CoreDump' Hentges 
Cologne / Germany

Webmaster of Hentges.net & Embedded Linux Developer
GPG ->  gpg --keyserver gpg-keyserver.de --recv-keys 0xAF3030D9

My OS: Debian SID: Geek by Nature, Linux by Choice





