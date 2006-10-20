Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GavFE-0008Po-9M for openembedded-devel@lists.openembedded.org;
	Fri, 20 Oct 2006 16:21:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 35644DAB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 16:13:59 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 19296-07 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 16:13:54 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 366E4D91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Oct 2006 16:13:54 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1187003130.20061020150851@gmail.com>
References: <E1Gat5Z-0000PW-3y@linuxtogo.org>
	<1187003130.20061020150851@gmail.com>
Organization: VanilleMedia
Date: Fri, 20 Oct 2006 16:13:53 +0200
Message-Id: <1161353634.1649.174.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev qemu: sync with poky, remove	obsolete ones
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 14:21:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> The same type of question which occurs on list/IRC oftentimes now -
> is it so unavoidable to remove just everything? What about the last
> release version? It may contain known defficiencies for *some* archs
> and configs, but it is still the last release version, not a random
> snapshot which doesn't have obvious issues from the first look.

In principle I agree and normally I preserve the last stable release
when I add newer version of packages. In this particular case though for
some reason (which I can't remember other than that it was in middle of
the night where I should've rather counted sheeps) I didn't :)

I'll bring 0.8.2 back the second 0.8.2+cvs20060723 breaks for anyone.
-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




