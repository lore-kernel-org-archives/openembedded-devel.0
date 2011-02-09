Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnBLi-00048e-El
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 15:48:54 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnBKf-0005Zv-Pk from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 06:47:49 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 06:47:49 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 07:47:48 -0700
Message-ID: <4D52A910.4060407@mentor.com>
Date: Wed, 09 Feb 2011 07:47:44 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D519C83.9060502@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
X-OriginalArrivalTime: 09 Feb 2011 14:47:48.0752 (UTC)
	FILETIME=[51F78100:01CBC868]
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 14:48:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2011 02:25 AM, Aeschbacher, Fabrice wrote:
> Hi all,
>
> There are two things which could be useful (IMO) for OE users:
>
> 1. a small README file (or wiki page) just highlighting the main
>     changes since last release (2010.12), e.g. something like
>     "Prominent features (the cool stuff)" on http://kernelnewbies.org/LinuxChanges
>     This would help us OE users to decice whether it is worth rebasing on the latest
>     release now, or if it can wait

Great idea!  I've added a place-holder to the wiki page for the release.

> 2. Do not delete the release branch after 2011.03 will be released (just like
>     it was done for 2010.12), but let it live and allow developpers committing
>     bug-fixes (backporting choosen things?) reported back by OE users (some would
>     would be happy to contribute this way)

My _hope_ is to not have to make a branch to take from, but we shall 
see.  Beyond that, I see the discussion about keeping something that's 
not just top of tree alive as an important but only related discussion. 
  Starting from the release tag is probably the best bet, should 
something want to happen in that direction.

-- 
Tom Rini
Mentor Graphics Corporation


