Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KnWB3-0004oI-R9
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 12:21:57 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KnW6Z-0004Y4-Rs
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 10:17:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 10:17:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 08 Oct 2008 10:17:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 08 Oct 2008 12:17:08 +0200
Message-ID: <gci1b5$d57$1@ger.gmane.org>
References: <200810080751.15817.zecke@selfish.org>
	<200810081210.00494.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <200810081210.00494.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 10:21:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08-10-2008 12:10, Marcin Juszkiewicz wrote:
> Wednesday 08 of October 2008 07:51:15 Holger Freyther napisał(a):
>
>> we would like to switch to git by next wednesday. Jan Lübbe went
>> through the hassle to fix two issues in my mtn2git.py and we are
>> happy with the metadata and can even unite it with the data exported
>> from bitkeeper.
>
>> The plans would be:
>> 	- Send your public ssh keys if you have not done so
>
> Send them to who? Mickeyl, Koen, Holger, Richard or someone other?

As was said only 7 days ago, on this very list:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2008-October/006291.html

We have received a grand total of 14 git keys since then.

regards,

Koen

>
>> Tuesday:
>> 	- Set monotone readonly 16h german time
>> 	- merge the multiple heads (if they exist)
>> 	- Try to add the revs from now to tuesday to git
>
>> Wednesday:
>> 	- Be back up with git and use that as primary system.
>> 	- Disable monotone completely
>
> I would suggest leaving monotone read-only for two weeks so people will
> have a time to switch. Also adding file like README-THIS-IS-NOT-UPDATED-
> SINCE-WE-SWITCHED-TO-GIT with some info would be nice.
>
>> Thanks to Jan for wrestling with monotone, git, the script and the
>> data and we will keep you informed about how the migration is going.
>
> Thanks to all people envolved into this switch. My contributions to OE
> were smaller last time due to my work on Poky but now, when we will be
> using git I plan to merge some interesting stuff to the OE (my monotone
> knowledge is smaller then it was year ago).
>




