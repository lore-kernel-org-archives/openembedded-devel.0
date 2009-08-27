Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MgabA-0006ci-NV for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 10:44:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1MgaJi-00015f-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 10:26:46 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 10:26:46 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 10:26:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 Aug 2009 10:26:24 +0200
Message-ID: <h75fvg$su5$1@ger.gmane.org>
References: <E1MgPr6-0006GQ-GT@melo.openembedded.org>
	<4A962EA9.8010908@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <4A962EA9.8010908@xora.org.uk>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] Stanislav Brabec : glibc: Install ld.so.conf, so ldconfig does not complain .
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
X-List-Received-Date: Thu, 27 Aug 2009 08:44:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-08-09 08:58, Graeme Gregory wrote:
> git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: 056a67f6070c5ea561acb65049b551e24f3b7eb6
>> URL:
>> http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=056a67f6070c5ea561acb65049b551e24f3b7eb6
>>
>>
>> Author: Stanislav Brabec <utx@penguin.cz>
>> Date: Wed Aug 26 21:05:59 2009 +0000
>>
>> glibc: Install ld.so.conf, so ldconfig does not complain.
>>
> I have the feeling this is the reversal of a previous decision to remove
> ld.so.conf from rootfs.

it is.

regards,

Koen



