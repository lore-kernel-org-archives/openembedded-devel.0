Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6tye-0005PG-JI
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 00:09:32 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6trJ-00048y-Sk
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 22:01:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 22:01:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 22:01:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 May 2009 00:01:45 +0200
Message-ID: <gv1uk9$7l1$1@ger.gmane.org>
References: <20090520100722.0F57F188075@amethyst.openembedded.net>
	<20090520213111.GW23842@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <20090520213111.GW23842@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Koen Kooi : gcc 4.3.2, 4.3.3, 4.4.0: attempt to fix zecke-no-host-includes. patch
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
X-List-Received-Date: Wed, 20 May 2009 22:09:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-05-09 23:31, Tom Rini wrote:
> On Wed, May 20, 2009 at 12:07:22PM +0200, GIT User account wrote:
>
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 21dbc0814fe2bd1f2cdbfa255d169139842661e9
>> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=21dbc0814fe2bd1f2cdbfa255d169139842661e9
>>
>> Author: Koen Kooi<koen@openembedded.org>
>> Date:   Wed May 20 12:00:17 2009 +0200
>>
>> gcc 4.3.2, 4.3.3, 4.4.0: attempt to fix zecke-no-host-includes.patch
>
> As a user of older gcc's I'm quite happy you fixed this in 4.3.2, but in
> the future can you please convert any gcc's you're touching that aren't
> using INC_PR already to do so?  Thanks!

Ah, I thought the other ones were intentionally left out, I'll convert 
them when I touch them next time.

regards,

Koen



