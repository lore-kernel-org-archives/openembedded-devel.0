Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MAqQS-0003xk-Pk
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 21:10:32 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MAqI3-00064b-PO
	for openembedded-devel@openembedded.org; Sun, 31 May 2009 19:01:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 19:01:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 31 May 2009 19:01:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 31 May 2009 21:01:40 +0200
Message-ID: <gvuk6k$hfc$1@ger.gmane.org>
References: <1243774077-19022-1-git-send-email-k.kooi@student.utwente.nl>	<gvu149$nlk$1@ger.gmane.org>	<be7a9f3d0905311100j91409d3n8011a9cffdba6fbc@mail.gmail.com>	<gvuhfg$bf$1@ger.gmane.org>
	<be7a9f3d0905311134u767facd2j44807b0756f9d78f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <be7a9f3d0905311134u767facd2j44807b0756f9d78f@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] xserver-common: add 1.24 from .dev
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
X-List-Received-Date: Sun, 31 May 2009 19:10:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31-05-09 20:34, Otavio Salvador wrote:
> Hello,
>
> On Sun, May 31, 2009 at 3:15 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 31-05-09 20:00, Otavio Salvador wrote:
>>>
>>> Hello,
>>>
>>> On Sun, May 31, 2009 at 10:36 AM, Koen Kooi<k.kooi@student.utwente.nl>
>>>   wrote:
>>>>
>>>> On 31-05-09 14:47, Koen Kooi wrote:
>>>>>
>>>>> From: Koen Kooi<koen@openembedded.org>
>>>>
>>>> Grrrrr. git send-email stripped the comment again:
>>>> * This makes xdg autostart applications autostart
>>>
>>> I think it ought to be enabled; in case someone uses a session manager
>>> (xfce-session, lxde-session or a own manager) it will reopen them.
>>
>> question: does anyone use that in stable/2009 together with xserver-common?
>
> I use :-)
>
>>> I suggest it to have a /etc/defaults/xserver-common that makes it
>>> optional.
>>
>> That would be nice in .dev, but what's your thought on getting this change
>> from .dev to stable/2009 first?
>
> I think it needs to be fixed in dev and then this ought to be done in
> stable all together to avoid issues for current users. I'm one that
> will have problems with this change.

Fair enough, want to cook up a patch for that?

regards,

Koen






