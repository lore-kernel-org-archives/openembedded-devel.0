Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M897J-0007wd-Rz
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 10:31:37 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M88zh-0000h2-Hp
	for openembedded-devel@openembedded.org; Sun, 24 May 2009 08:23:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 08:23:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 08:23:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 May 2009 10:23:34 +0200
Message-ID: <gvb066$tov$1@ger.gmane.org>
References: <20090522213142.GF23842@smtp.west.cox.net>	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
	<c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sun, 24 May 2009 08:31:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-05-09 00:25, Leon Woestenberg wrote:

> Marcin wrote a patch that solves this.

Marcins patch doesn't solve anything, it only breaks MACHINE_KERNEL_PR, 
so all your external modules and associated apps don't get rebuilt if 
you change your kernel.

Now, if people posting in this thread would bother to read the original 
RFC (that got approved for .dev as well as stable/2009), we wouldn't be 
having this discussion.

regards,

Koen



