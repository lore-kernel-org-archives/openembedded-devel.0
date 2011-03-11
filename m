Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Py5Dl-0001Iq-On
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 17:29:45 +0100
Received: by wwb17 with SMTP id 17so2955222wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 08:28:06 -0800 (PST)
Received: by 10.227.170.67 with SMTP id c3mr8412868wbz.164.1299860886668;
	Fri, 11 Mar 2011 08:28:06 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id u9sm1226wbg.6.2011.03.11.08.28.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Mar 2011 08:28:05 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <AANLkTikgW-fVpgdZYnZ-VDrZabP2OPNMoORXF+jjfU=M@mail.gmail.com>
Date: Fri, 11 Mar 2011 17:28:05 +0100
Message-Id: <8428234C-1477-41A6-B143-07CCDEC6D58C@dominion.thruhere.net>
References: <ild7rh$50f$1@dough.gmane.org>
	<AANLkTikftdJ1_H3AyyQEU4EAz_8S--TywGFHmtAJa4S9@mail.gmail.com>
	<1A8F942C-25F4-4C7D-B9F6-A2B3827CA104@dominion.thruhere.net>
	<AANLkTikgW-fVpgdZYnZ-VDrZabP2OPNMoORXF+jjfU=M@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Backporting bitbake python fixes to 1.12 branch?
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
X-List-Received-Date: Fri, 11 Mar 2011 16:29:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mrt 2011, om 15:45 heeft Chris Larson het volgende geschreven:

> On Fri, Mar 11, 2011 at 7:38 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Op 11 mrt 2011, om 15:27 heeft Chris Larson het volgende geschreven:
>>=20
>>> On Fri, Mar 11, 2011 at 6:25 AM, Koen Kooi =
<k.kooi@student.utwente.nl> wrote:
>>>> Various people trying out the maintenance branch get stuck on =
"parsing
>>>> recipes: 0%" when using python 2.6.0 - 2.6.5-ish. I know master has
>>>> bugfixes for that, could someone please backport/cherrypick/rediff =
them
>>>> for the 1.12 branch?
>>>=20
>>> Pushed to the 1.12 branch. Thanks for the reminder :)
>>=20
>> Thanks for the quick response!
>=20
> By the way, can I take this as confirmation that this fix actually
> worked? I never got confirmation from anyone but myself that it fixed
> the problem :)

17:23 < koen> av500: did it get further?
17:24 < av500> koen: yes, its doing stuff
17:24 < av500> i forgot to tell it to use more cores

Looks like a confirmed fix!=


