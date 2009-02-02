Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LU1uc-0004w0-R2
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 17:44:42 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LU1mu-0005iU-2v
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 16:36:44 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 16:36:44 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 16:36:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Feb 2009 17:36:33 +0100
Message-ID: <gm77ei$g7v$1@ger.gmane.org>
References: <49871D38.10906@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <49871D38.10906@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: OpenEmbedded toolchain census
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
X-List-Received-Date: Mon, 02 Feb 2009 16:44:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-02-09 17:20, Marco Cavallini wrote:
> Hi all,
> I'd like to take a census of OE toolchains available for different
> architectures.
> Does anybody want to contribute telling me which machine and which
> toolchain is using?
>
> I started with the following:
>   MACHINE=collie arm-oabi
>   MACHINE=at91sam9263dk arm-gnueabi
>
> and if there are toolchains for DaVinci, MIPS, PowerPC, and so on.
> BTW I wonder what is created for
>   MACHINE=generic-i586
>
> Any hint will be appreciated :-)

Let's answer a few questions first:

* What do you mean with "toolchains"?
* What do you want to do with the resulting information?

Angstrom will generate working toolchains for nearly every machine in 
OE, so you don't need to know about toolchains. More to the point, if 
you need to ask about them, you shouldn't be touching them :)

regards,

Koen



