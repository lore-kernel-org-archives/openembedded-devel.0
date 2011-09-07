Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1HFx-0006w9-VR
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 14:29:30 +0200
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id DFAA14B01C1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2011 14:24:25 +0200 (CEST)
Message-ID: <4E676278.5090803@eukrea.com>
Date: Wed, 07 Sep 2011 14:24:24 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1315349980-6611-1-git-send-email-eric@eukrea.com>
	<1315387357-21355-1-git-send-email-eric@eukrea.com>
	<CAAQYJAtpPps4s7Y5FYEmOYCUX3ynwY+_Hn=37KD2xbDD2k3hrg@mail.gmail.com>
	<20110907103848.GB19221@jama.jama.net>
In-Reply-To: <20110907103848.GB19221@jama.jama.net>
Subject: Re: [meta-oe v2] tzdata & tzcode: update to 2011i
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
X-List-Received-Date: Wed, 07 Sep 2011 12:29:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 07/09/2011 12:38, Martin Jansa a =E9crit :
> On Wed, Sep 07, 2011 at 12:25:44PM +0200, Andrea Adami wrote:
>> tzdata and tzcode 2011i are already in oe-core.
>> Why do we keep another version here? Maybe because the different do_in=
stall?
>
> I've imported 2011e from meta-shr to meta-oe on Sun, 10 Apr 2011, just
> because oe-core had 2010o in that time and I didn't want to downgrade.
> Now with newer version in oe-core already I'm fine with dropping it fro=
m
> meta-oe.
>
ok I was asking myself the same question while doing the patch ;-)
I'll update the patch to drop it from meta-oe

Eric



