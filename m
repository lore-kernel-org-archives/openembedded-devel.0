Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Hc4lZ-0007qe-8F
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 21:15:33 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Hc4l4-00055E-Jh
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2007 21:15:02 +0200
Received: from p5483b2eb.dip0.t-ipconnect.de ([84.131.178.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 12 Apr 2007 21:15:02 +0200
Received: from vjensen by p5483b2eb.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Apr 2007 21:15:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Thu, 12 Apr 2007 19:21:59 +0200
Message-ID: <evlprr$2t9$1@sea.gmane.org>
References: <461BB515.7030108@balister.org>
	<200704101902.04699.repvik@kynisk.com>
	<461BC751.4090606@balister.org>
	<200704101932.19318.repvik@kynisk.com>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: p5483b2eb.dip0.t-ipconnect.de
Sender: news <news@sea.gmane.org>
Subject: Re: RFC: U-Boot package clean up
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2007 19:15:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8Bit

Hi Øyvind!

Øyvind Repvik wrote:
> On Tuesday 10 April 2007 19:20, Philip Balister wrote:
>> Øyvind Repvik wrote:
>> > I think I moved uboot-utils away from the uboot-utils directory and
>> > into u-boot. Either way, it's not quite done yet. I'll take a look at
>> > them and remove whichever one is "wrong".
... 
> My strategy would be something like this:
> 
> Remove 1.1.2 and 1.1.4 (unless someone uses them, of course)
...

We are using u-boot 1.1.4 on our devices.  So if it's not too much hassle I
vote for keeping that version.  Not that it's difficult to build it
seperately but building an image with a different version than is used to
boot it could lead to problems, couldn't it?

Bye,
    Vitus



