Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lep9t-0003vh-KI
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 12:21:29 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lep5s-0001gO-5k
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:16:56 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 11:16:56 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 11:16:56 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 12:16:48 +0100
Message-ID: <golnv0$h4r$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <go498c$bqq$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 04 Mar 2009 11:22:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 21:21, Koen Kooi wrote:
> Hi,
>
> I keep trying to teach people the difference between recipes (what's in
> OE) and packages (what you install on the target) and keep getting
> reactions like "ok, but why is the dir called packages?", which are
> completely valid.
>
> Proposal:
>
> mv packages recipes ; git commit .

Only positive replies sofar, so when do we want to schedule this commit? 
My proposal is somewhere in april, since I'm too busy this month with 
bossaconference and university work to deal with the fallout properly.
Also, shall we restructure TMPDIR at the same time?

regards,

Koen



