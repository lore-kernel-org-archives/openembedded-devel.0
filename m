Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LxRTz-0005ML-05
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 21:54:47 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LxRPO-0004vB-9F
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 19:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 24 Apr 2009 19:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Apr 2009 21:48:02 +0200
Message-ID: <gst51i$67b$2@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org>
	<49F1FCFB.9000205@balister.org>	<gst2dn$u4j$1@ger.gmane.org>
	<20090424193245.GD15489@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <20090424193245.GD15489@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Fri, 24 Apr 2009 19:54:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-04-09 21:32, Tom Rini wrote:
> On Fri, Apr 24, 2009 at 09:03:18PM +0200, Koen Kooi wrote:
>
>> Upgrade paths are the foundation of package management, breaking them is
>> stabbing people using your binaries in the eye. Do you want to tell the
>> companies evaluating OE using .dev that they can't use the feature
>> anymore that drew them to OE, namely package management?
>
> Red Herring.  No commerical device is going to point to some random feed
> and just hope things work out fine.  No, they're going to point at their
> supported feeds with updates they've tested and fixed any bugs that they
> happened to have found (and pushed back because they're Good Guys).
>




