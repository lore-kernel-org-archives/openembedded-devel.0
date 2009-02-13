Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXm7P-0003RE-G2
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 01:41:23 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXm66-0003ln-Ql
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 00:40:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 00:40:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 00:40:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 01:35:32 +0100
Message-ID: <gn2f8k$rh2$3@ger.gmane.org>
References: <1234456715-23618-1-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-2-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-3-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-4-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-5-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-6-git-send-email-otavio@ossystems.com.br>	<1234456715-23618-7-git-send-email-otavio@ossystems.com.br>	<gn1maj$5tl$6@ger.gmane.org>
	<87tz6zmd0h.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <87tz6zmd0h.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH 6/6] flash-plugin: add 10.0.12.36
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
X-List-Received-Date: Fri, 13 Feb 2009 00:41:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 00:49, Otavio Salvador wrote:
> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>
>> On 12-02-09 17:38, Otavio Salvador wrote:
>>> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
>>> +	cat>>   ${libdir}/X11/fonts/misc/fonts.alias<<_PUNT
>> Won't that append to the file each time the package gets upgraded?
>
>  From what I can tell it is indeed not required; I've droped it and if I
> discover any regression due that I can readd it later.
>
> Please ack of rest looks OK.

ACK




