Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MCH67-0003vs-LQ
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 19:51:27 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MCGxJ-0002m5-Dm
	for openembedded-devel@openembedded.org; Thu, 04 Jun 2009 17:42:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 17:42:21 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Jun 2009 17:42:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Jun 2009 19:42:10 +0200
Message-ID: <h0911i$2mi$1@ger.gmane.org>
References: <h08u4t$oui$1@ger.gmane.org>
	<1244136199-20093-1-git-send-email-msmith@cbnco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090531 Shredder/3.0b3pre
In-Reply-To: <1244136199-20093-1-git-send-email-msmith@cbnco.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] vim: fix alternative when prefix is /usr
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
X-List-Received-Date: Thu, 04 Jun 2009 17:51:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-06-09 19:23, Michael Smith wrote:
> Fix 2d3750e3dae84c89c9c749f95cf6b3b6cca3e8ce.

I have a fix already queued up: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/commit/?id=ec72a994eccfe0583d222c64e393448c5dadca82

Just need some more testing before I push it to oe.org :)

regards,

Koen



