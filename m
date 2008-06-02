Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K3Bof-0007DH-Q9
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 17:19:21 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1K3BkU-0006Th-6X
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 15:15:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 15:15:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 15:15:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Jun 2008 17:10:48 +0200
Message-ID: <g212ho$s5t$1@ger.gmane.org>
References: <20080602143920.A10231892EC@amethyst.openembedded.net>
	<200806021649.49116.mickey@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <200806021649.49116.mickey@vanille-media.de>
Sender: news <news@ger.gmane.org>
Subject: Re: org.oe.dev hal: sync with poky
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
X-List-Received-Date: Mon, 02 Jun 2008 15:19:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> On Monday 02 June 2008 16:39:20 koen commit wrote:
>> hal: sync with poky
>
> This commit breaks dbus/hal restartability which I fixed a couple of weeks
> ago.
>
> Can you double check whether it still works for you?

Ah, I missed the PIDFILE hunk, reverted.

regards,

Koen



