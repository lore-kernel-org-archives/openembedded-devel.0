Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4aX5-000774-06
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 17:40:51 +0200
Received: by wyh21 with SMTP id 21so4010643wyh.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 08:35:38 -0700 (PDT)
Received: by 10.227.7.141 with SMTP id d13mr841709wbd.78.1316187338059;
	Fri, 16 Sep 2011 08:35:38 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r3sm12986454wbm.18.2011.09.16.08.35.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 08:35:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E736B6C.9060906@dresearch-fe.de>
Date: Fri, 16 Sep 2011 17:35:34 +0200
Message-Id: <BCB7BFA2-281B-42CA-B699-D067CA80D12A@dominion.thruhere.net>
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Fri, 16 Sep 2011 15:40:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 17:29 heeft Steffen Sledz het volgende geschreven:

> On 14.09.2011 17:31, Steffen Sledz wrote:
>> If i remember right there are some first experiments with using =
upstart as an sysvinit replacement in some oe based distros.
>>=20
>> Do some guidelines or suggestions exist to make an application =
recipes upstart ready?
>>=20
>> Nowadays a recipe for a common service contains INITSCRIPT_NAME & Co =
and installs an init script for sysvinit.
>>=20
>> How should such a recipe be modified to be able to install the =
application in a native upstart image (without sysvinit compatible =
runlevels)?
>=20
> Let me put it in concrete terms.
>=20
> Is it possible to write a bb recipe in a way like this?
>=20
> ---------------------->snip<-------------------------
> ...
> IF IMAGE USES UPSTART AS INIT THEN

images are orthogonal to recipe, so no

And stop being so bloody annoying with CC:, oe.dev is a closed list, so =
people that post are subscribed=


