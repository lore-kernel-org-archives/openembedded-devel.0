Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K37jw-0006yM-5X
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 12:58:12 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K37fj-0000wo-Sh
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 10:53:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 10:53:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Jun 2008 10:53:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Jun 2008 12:53:43 +0200
Message-ID: <g20jfn$3l0$1@ger.gmane.org>
References: <1212402369.5008.6.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008052003)
In-Reply-To: <1212402369.5008.6.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Merging multimachine.bbclass into the OE.dev core
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
X-List-Received-Date: Mon, 02 Jun 2008 10:58:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Hi,
>
> multimachine has been a kind of second class citizen for a long time
> having been maintained in its own class.  We now have things like sdk
> generation which implicitly depend on multimachine being used. I can't
> think of any reason people wouldn't want to use it and it allows extra
> flexibility without imposing any added limitations.
>
> Is it time we merged it into the core classes and made it the default?

Yes!

regards,

Koen



