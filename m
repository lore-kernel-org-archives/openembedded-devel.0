Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQou7-0002JU-7s
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 22:47:13 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MQohE-00089x-25
	for openembedded-devel@openembedded.org; Tue, 14 Jul 2009 20:33:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 20:33:52 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 14 Jul 2009 20:33:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 14 Jul 2009 22:33:42 +0200
Message-ID: <h3iq36$riq$1@ger.gmane.org>
References: <200907121334.38852.raj.khem@gmail.com>	<20090713035713.GA21203@denix.org>
	<1247600832.29960.18.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <1247600832.29960.18.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Tue, 14 Jul 2009 20:47:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-07-09 21:47, Richard Purdie wrote:

> The real problem here is two packages providing the same library. This
> is actually a critical error and means your distro is screwed unless
> handled very carefully. Rather than hacking around the problem, I'd much
> rather we detect and abort in this case and warn the user something is
> about to break and that any package feeds will need careful attention.

In this case it works as intended, at least in angstrom :)

regards,

Ken



