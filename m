Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ly0j6-0007Fn-S0
	for openembedded-devel@openembedded.org; Sun, 26 Apr 2009 11:32:44 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Ly0eK-0002sO-55
	for openembedded-devel@openembedded.org; Sun, 26 Apr 2009 09:27:48 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 26 Apr 2009 09:27:48 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 26 Apr 2009 09:27:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 26 Apr 2009 11:27:36 +0200
Message-ID: <gt19e9$u1e$1@ger.gmane.org>
References: <gsst4a$cvj$1@ger.gmane.org>
	<200904252318.18413.marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090421 Shredder/3.0b3pre
In-Reply-To: <200904252318.18413.marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Sun, 26 Apr 2009 09:32:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25-04-09 23:18, Marcin Juszkiewicz wrote:

>> http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=
>> 8101ad8e1229b3b9f8aa0be0fdc262b5283034d0
>
> This one looks quite sane.

Maybe if you use debian.bbclass, if you don't -> broken upgrade paths

regards,

Koen



