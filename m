Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MMzt3-0005fD-52
	for openembedded-devel@openembedded.org; Sat, 04 Jul 2009 09:42:17 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MMzhC-0004kr-KM
	for openembedded-devel@openembedded.org; Sat, 04 Jul 2009 07:30:02 +0000
Received: from 117.254.13.113 ([117.254.13.113])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Jul 2009 07:30:02 +0000
Received: from kirtibr by 117.254.13.113 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Jul 2009 07:30:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Kirtika Ruchandani <kirtibr@gmail.com>
Date: Sat, 4 Jul 2009 07:27:34 +0000 (UTC)
Message-ID: <loom.20090704T072427-524@post.gmane.org>
References: <64d5b90a0907032223t749b13ffy95305639fcf3e654@mail.gmail.com>
	<1246691571.16040.20.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 117.254.13.113 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.11) Gecko/2009060310 Ubuntu/8.10 (intrepid) Firefox/3.0.11)
Sender: news <news@ger.gmane.org>
Subject: Re: (Possibly grave) error with Busybox recipe ?
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
X-List-Received-Date: Sat, 04 Jul 2009 07:42:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Phil Blundell <philb <at> gnu.org> writes:


> 
> It's intentional that busybox doesn't ship most of those files.  Was
> there a particular one that was causing you a problem?
 
Ok. I haven't tested my image as yet but I posted here because I saw ls,mv,cp
and other utilities under /busybox/bin being excluded out of the packages as
seen in the pastebin, apart from the ones which look like they have been
intentionally left out.






