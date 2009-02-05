Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LV56B-0000hJ-TN
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 15:21:49 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LV54Z-0005dn-KU
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 14:19:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 14:19:19 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Feb 2009 14:19:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 05 Feb 2009 15:06:15 +0100
Message-ID: <gmeron$e6l$1@ger.gmane.org>
References: <200901230131.09511.mickey@vanille-media.de>	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br>	<49799C30.90508@epfl.ch>
	<glc8ce$eoh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090131 Shredder/3.0b2pre
In-Reply-To: <glc8ce$eoh$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: Mailinglists, was: Re: Bugtracker Status
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
X-List-Received-Date: Thu, 05 Feb 2009 14:22:53 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-01-09 12:06, Koen Kooi wrote:
> On 23-01-09 11:30, Valentin Longchamp wrote:
>> Otavio Salvador wrote:
>>> I propose to change the workflow a bit (and reuse few points you've
>>> proposed):
>>>
>>> 1. stop using bugtracker to handle patches
>>> 2. use mailing list to handle patches (comments bellow)
>>> 3. drop autobuilder bug reporting (comments bellow)
>>>
>>> Besides, I have no objection about your points 2.2 and 2.3 but I'm too
>>> new in the OE environment to comment about them so let me comment
>>> about my points:
>>>
>>> 1 and 2:
>>>
>>> We're trying to get more people to review the changes to be done in
>>> OE dev tree and bugzilla UI is horrible and difficult to use (at
>>> least for me). Most people ends up redoing someone else patch since
>>> we don't watch carefully the bugtrack.
>>>
>>> I propose we move to mailing list reviewing process mostly like Linux
>>> kernel does. We can use PatchWork
>>> (http://ozlabs.org/~jk/projects/patchwork/)
>>> tool to make our life easier. I see some pros for that:
>>>
>>> . people will get more review into the patches
>>> . people will be aware of ongoing work and what is being prepared to
>>> be merged
>>> . less forgotten patches
>>> . less duplicated work
>>>
>>> I also see a single con for that:
>>>
>>> . more mailing list traffic
>>>
>>
>> Even if I am not very much involved in the OE development, I completely
>> agree with Otavio. The few patches that I have proposed are often stuck
>> on the bugzilla. Maybe it would be better with a mailing-list.
>>
>> Furthermore, now that we use git, we have plenty of tools to send
>> patches to a mailing-list (format-patch, send-email and am).
>>
>> I would definitely support a patch review style like on the linux kernel
>> mailing-lists even if this implies a high-traffic list (with simple
>> filter rules in your mail client, it's easy to handle). However, I don't
>> think it would be a good idea to have two lists.
>
> I'd go even further by saying we should reorganize the mailinglists into
> this:
>
> * oe mailinglist for humans
> * combined commit + autobuild log list for non-humans
>
> That should reduce confusion which list to use (oe-user, oe-devel, etc)
> for sending mails and more people get to see patches flying by. Even if
> you don't review them having more code snippets on the list is usefull
> for newcomers.

15:01 < _boto> i have posted into issue ml
15:02 < _boto> i wondered that the rest of mails were created by bugzilla

No objections, only support for my proposal, so can this get implemented 
now?

regards,

Koen




