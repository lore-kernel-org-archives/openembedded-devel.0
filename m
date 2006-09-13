Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GNdVO-0005cP-Ml for openembedded-devel@lists.openembedded.org;
	Thu, 14 Sep 2006 00:46:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 4B63F874
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 00:43:20 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 27334-02 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 00:43:16 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 94026873
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2006 00:43:16 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <450865F2.3040907@dominion.kabel.utwente.nl>
References: <450851E5.5060800@laposte.net>
	<450861BB.8050500@dominion.kabel.utwente.nl>
	<921824592.20060913230440@gmail.com>
	<450865F2.3040907@dominion.kabel.utwente.nl>
Organization: VanilleMedia
Date: Thu, 14 Sep 2006 00:43:16 +0200
Message-Id: <1158187396.13521.1.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: Improve consistency with bittest content checker +	sanitize.py
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
X-List-Received-Date: Wed, 13 Sep 2006 22:46:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> >> I'd like to point out that the-script-formerly-known-as-sanitize.py checks for *OE* styles
> >>  and *OE* vars, instead of being a generic tool to check bitbake recipes. What I don't
> >> know is where the border between 'bitbake' and 'OE' lies, but bittest is starting to look
> >> like OEtest :)
> >
> >   Let's put bitbake into OE repo then? ;-))
> 
> and reverse http://oe-devel.bkbits.net:8080/openembedded/patch@1.2648.59.105 as well?

No way. Splitting BitBake and OpenEmbedded helped us a lot to draw the
borders between
a generic task executor and cross-building specific issues. We don't
want to go back to the stone ages.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




