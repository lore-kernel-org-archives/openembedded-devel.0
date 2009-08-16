Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1McgPk-0005oY-6Z for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 16:08:52 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Mcg9Q-00018a-E2 for openembedded-devel@lists.openembedded.org;
	Sun, 16 Aug 2009 13:52:00 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 13:52:00 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2009 13:52:00 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 16 Aug 2009 15:51:48 +0200
Message-ID: <h692tl$qh8$1@ger.gmane.org>
References: <20090814055813.GA13133@gmail.com>
	<20090814062521.GE22344@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.3pre) Gecko/20090730 Shredder/3.0b4pre
In-Reply-To: <20090814062521.GE22344@denix.org>
Sender: news <news@ger.gmane.org>
Subject: Re: New patches not appearing in patchwork since 8/12
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
X-List-Received-Date: Sun, 16 Aug 2009 14:08:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-08-09 08:25, Denys Dmytriyenko wrote:
> On Thu, Aug 13, 2009 at 10:58:13PM -0700, Khem Raj wrote:
>> Hi
>>
>> I am not seeing new patches on patchwork. Is there something wrong with
>> it or is there some setting messed up on my end.
>>
>> Can you see patches posted after 8/12
>
> Same here, the latest one from 8/12 - hx2750 compile errors.

Fixed, google changed ssl certs again, so we had to change the 
fingerprint in .fetchmailrc to 
92:73:17:4C:34:4B:68:F7:B2:17:71:42:0D:7F:9F:33

regards,

Koen



