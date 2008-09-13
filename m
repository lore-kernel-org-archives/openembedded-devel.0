Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KeawE-0007tx-7u
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 21:37:46 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KeatP-0005x1-L4
	for openembedded-devel@openembedded.org; Sat, 13 Sep 2008 19:34:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 19:34:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 13 Sep 2008 19:34:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 13 Sep 2008 21:34:40 +0200
Message-ID: <gah4kh$vm1$1@ger.gmane.org>
References: <20080911195243.GA16359@denix.org>	<20080912000208.GA12469@gmail.com>	<20080912015320.GB17523@denix.org>	<20080912021136.GA20033@gmail.com>
	<gaggd6$86a$1@ger.gmane.org> <20080913190643.GA14530@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
In-Reply-To: <20080913190643.GA14530@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: RFC: SDK/external-toolchain fixes
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
X-List-Received-Date: Sat, 13 Sep 2008 19:37:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (13/09/08 15:49), Koen Kooi wrote:

>> gcc_4.3.x.bb also needs a fix since I get all kinds of limits.h related
>> , errors when trying to do native compilation on the beagle.
>
> I only did cross build/testing no target gcc stuff so I did not see this problem thus far.
> I thought gcc driver should have added include-fixed to default search paths for includes unless you disable it to do so like glibc does in such a case the application should add it to include search paths manually.
>
> If you can give more details about this failure on native build. I could try to dig more.

I'll post some logs when IBC is over.

regards,

Koen



