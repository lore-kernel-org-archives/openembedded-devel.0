Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCGKM-00056P-6Q
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 19:02:06 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MCGBY-0000OR-Bj
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 16:53:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 16:53:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 16:53:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Jun 2009 18:52:45 +0200
Message-ID: <h08u4t$oui$1@ger.gmane.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <200906041838.05838.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: Set of patches for stable/2009
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
X-List-Received-Date: Thu, 04 Jun 2009 17:02:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-06-09 18:38, Marcin Juszkiewicz wrote:
>
> Hi
>
> I looked at log of .dev branch and found some interesting things there
> to try on stable/2009 branch. I did not tried them yet (just extracted).
>
> My plans for next ~week is sort them to few categories, do build tests
> and then mail to ML for review. It is 98 patches so far.

If you add qemu 0.10.3, you don't need patch 6 and 7.

patch 98 is broken 'vim' doesn't exist, '/usr/bin/vim' does.

That's from a quick look.

regards,

Koen



