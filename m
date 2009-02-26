Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LcbNg-0005kw-CJ
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 09:14:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LcbKS-00021I-Va
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 08:10:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 08:10:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Feb 2009 08:10:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 26 Feb 2009 09:10:35 +0100
Message-ID: <go5ipr$nvl$1@ger.gmane.org>
References: <200902131728.08634.openembedded@haerwu.biz>	<20090224064639.GE2172@smtp.west.cox.net>	<1235492001.27962.60.camel@andromeda>	<8763izyarp.fsf@neumann.lab.ossystems.com.br>	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>	<20090224185059.GL2172@smtp.west.cox.net>	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>	<20090225022507.GP2172@smtp.west.cox.net>
	<go4d36$khh$1@ger.gmane.org>	<20090225213536.GT2172@smtp.west.cox.net>
	<go4f92$khh$2@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090219 Shredder/3.0b3pre
In-Reply-To: <go4f92$khh$2@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: checksums situation
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
X-List-Received-Date: Thu, 26 Feb 2009 08:14:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-02-09 23:04, Vitus Jensen wrote:

> If this leads you to abandon checksums alltogether: the current situation
> protects against corrupt downloads and otherwise undetected updates from
> upstream and I'm all for keeping such a protection.

I get reports pretty much every single week about someone asking "what 
does 'checksum failed' mean" when their download is corrupt due to evil 
proxies and bad disks. It's a lot easier and faster to debug than 
seemingly random build failures.

regards,

Koen



