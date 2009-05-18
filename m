Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M633w-0004UR-Mf
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 15:39:32 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M62wu-0006Vr-Qu
	for openembedded-devel@openembedded.org; Mon, 18 May 2009 13:32:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 18 May 2009 13:32:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 18 May 2009 13:32:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 18 May 2009 15:31:59 +0200
Message-ID: <guro0f$m4d$1@ger.gmane.org>
References: <gurn12$ifq$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090510 Shredder/3.0b3pre
In-Reply-To: <gurn12$ifq$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFT] udev 141 for the unstable feed
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
X-List-Received-Date: Mon, 18 May 2009 13:39:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

That should have gone to angstrom-devel, no oe-devel, sorry

On 18-05-09 15:15, Koen Kooi wrote:
> Hi,
>
> More and more projects are starting to use libudev for their magic
> (devicekit-*, connman, hal and more), but the udev we are currently
> using (124) is too old for that.
>
> After a lot of fiddling and reading debian/rules and .spec files I have
> udev 141 working well on my beagleboard.
>
> I'd like more people to test udev 141 on their hardware to iron out bugs
> :) If you have something that's using hal, upgrade to 0.5.12 to make it
> work again.
>
> regards,
>
> Koen




