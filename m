Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kn8uV-0003IF-8U
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 11:31:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kn8q6-0004MU-DU
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 09:26:46 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 09:26:46 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 07 Oct 2008 09:26:46 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 07 Oct 2008 11:26:38 +0200
Message-ID: <gcfa0e$lau$1@ger.gmane.org>
References: <gc35ba$voi$1@ger.gmane.org>	<c384c5ea0810061210l65b4178ay812a9681a4e86dda@mail.gmail.com>	<gcdokp$evo$1@ger.gmane.org>
	<gcdpfj$hr0$1@ger.gmane.org>	<c384c5ea0810061601l382428a3rc8efc6c10fd928ca@mail.gmail.com>
	<c384c5ea0810070129l10a9913dk9ef5d5239ad45132@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0810070129l10a9913dk9ef5d5239ad45132@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Heads up: staging changes are going to land
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
X-List-Received-Date: Tue, 07 Oct 2008 09:31:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07-10-2008 10:29, Leon Woestenberg wrote:
> Hello Koen,
>
> On Tue, Oct 7, 2008 at 1:01 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com>  wrote:
>> On Mon, Oct 6, 2008 at 9:38 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>> I suspect packaged-staging is using the old staging packages (as can be seen
>> Maybe this project is misconfigured, thanks for the heads-up on the
>> setscene step.
>>
> Affirmed. I had the packaged staging deployment dir overriden to exist
> outside TMPDIR.
>
> Sorry for the fuzz, thanks for the patch!

It's always nice to know that the problem is somewhere else :)

regards,

Koen



