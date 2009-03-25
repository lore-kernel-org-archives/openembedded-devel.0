Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LmXTJ-0006Vd-KU
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 19:05:01 +0100
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 1CA18D4808B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 19:03:23 +0100 (CET)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 34F44D481E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 19:03:21 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 59D0327844C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 19:03:25 +0100 (CET)
Message-ID: <49CA71ED.1080408@bolloretelecom.eu>
Date: Wed, 25 Mar 2009 19:03:25 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>	<49CA5638.1050000@dls.net>
	<gqdlka$cbd$1@ger.gmane.org>
In-Reply-To: <gqdlka$cbd$1@ger.gmane.org>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 18:05:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


> Another example: building qt/e for ppc405 will OOM[1] if you have a
> populated TMPDIR, it will work fine from scratch.
> We should certainly do builds from scratch to track down dependency and
> process bugs, but let's not forget about non-empty TMPDIR bugs.

Eh? That's scary! What version of Qt are we talking about? I routinely bu=
ild qt4/embedded
for powerpc targets (though admittedly not ppc405) without any problems.

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


