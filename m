Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1PhO92-00047J-2y
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 16:15:52 +0100
Received: (qmail 29600 invoked by uid 1003); 24 Jan 2011 15:15:00 -0000
Received: from unknown (HELO ?192.168.0.104?) (philip@opensdr.com@207.47.37.2)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Jan 2011 15:15:00 -0000
Message-ID: <4D3D9777.6060109@balister.org>
Date: Mon, 24 Jan 2011 07:15:03 -0800
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1295834629-3974-1-git-send-email-raj.khem@gmail.com>	<ihjf6u$c5u$1@dough.gmane.org>	<AANLkTin6h0bLj=s=ngGQrJMEQx2PBfK3hbm54nsmXari@mail.gmail.com>	<ihjhd3$n1e$1@dough.gmane.org>
	<AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
In-Reply-To: <AANLkTikqMQ8_xZZUjrm3Cu2GVJ5COM0u5PFuGAvyst+2@mail.gmail.com>
Subject: Re: [PATCH] angstrom-2010.x.conf: Prefer binutils 2.21 and	uclibc-git
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
X-List-Received-Date: Mon, 24 Jan 2011 15:15:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/24/2011 01:59 AM, Frans Meulenbroeks wrote:
> 2011/1/24 Koen Kooi<k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
> Pushing distro changes without review is against the policy:
>
>> From http://www.openembedded.org/index.php/Commit_Policy:
>
>   * Distro config changes should be reviewed by the distro maintainers
>     where known
>
> Reveting changes from others is also against the policy:
>
> http://www.openembedded.org/index.php/Revert_Policy
>
> (and imho equally bad (or insulting if you prefer))
>
>
> Do unto others as you would have them do unto you
>
> My two eurocents. Frans.

Frans, as noted this change intoduces serious issues with some Angstrom 
targets. The Angstrom devs know what is best for Angstrom. I'm not sure 
what Khem was thinking by pushing this change without consulting with 
Angstrom devs.

Philip


