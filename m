Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K7muw-0005NF-2S
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 09:44:50 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K7muQ-0000QX-RC
	for openembedded-devel@openembedded.org; Sun, 15 Jun 2008 07:44:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 15 Jun 2008 07:44:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Jun 2008 07:44:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 15 Jun 2008 09:44:06 +0200
Message-ID: <g32h87$1n8$1@ger.gmane.org>
References: <20080614221857.GB3428@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <20080614221857.GB3428@cimmeria.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: Packaged Staging Problems
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
X-List-Received-Date: Sun, 15 Jun 2008 07:44:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> I get the problem in packaged staging that it repeatedly issues the
> error.
>
> NOTE: Checking if staging package installed
> head: `-1' option is obsolete; use `-n 1'
> Try `head --help' for more information.
> sed: couldn't flush stdout: Broken pipe
> NOTE: No. Manually removing any installed files
>
> I suspect the attached patch is the fix for this. But this is scary core
> stuff so I thought I would send it for review.

I really should start reading email first before I start fixing the 
things you sent me over jabber :)
Anyway, I commmitted something that looks a lot like your patch 5 
minutes ago.

regards,

Koen



