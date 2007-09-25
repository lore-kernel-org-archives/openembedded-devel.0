Received: from [82.103.128.235] (helo=www.emile.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Ia9Sh-0005cV-NU
	for openembedded-devel@openembedded.org; Tue, 25 Sep 2007 14:24:23 +0200
Received: from www.emile.com (localhost [127.0.0.1])
	by www.emile.com (8.13.3/8.13.3) with ESMTP id l8PCJxin078014
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Sep 2007 15:19:59 +0300 (EEST)
	(envelope-from skoroneos@digital-opsis.com)
Received: (from www@localhost)
	by www.emile.com (8.13.3/8.13.3/Submit) id l8PCJv3X078012
	for openembedded-devel@openembedded.org;
	Tue, 25 Sep 2007 15:19:57 +0300 (EEST)
	(envelope-from skoroneos@digital-opsis.com)
X-Authentication-Warning: www.emile.com: www set sender to
	skoroneos@digital-opsis.com using -f
Received: from ipa209.1.tellas.gr (ipa209.1.tellas.gr [62.169.217.209]) 
	by www.emile.com (IMP) with HTTP 
	for <stelios@localhost>; Tue, 25 Sep 2007 15:19:57 +0300
Message-ID: <1190722797.46f8fced3640a@www.emile.com>
Date: Tue, 25 Sep 2007 15:19:57 +0300
From: Stelios Koroneos <skoroneos@digital-opsis.com>
To: openembedded-devel@openembedded.org
References: <46F587F7.4060501@balister.org>
	<D61182AC8012EA4EBC531B3AF23BE1093F1639@tranzeo-mail2.12stewart.tranzeo.com>
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1093F1639@tranzeo-mail2.12stewart.tranzeo.com>
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) 3.2.2 / FreeBSD-5.2.1
X-Originating-IP: 62.169.217.209
Subject: Re: How should OE be used?
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
X-List-Received-Date: Tue, 25 Sep 2007 12:24:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

> 
> I tried using OE, but could not get it to complete a build for PowerPC
> 405 (neither uclibc or glibc - both failed but in different ways.
> Uclibc gets cross compiler badness errors - I think it is part of this
> powerpc vs ppc stuff in Linux).  After days of frustration, I had to
> bail out and use buildroot for this particular project instead.
> Obviously OE has lots of ARM and x86 users, but the PPC support falls
> behind because it isn't as popular.  I'll check back for a later
> project.
> 

Well, not sure when you tried it, what distro etc but the ppc405 targets in OE
work :)

Infact i am giving a presentation today at the Power.org developer conference in
Austin on powerpc/OE

As we needed a stable tree for our devices/projects we have our distro called
OPLinux and OPlinux-uclibc with gcc 4.1.1 glibc 2.5 or uclibc 0.9.28
We push the changes back to OE on a regular bases and recently provided Koen
with a 405 board so he can do more test on Angstrom which uses newer versions
of gcc/uclibc.
If you (or any other) want a copy of what we use just let me know. 



Stelios

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


