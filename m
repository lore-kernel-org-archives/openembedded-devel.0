Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lv4mq-0008AI-JW
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 09:16:28 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lv4iq-0007Nu-HK
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 07:12:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 18 Apr 2009 07:12:20 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Apr 2009 07:12:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 18 Apr 2009 09:12:00 +0200
Message-ID: <gsbug1$b8b$1@ger.gmane.org>
References: <C62896630644CE43BF64B0FF0AC27F0E0366CD@mail.ad.skymv.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090413 Shredder/3.0b3pre
In-Reply-To: <C62896630644CE43BF64B0FF0AC27F0E0366CD@mail.ad.skymv.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Newbie: Minimal OE build
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
X-List-Received-Date: Sat, 18 Apr 2009 07:16:28 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-04-09 01:57, Chuck Kamas wrote:
> Hi all,
>
> I would like to use OE to build a rootfs plus busybox and a few i2c
> tools and that is about it.  What Distribution should I use as my base?
> Angstrom?

Yes.

> Angstrom seems to pull in lots of things that are not needed
> like Bluetooth.

That's not angstrom that's doing this, it's the image recipe. For 
example the kexecboot-image binary in angstrom is 80kilobytes in size 
for the armv5te architecture.

> Is there a better starting place?

No.

regards,

Koen



