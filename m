Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LZBUX-0007OO-Eq
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 22:59:05 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LZBSi-0003Xv-K4
	for openembedded-devel@openembedded.org; Mon, 16 Feb 2009 21:57:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 21:57:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Feb 2009 21:57:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Feb 2009 22:57:03 +0100
Message-ID: <gncnff$kar$1@ger.gmane.org>
References: <4995BFE1.7090900@dls.net>
	<4995CF5B.6080103@balister.org>	<C3C7F026-8C3F-4247-8370-78C109729166@ngndg.com>
	<4999CE6C.9020902@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <4999CE6C.9020902@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: boost-1.36.0 fails when compiling; cannot find the compiler
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
X-List-Received-Date: Mon, 16 Feb 2009 21:59:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16-02-09 21:37, Philip Balister wrote:
> Tim Ellis wrote:
>> Currently not working on ARM:

That one is fixed now.

>>
>> http://tinderbox.openembedded.net/public/logs/3460249.txt
>
> Hmm, it works for armv7a ....

armv7a doesn't use thumb in angstrom.

regards,

Koen



