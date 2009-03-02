Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Le2Lv-0002Ow-0c
	for openembedded-devel@openembedded.org; Mon, 02 Mar 2009 08:14:15 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id AF43216E233
	for <openembedded-devel@openembedded.org>;
	Mon,  2 Mar 2009 08:23:53 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 02E342A420C
	for <openembedded-devel@openembedded.org>;
	Mon,  2 Mar 2009 08:10:24 +0100 (CET)
MIME-Version: 1.0
Date: Mon, 2 Mar 2009 08:10:04 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF6D5@hiob.intern.dresearch.de>
X-MimeOLE: Produced By Microsoft Exchange V6.5
In-Reply-To: <be7a9f3d0903010830u4d07af83i8e51bd075f945d75@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: OE - help with libtool problem
Thread-Index: AcmaivI9UY5K7WYpQHut+duiI6H/dAAeX9TQ
References: <499DB474.1070205@zone42.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF68E@hiob.intern.dresearch.de>
	<be7a9f3d0902200317x93d8888wd3e9ce41f0641d4c@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF695@hiob.intern.dresearch.de>
	<871vts4z4x.fsf@neumann.lab.ossystems.com.br>
	<49A01664.7090908@dresearch.de>
	<8763j1q3di.fsf@neumann.lab.ossystems.com.br>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF697@hiob.intern.dresearch.de>
	<be7a9f3d0902261002p4d663dd6p28bbf37cf5962dba@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF6C4@hiob.intern.dresearch.de>
	<be7a9f3d0903010830u4d07af83i8e51bd075f945d75@mail.gmail.com>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: "Otavio Salvador" <otavio@ossystems.com.br>
Cc: openembedded-devel@openembedded.org
Subject: Re: OE - help with libtool problem
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
X-List-Received-Date: Mon, 02 Mar 2009 07:14:15 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> >> I'll take a look at it. Will try to build it locally=20
> >> however it looks like neon doesn't build out of box.
> >> Are you using any patch related to it?
> >
> > Yes, see below (patch file://gnutls-2.patch was pushed=20
> > before to git).
>=20
> I've commited the neon patch in master and I failed to get=20
> subversion to build.

I didn't push this patch because i had no chance to test it until now. =
So let's hope it will work.

> It is rather strange that it behaves as it does since even updating
> the libtool it still fails. Since I'm not experienced at subversion
> and have no idea how to fix it I belive you'd need to ask someone else
> for help on that.

I've CC'ed this to the mailing list in the hope there is someone able to =
help.


