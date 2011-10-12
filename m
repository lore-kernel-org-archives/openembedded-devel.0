Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RDuP0-00077r-Sv
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 10:43:02 +0200
Received: from iph1.telenor.se (iph1.telenor.se [195.54.127.132])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id A63A4EA637
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 10:37:08 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aj0iAHhQlU5T4zkNPGdsb2JhbAAMN4R1lFmOdAEBAQE3ggUBAQEBAwEBASBLChELBBQJFgsCAgkDAgECARUBGxQTBgIBAYgCpheSFYZEgRQEkVuCGpFW
X-IronPort-AV: E=Sophos;i="4.69,333,1315173600"; 
	d="scan'208,217";a="494972661"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.244]) ([83.227.57.13])
	by iph1.telenor.se with ESMTP; 12 Oct 2011 10:37:08 +0200
Message-ID: <4E9551B3.6020606@telia.com>
Date: Wed, 12 Oct 2011 10:37:07 +0200
From: Ulf Samuelsson <ulf_samuelsson@telia.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E953D5E.3050908@telia.com> <1318408173.3556.4.camel@mattotaupa>
In-Reply-To: <1318408173.3556.4.camel@mattotaupa>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Can someone pls prune a few obsolete branches in openembedded?
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
X-List-Received-Date: Wed, 12 Oct 2011 08:43:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-12 10:29, Paul Menzel wrote:
> Dear Ulf,
>
>
> Am Mittwoch, den 12.10.2011, 09:10 +0200 schrieb Ulf Samuelsson:
>> All the branches:
>>
>> ulf/linux-2.6.30*
>> and
>> ulf/test
>>
>> are no longer in use.
>> All the stuff is already in mainline.
>>
>> Can someone please remove them?
> Is for example `git push origin :ulf/test` not working?
>
>
> Thanks,
>
> Paul
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

There are only a few people that can delete branches in openembedded.

$ git push origin :ulf/test

<LOCALE messages, skipped>

remote: + refs/heads/ulf/test openembedded ulf_samuelsson DENIED by fallthru
remote: error: hook declined to update refs/heads/ulf/test
To git@git.openembedded.org:openembedded
  ! [remote rejected] ulf/test (hook declined)
error: failed to push some refs to 'git@git.openembedded.org:openembedded'

-- 
Best Regards
Ulf Samuelsson


