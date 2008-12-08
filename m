Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9dYe-0005Ja-3o
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 11:41:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9dUq-0001vh-Hi
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 10:37:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 10:37:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 10:37:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Dec 2008 11:37:40 +0100
Message-ID: <ghitdk$qk7$1@ger.gmane.org>
References: <1228574376.5375.6.camel@dax.rpnet.com>
	<ghe5v4$9hp$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <ghe5v4$9hp$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Cc: bitbake-dev@lists.berlios.de
Subject: Re: Bitbake release
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
X-List-Received-Date: Mon, 08 Dec 2008 10:41:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-12-08 16:32, Koen Kooi wrote:
> On 06-12-08 15:39, Richard Purdie wrote:
>> Hi,
>>
>> As people have probably noticed I just synced up a number of useful
>> changes from Poky into bitbake and brought things pretty much back into
>> sync.
>>
>> The current plan is to let this stabilise for 1 week and the providing
>> no major bugs were introduced, make a new release (finally!).
>
> Not a bug, but something for people to note:
>
> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-October/006289.html

Hmmm, you can't pass variables containing '_' anymore:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=325476d19b821623dbe151d7026c20dfd3754432

regards,

Koen



