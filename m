Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NJrW3-0000TP-9a for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 17:41:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NJrUK-00027J-Up
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 17:40:04 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 17:40:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 17:40:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 13 Dec 2009 17:32:54 +0100
Message-ID: <hg34vm$2lg$2@ger.gmane.org>
References: <ac9c93b10912110039u28303201t5a762e715ed53ceb@mail.gmail.com>	<hg126h$djg$2@ger.gmane.org>
	<ac9c93b10912121435i13dd9c3ds6b37e46fd51dc4c9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091201 Shredder/3.0.1pre
In-Reply-To: <ac9c93b10912121435i13dd9c3ds6b37e46fd51dc4c9@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: multiple DISTRO's in tmp
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
X-List-Received-Date: Sun, 13 Dec 2009 16:41:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12-12-09 23:35, Frans Meulenbroeks wrote:
> 2009/12/12 Koen Kooi<k.kooi@student.utwente.nl>:
>> On 11-12-09 09:39, Frans Meulenbroeks wrote:
>>>
>>> I bumped upon the following issue.
>>>
>>> Normally I use angstrom as distro, but this time I needed a small
>>> image to be used in an initramfs.
>>
>> My initramfs built with angstrom is 80KiB and it has an fbdev GUI, how much
>> smaller do you want to get with changing DISTRO?
>
> 80 kb is small enough for me.
> What do you build to get that?


kexecboot for beagleboard.

regards,

Koen




