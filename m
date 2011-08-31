Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QykJo-0000w4-Jv for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:55:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QykF4-00034z-E5 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:50:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:50:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:50:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 14:45:22 +0200
Message-ID: <j3lad2$v75$2@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
	<j3l22l$5ti$1@dough.gmane.org>
	<20110831115548.GB3273@chargestorm.se>
	<j3l8ni$kr3$1@dough.gmane.org>
	<CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <CAP9ODKrs1WvLOpHNKsJu0Uf7_8zFQ_GPrPz=+ttdy5tces2gjw@mail.gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 12:55:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 14:34, Otavio Salvador schreef:
> On Wed, Aug 31, 2011 at 09:16, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>>>>>> please remove PR in new recipes
>>>>> Actually I would favor to leave them in.
>>>> Well I don't, and atm I decide if it goes in or not.
>>> 
>>> To sad. It's a lot easier to remember to bump the PR, when PR
>>> actually is in the recipe. Thus, including PR=0 will often remove one
>>> issue with patches.
>> 
>> That's what review is for, no?
> 
> Review is to check for mistakes and dropping PR from new recipes just 
> makes hard for new users and put more work for people to review.
> 
> Please accept PR = "r0" on new recipes since it makes it more consistent
> and easy to new users.

Consistent in what way? If you want to be consistent you need to add *all*
variables to the recipe and set it to their default.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXiziMkyGM64RGpERArVFAJ9XOjQIEyuO2O170XTAlyduOxMYYwCeOXzk
oxzHXdyhx78QoZZOu/owDUU=
=J5Ow
-----END PGP SIGNATURE-----



