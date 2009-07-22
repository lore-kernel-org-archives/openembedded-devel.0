Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MTZKJ-0000b8-OZ
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 12:45:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MTZ6e-0001NG-7V
	for openembedded-devel@openembedded.org; Wed, 22 Jul 2009 10:31:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Jul 2009 10:31:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Jul 2009 10:31:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Jul 2009 12:31:17 +0200
Message-ID: <h46ppl$ic3$1@ger.gmane.org>
References: <f96d234e0907210900t23a05722v7b37c78b0ea3ceed@mail.gmail.com>	<4A6627C9.9090801@atmel.com>	<h46ds3$etn$1@ger.gmane.org>
	<4A66DF13.2030907@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090712 Shredder/3.0b3pre
In-Reply-To: <4A66DF13.2030907@atmel.com>
Sender: news <news@ger.gmane.org>
Subject: Re: OE weekly changelog 2009-07-13 to 2009-07-20 - Bluetooth still not working
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
X-List-Received-Date: Wed, 22 Jul 2009 10:45:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-07-09 11:42, Ulf Samuelsson wrote:
> Koen Kooi skrev:
>> On 21-07-09 22:40, Ulf Samuelsson wrote:
>>> Cliff Brake skrev:
> [snip]
>>> ERROR: Required build target 'gpe-image' has no buildable providers.
>>> Missing or unbuildable dependency chain was: ['gpe-image',
>>> 'task-gpe-base', 'bluez-utils-dbus', 'bluez-libs-3.36']
>>> -----------------------------
>>>
>>> Do we want to disable bluetooth in Angstrom, until this is fixed,
>>> or is it just gpe-image that has a problem with bluetooth?
>>
>> A few things:
>>
>> 1) don't use gpe-image with angstrom, but x11-image or x11-gpe-image
>
> OK, The Wiki gives "gpe-image" and "opie-image" as examples.
> I changed "gpe-image" to "x11-gpe-image" and added "x11-image"

If you're using angstrom, you should be reading 
http://www.angstrom-distribution.org/building-angstrom

regards,

Koen



