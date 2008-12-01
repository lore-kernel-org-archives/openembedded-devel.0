Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L76K1-0006h6-N8
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 11:48:09 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L76Gj-0008MZ-Vc
	for openembedded-devel@openembedded.org; Mon, 01 Dec 2008 10:44:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 10:44:45 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Dec 2008 10:44:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Dec 2008 11:44:36 +0100
Message-ID: <gh0f6k$1au$1@ger.gmane.org>
References: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>	<20081129213201.21d91e2d@zaurus>	<bc64b4640811301810y1f4fa910p704d089b40be1278@mail.gmail.com>
	<1228126513.3835.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081125 Shredder/3.0b1pre
In-Reply-To: <1228126513.3835.12.camel@utx.utx.cz>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] zaurus-updater: add support for home partition reflashing
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
X-List-Received-Date: Mon, 01 Dec 2008 10:48:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-12-08 11:15, Stanislav Brabec wrote:
> Dmitry wrote:
>> 2008/11/29 Stanislav Brabec wrote:

>>> 2. Support for langpacks. OE does not create langpack yet, but it would
>>> be nice to be able to flash localized system.
>> As a Russian user, it's definitely +1.
>
> Its support would be only a first step. Creating them is a more
> complicated task.

As a first step angstrom is now generating feed config files for the 
locale feeds:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=bb668b9e99edea043a0c321109d76ca16c5e453f

regards,

Koen



