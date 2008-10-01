Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kl8Dy-00057V-Ot
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 22:23:06 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kl89x-0004DR-5B
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 20:18:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 01 Oct 2008 20:18:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 01 Oct 2008 20:18:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 01 Oct 2008 22:18:49 +0200
Message-ID: <gc0lv9$46r$1@ger.gmane.org>
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>	<gc017m$gq4$1@ger.gmane.org>
	<48E39BC1.6080200@dls.net>	<gc0bc5$o9o$2@ger.gmane.org>
	<20081001184353.GD3010@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080922030535 Shredder/3.0b1pre
In-Reply-To: <20081001184353.GD3010@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 20:23:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-10-2008 20:43, Tom Rini wrote:
> On Wed, Oct 01, 2008 at 07:17:57PM +0200, Koen Kooi wrote:
>> On 01-10-2008 17:48, Mike (mwester) wrote:
>>> Koen Kooi wrote:
>>>> On 01-10-2008 15:34, Nicola Mfb wrote:
>>>>> 2008/10/1 Kalev Lember<kalev@smartlink.ee>
>>>>> [...]
>>>>>
>>>>>> Well yes, but if you just do:
>>>>>> git clone git://git.openembedded.net/org.openembedded.dev
>>>>>>
>>>>>> you'll end up on master branch, which is not updating.
>>>>> Yes, the same here, i opened one of those bugs.
>>>>> I'm using a semiautomated makefile environment for fso/openmoko, this use
>>>>> git and not monotone, so this problem affects a lot of peoples, please
>>>>> fix!
>>>> That's what you get for using makefiles....
>>> How does a makefile affect the branches not being updated?
>> All org.openembedded.* branches are still being updated.
>
> So is the answer that the "master" branch in git it not planned on being
> used?  Or it will have some other use, documented over in ... ?  It
> sounds like the problem is that the policy on what to use in the git
> tree isn't published yet.  Or it is, and someone didn't read it.

The only supported way to use OE is via monotone, if you are using a 
makefile that's using something else you are SOL

>




