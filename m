Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KSBRz-00069P-4I
	for openembedded-devel@openembedded.org; Sun, 10 Aug 2008 15:59:15 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KSBRZ-0000fQ-Gd
	for openembedded-devel@openembedded.org; Sun, 10 Aug 2008 13:58:49 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 10 Aug 2008 13:58:49 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 10 Aug 2008 13:58:49 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 10 Aug 2008 15:58:37 +0200
Message-ID: <g7ms6d$n91$1@ger.gmane.org>
References: <4883BCB1.7020102@atmel.com>	<c384c5ea0807221042y5018e7f2ka7b2915e82e9a554@mail.gmail.com>
	<489EEAC6.1030300@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0b1pre (Macintosh; 2008080100)
In-Reply-To: <489EEAC6.1030300@gmx.net>
Sender: news <news@ger.gmane.org>
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Sun, 10 Aug 2008 13:59:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi,
> got an ngw100 and wanted to build angstrom for it and have the same
> issues as Ulf with binutils-cross.

If you work around that you'll notice that gcc-cross doesn't compile 
anymore :( I'm hoping to spend some time on it next week, but don't let 
that stop you from fixing it yourself :)

regards,

Koen

> Leon Woestenberg schrieb:
>>> Anyone got the AVR32 toolchain to build properly using a recent version?
>>>
>> Yes, I am building a AVR32 project using
>> 478afd231213fcf731ddefac0314beee5d95b5fb which works fine for me.
>>
>> I upgrade every now and then. Will see about more recent revisions of OE.
> Can you try with a current one?
>
> Regards
> Robert
>
>
>
> ------------------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




