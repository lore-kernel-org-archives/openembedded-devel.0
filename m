Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=3794ea513=rich.pixley@palm.com>)
	id 1RvaPE-0006ou-Iq for openembedded-devel@lists.openembedded.org;
	Thu, 09 Feb 2012 21:15:48 +0100
X-IronPort-AV: E=Sophos;i="4.73,392,1325491200"; d="scan'208";a="11547559"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	09 Feb 2012 12:06:37 -0800
Received: from fuji.noir.com ([10.100.2.25])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q19K6PTj023809;
	Thu, 9 Feb 2012 12:06:25 -0800
Message-ID: <4F34274B.60502@palm.com>
Date: Thu, 09 Feb 2012 12:06:35 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F33048E.8030109@palm.com>
	<CAMKF1so61ndkzii_qK-sLiX6czvHXvaMFvBsxzm78z87zRTQkA@mail.gmail.com>
In-Reply-To: <CAMKF1so61ndkzii_qK-sLiX6czvHXvaMFvBsxzm78z87zRTQkA@mail.gmail.com>
Subject: Re: bitbake versions
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
X-List-Received-Date: Thu, 09 Feb 2012 20:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Er... wasn't doing so intentionally.  Was just following the "getting 
started" page on the wiki.

I think that page needs to be adjusted to at least warn folks that it's 
stale.  That probably isn't the right way to "get started" today.

I'll start over from 'core.

--rich

On 2/8/12 17:47 , Khem Raj wrote:
> On Wed, Feb 8, 2012 at 3:26 PM, Rich Pixley<rich.pixley@palm.com>  wrote:
>> I'm having trouble even parsing using bitbake>  1.12.
>>
>> Am I right in thinking that the openembedded tree isn't ready to be built
>> with bitbake>  1.12?
> I have used 1.10.x successfully with old oe classic but that was sometime ago
> if you want to use oe classic please use the
> 2011.03-maintenance branch you stand a better chance with that branch
>
>
>> If so, then the getting started document should probably include this info.
> yes getting started should reflect how to get started with layered oe.
>
>> --rich
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


