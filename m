Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JxHY4-0003qS-Qi
	for openembedded-devel@openembedded.org; Sat, 17 May 2008 10:13:49 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JxHW9-0003vH-QO
	for openembedded-devel@openembedded.org; Sat, 17 May 2008 08:11:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 17 May 2008 08:11:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 17 May 2008 08:11:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 17 May 2008 10:11:36 +0200
Message-ID: <g0m3vp$7qm$1@ger.gmane.org>
References: <20080516214710.GA21911@rhein.zuhause.netz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008050803)
In-Reply-To: <20080516214710.GA21911@rhein.zuhause.netz>
Sender: news <news@ger.gmane.org>
Subject: Re: MIPS machine.confs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 17 May 2008 08:13:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Henning Heinold wrote:
> Hi,
>
> there are serval .conf under machine/ (rb500.conf,wrt54,wl500g.conf)
> which using TARGET_CC_ARCH = "-Os". I suggest this should be not set
> there, becaue it's a distribution-thingie. If no one minds I will clean it up.

I certainly don't mind, it a thing I missed in my previous machine/tune 
cleanup :)

regards,

Koen



