Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1R38DE-0005yb-DD
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Sep 2011 17:14:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 20FCB2C7DA;
	Mon, 12 Sep 2011 15:04:25 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VN2FxZQiKEwu; Mon, 12 Sep 2011 15:04:21 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id A500C2C7D7;
	Mon, 12 Sep 2011 15:04:20 +0000 (UTC)
Message-ID: <4E6E2092.6060909@gmail.com>
Date: Mon, 12 Sep 2011 17:09:06 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4E69E904.6050109@dresearch-fe.de>
	<4E6E14EC.1000301@dresearch-fe.de> <4E6E1B35.7040709@gmail.com>
	<4E6E1CBB.3010702@dresearch-fe.de>
In-Reply-To: <4E6E1CBB.3010702@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: How to verify patches for oe-dev master?
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
X-List-Received-Date: Mon, 12 Sep 2011 15:14:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Steffen Sledz ha scritto, Il 12/09/2011 16:52:
> On 12.09.2011 16:46, Marco Cavallini wrote:
>> Steffen Sledz ha scritto, Il 12/09/2011 16:19:
>>> On 09.09.2011 12:23, Steffen Sledz wrote:
>>>> At the moment we're using the 2011.03-maintenance branch with angstr=
om-2008.1, and we have a problem verifying patches.
>>>>
>>>> Assuming we've found a fix to a bug in 2011.03-maintenance. In my op=
inion the fix should go to oe-dev master first and find it's way to 2011.=
03-maintenance by a pull request.
>>>>
>>>> The problem is that oe-master does not support angstrom-2008.1 any m=
ore, so it's hard to check if the patch compiles/runs well under oe-maste=
r.
>>> Let me reword the question.
>>>
>>> Which "general purpose" distros are supported by oe-dev master at the=
 moment and can be used to check if a patch applies, compiles, and runs?
>>>
>> Hi Steffen,
>> KaeilOS distro is working in oe-dev master at the moment, but I can't
>> guarantee that all recipes will work properly with it.
>>
>> http://www.kaeilos.com/
>>
>> Feel free to test it if you want.
>=20
> Thanx for this info. Do you have an easy to use example setup for build=
ing KaeilOS?
>=20

You can follow this step-by-step guide
http://www.kaeilos.com/download

HTH


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


