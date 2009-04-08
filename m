Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LrYmJ-0002X1-G9
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 16:29:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LrYjK-0001j4-Pq
	for openembedded-devel@openembedded.org; Wed, 08 Apr 2009 14:26:18 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 14:26:18 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Apr 2009 14:26:18 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Apr 2009 16:26:06 +0200
Message-ID: <gric5v$qc4$1@ger.gmane.org>
References: <d2b9ea600904070016j5826cdbex6271177286c66c87@mail.gmail.com>	<20090407165123.GE2195@smtp.west.cox.net>
	<d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090405 Shredder/3.0b3pre
In-Reply-To: <d2b9ea600904080716y5776086fu8521915fa402f694@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH v2] mingw-binutils: update to 2.19.1
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
X-List-Received-Date: Wed, 08 Apr 2009 14:29:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-04-09 16:16, Esben Haabendal wrote:

> Then, please someone apply this to .dev.  But then how are we supposed
> to remember which patches should also be moved to stable, and when?

If you want something in stable, you send the patch to this mailinglist 
with [STABLE] in the subject. That way it will show up here:

http://patchwork.openembedded.org/project/openembedded/list/?state=*&q=oe%2CSTABLE

or for a complete historic view:

http://patchwork.openembedded.org/project/openembedded/list/?q=oe,STABLE&archive=both&state=*

> Let's not make it to complicated to maintain stable, so that it will die
> from us again :-(

Stuff needs to get into .dev first to receive wider testing. Putting 
stuff directly in stable negates the idea of the stable branch.

regards,

Koen



