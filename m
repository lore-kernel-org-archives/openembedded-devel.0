Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L0HTQ-0004GM-4F
	for openembedded-devel@openembedded.org; Wed, 12 Nov 2008 16:17:40 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L0HRT-0001Np-39
	for openembedded-devel@openembedded.org; Wed, 12 Nov 2008 15:15:39 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Nov 2008 15:15:39 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Nov 2008 15:15:39 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 12 Nov 2008 16:15:31 +0100
Message-ID: <gferuj$6rj$1@ger.gmane.org>
References: <1226054458.7175.3.camel@aquilonia>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081106 Shredder/3.0b1pre
In-Reply-To: <1226054458.7175.3.camel@aquilonia>
Sender: news <news@ger.gmane.org>
Subject: Re: Xorg X11R7.4 updates
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
X-List-Received-Date: Wed, 12 Nov 2008 15:17:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-11-2008 11:40, Graeme Gregory wrote:
> Hi, sponsored by Openmoko I have been working on bring Xorg 7.4 to OE. I
> have now reached the point where all the right versions of the packages
> are now in and I have even checked that they compile to the extent I can
> on arm (some are obviously x86 or exotic machine only).
>
> So I would like people with an interest to please review the changes on
> the shared/xorg-7.4-update branch. Especially x86 guys who can actually
> use some of the drivers. Id like to get any problems ironed out now
> ready for merging into OE mainline.

It works great for the platforms I tested it on, so you get my vote for 
merging it now.

regards,

Koen



