Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5lBf-0008UO-Qk
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 20:34:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5l4j-0003z1-HG
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 18:27:05 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 18:27:05 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 18:27:05 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 May 2009 20:26:53 +0200
Message-ID: <gupktd$gr8$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>	<gulv2v$l9r$1@ger.gmane.org>
	<C62896630644CE43BF64B0FF0AC27F0E01C6E5@mail.ad.skymv.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E01C6E5@mail.ad.skymv.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Kernel modules
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
X-List-Received-Date: Sun, 17 May 2009 18:34:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-05-09 20:13, Chuck Kamas wrote:
> Thanks,  I add a rrecommends for each kernel module I have in my .config.
>
> BTW, is there a way to have OE scan the kernel .config and automatically pull in all the kernel modules?

RRECOMMENDS = "kernel-modules"

regards,

Koen



