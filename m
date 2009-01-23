Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LQH08-00069L-Hu
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 09:02:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LQGt8-0004m5-Ji
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 07:55:38 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 07:55:38 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 07:55:38 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 23 Jan 2009 08:55:22 +0100
Message-ID: <glbt5b$did$1@ger.gmane.org>
References: <200901230131.09511.mickey@vanille-media.de>
	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090114 Shredder/3.0b2pre
In-Reply-To: <87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 08:02:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-01-09 01:55, Otavio Salvador wrote:

>
> I propose to change the workflow a bit (and reuse few points you've proposed):
>
>   1. stop using bugtracker to handle patches
>   2. use mailing list to handle patches (comments bellow)
>   3. drop autobuilder bug reporting (comments bellow)

I agree on all points, I have been advocating 2) for a long time :)

regards,

Koen

> Besides, I have no objection about your points 2.2 and 2.3 but I'm too
> new in the OE environment to comment about them so let me comment
> about my points:
>
>   1 and 2:
>
>   We're trying to get more people to review the changes to be done in
>   OE dev tree and bugzilla UI is horrible and difficult to use (at
>   least for me). Most people ends up redoing someone else patch since
>   we don't watch carefully the bugtrack.
>
>   I propose we move to mailing list reviewing process mostly like Linux
>   kernel does. We can use PatchWork (http://ozlabs.org/~jk/projects/patchwork/)
>   tool to make our life easier. I see some pros for that:
>
>    . people will get more review into the patches
>    . people will be aware of ongoing work and what is being prepared to
>      be merged
>    . less forgotten patches
>    . less duplicated work
>
>   I also see a single con for that:
>
>    . more mailing list traffic
>
>   3:
>
>   Instead of reporting bugs, we could mail mailing list with the
>   failure and link a log for someone to take a look. It makes us to
>   worry more about the change since if we break something _everyone_
>   we'll know it :-)
>
> My 2c :P
>




