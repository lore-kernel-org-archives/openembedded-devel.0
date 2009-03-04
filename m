Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Leojr-0002kL-PG
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:55:00 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Leofq-0000hh-7w
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 10:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 11:47:42 +0100
Message-ID: <golm8g$c2m$1@ger.gmane.org>
References: <20090211213312.919E8189338@amethyst.openembedded.net>	<20090303133626.5706500e@mobil.site>	<ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>	<20090303182231.2a9b2007@mobil.site>	<565965130903031700o49cfcaf3r44e81101971f436c@mail.gmail.com>
	<20090304112631.4cc70f62@mobil.site>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <20090304112631.4cc70f62@mobil.site>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Wed, 04 Mar 2009 10:55:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-03-09 11:26, Krzysztof Kotlenga wrote:
> Tick wrote:
>
>> Hi kjk,
>>    Thanks, patch applied as R203
>
> Thanks Tick.
> Since Koen has bumped opkg SRCREV to r203, now we have one problem
> left: opkg_unarchive.patch has to be disabled/removed. Otherwise it
> breaks what was fixed here.

Oops, forgot to commit that bit, sorry. It's in now.

regards,

Koen




