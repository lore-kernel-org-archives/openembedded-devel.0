Received: from [195.135.220.15] (helo=mx2.suse.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Le9M3-0003fQ-8h
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 15:42:51 +0100
Received: from Relay2.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 60A3047B09
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2009 15:38:57 +0100 (CET)
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 081FC62807F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2009 15:38:57 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF6D2@hiob.intern.dresearch.de>
References: <50939.AFRVDw5RXnw=.1235748344.squirrel@webmail.no-log.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF6D2@hiob.intern.dresearch.de>
Date: Mon, 02 Mar 2009 15:38:55 +0100
Message-Id: <1236004735.4936.31.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1.1 
Subject: Re: [patch](or sort of): emacs didn't compile[first part: emacsrecipe]
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
X-List-Received-Date: Mon, 02 Mar 2009 14:42:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote in Fri 02/27 2009 at 17:11 +0100:
> Hi Denis,
> 
> i hope your message will help to come to a stable emacs build. I've reported build problems some days before too (see <http://thread.gmane.org/gmane.comp.handhelds.openembedded/21178>). The interesting point is that the build behaviour is different on some of my machines.

Please try to enlarge stack size (-s). I got segfault with the default
stack size, never with 1048576).

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



