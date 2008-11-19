Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L2mxM-00069s-N4
	for openembedded-devel@openembedded.org; Wed, 19 Nov 2008 14:18:56 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L2muw-00086l-Tg
	for openembedded-devel@openembedded.org; Wed, 19 Nov 2008 13:16:27 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Nov 2008 13:16:26 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Nov 2008 13:16:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 19 Nov 2008 14:16:19 +0100
Message-ID: <gg13j3$tbf$1@ger.gmane.org>
References: <200811191237.23958.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <200811191237.23958.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [Review] RPM support from Poky
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
X-List-Received-Date: Wed, 19 Nov 2008 13:18:56 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19-11-08 12:37, Marcin Juszkiewicz wrote:
> Hi
>
> Few years ago we got partially working RPM support (which no one used).
> When Intel acquired OpenedHand there was lot of work put in getting RPM
> support really working. We got:
>
> - creating of RPM packages (with deps, recommends)
> - creating images from RPM packages
> - creating images from feeds with RPM packages
> - installing packages on devices (from file or feeds)
>
> Thanks to the fact that OpenEmbedded uses git I was able to extract all
> required patches to get it imported from Poky. Result is available as
> 'hrw/poky-rpm' branch on OE git server.
>
> It is not tested yet (build in progress). Any testers/reviewers are
> welcome.

The non RPM bits look ok to me, I don't know anything about RPM so I 
won't comment about that.

regards,

Koen



