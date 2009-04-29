Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lz2cj-0004F8-QK
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 07:46:25 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lz2Xf-0001rT-LP
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 05:41:11 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 05:41:11 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 05:41:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 29 Apr 2009 07:40:54 +0200
Message-ID: <gt8p96$go1$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>	<20090428203009.GH26082@gmail.com>
	<20090428205520.GV18788@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <20090428205520.GV18788@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Wed, 29 Apr 2009 05:46:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28-04-09 22:55, Tom Rini wrote:
> On Tue, Apr 28, 2009 at 01:30:09PM -0700, Khem Raj wrote:
>> On (27/04/09 07:19), Tom Rini wrote:
>>> Hey all.  I've created a new branch, trini/add-libc-overrides which does
>>> the following:
>>> - Make every distro declare PREFERRED_LIBC, either outright or
>>>    overridable.
>>
>> may be you should call it something like SYSTEM_LIBC
>
> OK, will rework and get a new branch up sometime soon

Or just plain 'LIBC', avoids underscores as well :)

regards,

Koen



