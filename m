Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwN3y-0005SD-0O
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 22:59:30 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LwMze-0001uZ-FC
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 20:55:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:55:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 20:55:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 22:50:57 +0200
Message-ID: <gslbjh$pvu$1@ger.gmane.org>
References: <gsl3do$sov$1@ger.gmane.org> <200904220025.33983.khimov@altell.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <200904220025.33983.khimov@altell.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: Cleaning out patchwork queue
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
X-List-Received-Date: Tue, 21 Apr 2009 20:59:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-04-09 22:25, Roman I Khimov wrote:
> On Tuesday 21 April 2009 22:31:20 Koen Kooi wrote:
>> If you have outstanding patches and no commit access (hi Roman!) ping
>> them again on this list and pester people in IRC to apply them.
>
> Well, don't like to pester people in general, but there you go.

Could you have a look at your patches listed here: 
http://patchwork.openembedded.org/project/openembedded/list/?state=3

some are still using packages instead of recipes and they seem to fail 
on checksums.ini since git can't merge its way out of a wet paper bag.

Only sending patches for the recipes and one big patch for checksums.ini 
would acceptable to me as well.

regards,

Koen




