Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RlUmk-00015i-Hs
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jan 2012 01:14:22 +0100
Received: from mail133-ch1-R.bigfish.com (10.43.68.242) by
	CH1EHSOBE003.bigfish.com (10.43.70.53) with Microsoft SMTP Server id
	14.1.225.23; Fri, 13 Jan 2012 00:06:50 +0000
Received: from mail133-ch1 (localhost [127.0.0.1])	by
	mail133-ch1-R.bigfish.com (Postfix) with ESMTP id 7DBDA300124	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 00:06:50 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zz154cP9371I1432N98dKzz1202hzz8275ch8275bh8275dhz2dhc1ahc1bh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail133-ch1 (localhost.localdomain [127.0.0.1]) by mail133-ch1
	(MessageSwitch) id 1326413208364749_2540;
	Fri, 13 Jan 2012 00:06:48 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail133-ch1.bigfish.com (Postfix) with ESMTP id
	5460BC0045 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2012 00:06:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 13 Jan 2012 00:06:48 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Thu, 12 Jan 2012 18:06:47 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] meta-oe post holiday patchwork cleanup
Thread-Index: AQHM0Yc9G6PoW02HQEmcnDa15yGxrw==
Date: Fri, 13 Jan 2012 00:06:47 +0000
Message-ID: <CAEsOVNevm9gf7xvXSyQBeuxA-GmSeco1FVTVejyEYLk_dtp76Q@mail.gmail.com>
References: <jemqcg$1q0$1@dough.gmane.org>
	<CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
In-Reply-To: <CAPOJ94ND1+KeABgs-v_m07L3pZDJg+7kReTKNEvLe27rngNGeA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: meta-oe post holiday patchwork cleanup
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
X-List-Received-Date: Fri, 13 Jan 2012 00:14:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1FC4B6169B3A7A4DA7EA2D138C8C0037@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 5:26 PM, Peter Bigot <bigotp@acm.org> wrote:
> On Thu, Jan 12, 2012 at 8:23 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> tl;dr version: get your subject-prefix right
>>
>> Hi,
>>
>> I've cleaned up patchwork by marking every meta-oe patch as archived, mi=
nus
>> the one Martin just sent.
>>
>> This means all the pending patches for meta-oe are listed here:
>>
>> http://patches.openembedded.org/project/oe/list/?q=3Dmeta-oe
>>
>> If your patches are missing, resend them using the method outlined in th=
e
>> README of the respective meta-openembedded layer.
>>
>> I'll include the meta-oe one below, since too many patches still don't c=
omply:
>>
>> - ----------------------------------------------------------------------=
-----
>>
>> This layer depends on:
>>
>> URI: git://git.openembedded.org/openembedded-core
>> branch: master
>> revision: HEAD
>>
>> Send pull requests to openembedded-devel@lists.openembedded.org with
>> '[meta-oe]' in the subject'
>>
>> When sending single patches, please use something like 'git send-email -=
1
>> - --to openembedded-devel@lists.openembedded.org --subject-prefix meta-o=
e'
>>
>> You are encouraged to fork the mirror on github
>> https://github.com/openembedded/meta-oe/ to share your patches, this is
>> preferred for patch sets consisting of more than one patch. Other servic=
es
>> like gitorious, repo.or.cz or self hosted setups are of course accepted =
as
>> well, 'git fetch <remote>' works the same on all of them. We recommend
>> github because it is free, easy to use, has been proven to be reliable a=
nd
>> has a really good web GUI.
>>
>> Main layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
>>
>> - ----------------------------------------------------------------------=
-----
>>
>> The most important thing of that is the subject prefix. I only read emai=
ls
>> with a [meta-<foo>] subject prefix on oe-devel nowadays and I look at
>> http://patches.openembedded.org/project/oe/list/?q=3Dmeta- more often th=
an
>> oe-devel.
>>
>> So: Get your subject-prefix right
>>
>> And kudos to Andreas, Martin and Otavio for getting their pull requests
>> right pretty much all the time.
>
> While I appreciate that a blanket "throw it out; if they care they'll
> resend it" approach is an effective way to deal with the backlog
> resulting from an absence, I don't appreciate that in addition to the
> time I spent crafting patches to improve oe-core and submitting them
> (with the right prefix AFAIK), I am now expected to do so again.
> Further, the archived discussion of one of my patches included a
> request for clarification on how to address a licensing issue which
> was never answered, and which now presumably never will be.
>
> This sort of practice discourages people (well, me at least) from
> contributing to this project.

Perhaps you can just mark them correctly in patchworks again instead
of resubmitting? Somewhat easier, you can even keep a list of patch
id's and do this automatically via the pwclient.

-M=



