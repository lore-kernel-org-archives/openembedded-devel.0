Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Mcgyn-0004ea-8F for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 16:45:05 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1McgiR-0004LX-Oi for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 14:28:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 14:28:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 14:28:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 Aug 2009 16:28:02 +0200
Message-ID: <h6951i$4gi$1@ger.gmane.org>
References: <540809eb0908100042n74d61d41s6336bea61546dfb@mail.gmail.com>
	<4A881398.4070709@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <4A881398.4070709@nospam.arcornews.de>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] python-sip: update 4.7.9 -> 4.8.2
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
X-List-Received-Date: Sun, 16 Aug 2009 14:45:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-08-09 16:11, Rolf Leggewie wrote:
> Hi,
>
> your commit 68233bb284d82040087b7d265ad3ad93c0cab475 broke "bitbake
> python-pyqt" and possibly others.  See bug 5297.  Please fix or revert.

That's not his commit if you had bothered to check:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=68233bb284d82040087b7d265ad3ad93c0cab475

author: Manuel Pietschmann <manuel.pietschmann@googlemail.com>	
committer: Khem Raj <raj.khem@gmail.com>



