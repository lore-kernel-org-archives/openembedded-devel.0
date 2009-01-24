Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LQiys-0002bW-RB
	for openembedded-devel@openembedded.org; Sat, 24 Jan 2009 14:55:26 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LQirn-0008Mn-Qu
	for openembedded-devel@openembedded.org; Sat, 24 Jan 2009 13:48:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 24 Jan 2009 13:48:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 24 Jan 2009 13:48:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Jan 2009 14:47:58 +0100
Message-ID: <glf66f$p9u$1@ger.gmane.org>
References: <4976D10A.9050000@gmx.net>	<4976D54C.8030601@xora.org.uk>	<200901211257.39952.openembedded@haerwu.biz>	<497731CC.2010000@balister.org>	<1232565558.11888.45.camel@elrond.atmel.com>	<4979FC5E.9040503@kernelconcepts.de>
	<497B1685.20504@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090118 Shredder/3.0b2pre
In-Reply-To: <497B1685.20504@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: FOSDEM OE stand
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
X-List-Received-Date: Sat, 24 Jan 2009 13:55:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-01-09 14:24, Marco Cavallini wrote:
> Florian Boor ha scritto:
>> Just apart from the fact that I'd like to
>> see some other architectures than ARM at our stand.
>
> What about this Vortex86SX ?
> http://www.koala.it/it/nanopc.htm
>
> If someone could help me creating a configuration for this machine, we
> could show it FOSDEM OE stand :-)
> (Monitor, mouse, keyboard must be provided in place)

Try making a copy of qemux86.conf, that builds and works.

regards,

Koen



