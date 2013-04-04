Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNrfG-0001b9-15
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Apr 2013 23:25:48 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 73D6A27527
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Apr 2013 23:08:33 +0200 (CEST)
Message-ID: <515DEBD2.2040608@pseudoterminal.org>
Date: Thu, 04 Apr 2013 23:08:34 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <515DE693.1050601@pseudoterminal.org>
	<CA+chaQf0r77KGfkdT7ZNU=TXgXz-Jh3KxG82+=Lh9eVx+qHyOw@mail.gmail.com>
	<CA+chaQfJxXkFjA7+L9qzx7LzQE2zAbBAG105VkYAgMfJaGexqw@mail.gmail.com>
In-Reply-To: <CA+chaQfJxXkFjA7+L9qzx7LzQE2zAbBAG105VkYAgMfJaGexqw@mail.gmail.com>
Subject: Re: DEFAULTTUNE_<machine> not working
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
X-List-Received-Date: Thu, 04 Apr 2013 21:25:48 -0000
X-List-Received-Date: Thu, 04 Apr 2013 21:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Many thanks, bitbake -e shows that callconvention-hard is indeed present 
in the TUNE_FEATURES list, and bitbake comes without the patch mentioned 
in that link.
Mystery solved :)

On 2013-04-04 23:03, Martin Jansa wrote:
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/30164
>
>
> On Thu, Apr 4, 2013 at 11:02 PM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> Check with bitbake -e, don't trust the header shown at the beginning of
>> build log.
>>
>>
>> On Thu, Apr 4, 2013 at 10:46 PM, Carlos Rafael Giani <
>> dv@pseudoterminal.org> wrote:
>>
>>



