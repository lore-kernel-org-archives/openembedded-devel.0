Received: from 5.97.mail-out.ovh.net ([188.165.48.85] helo=97.mail-out.ovh.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QYIbF-0002NH-E0
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 16:03:41 +0200
Received: from mail422.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 97.mail-out.ovh.net (Postfix) with SMTP id 33B684AAE62
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2011 12:22:23 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Jun 2011 12:21:00 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Jun 2011 12:20:59 +0200
Message-ID: <4DFDCD8B.9080309@eukrea.com>
Date: Sun, 19 Jun 2011 12:20:59 +0200
From: =?ISO-8859-2?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DFC4A9F.9080104@gmx.net> <4DFC51D6.5080508@eukrea.com>
	<20110619091521.GC23890@ibawizard.net>
In-Reply-To: <20110619091521.GC23890@ibawizard.net>
X-Ovh-Tracer-Id: 14810931801649360201
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -112
X-VR-SPAMCAUSE: Vade Retro 01.322.06 AV+AS Profile: OVH; Bailout: 300;
	Url TLD (8); (-100); linux2x (-20)
Subject: Re: FYI: Snowball (new low-cost board similar to beagle/panda)
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
X-List-Received-Date: Sun, 19 Jun 2011 14:03:41 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19/06/2011 11:15, Petr =A9tetiar wrote:
> Eric B=E9nard<eric@eukrea.com>  [2011-06-18 09:20:54]:
>
>> it was announced on linux devices :
>> http://www.linuxfordevices.com/c/a/News/Calao-Systems-Snowball/ but as=
 you
>> can see on their "community" site there are not much news since this d=
ate :
>> http://www.igloocommunity.org/
>
> I wonder, if that SOC used on this board is going to be as "easily" sou=
rceable
> as it's the Omap4 on Pandaboard. Or it's meant to be sourced in the hug=
e
> quantities only also?
>
OMAP4 is actually not easily sourceable, TI's web site says :
"This product is intended for high-volume wireless OEMs and ODMs and is n=
ot=20
available through distributors."

>> If you want to pay for an "open" board to become a "free" beta tester =
for
>> an other phone/tablet cpu manufacturer you can also wait for
>> http://www.origenboard.org/
>
> Ditto.
>
> And I sometimes wonder, which company is going to trademark some of the
> buzzwords around the "free/open/community" first or even patent some ki=
nd of
> "free/open/community" work flow :-)
>
>> Next one in the list may be using an iMX6 from Freescale (in the page,=
 this
>> one is said to also target industrial applications and not only
>> phones/tablets) :
>> http://www.freescale.com/webapp/sps/site/overview.jsp?code=3DIMX6X_SER=
IES
>> which will surely have its equivalent of the i.MX53's QSB :
>> http://www.freescale.com/webapp/sps/site/prod_summary.jsp?code=3DIMX53=
QSB
>
> Good to know, I was wondering last week, what is that Loco board in the=
 Linux
> kernel tree :-)
>
loco is qsb here again it's not clear why they chose loco for the board n=
ame=20
in the kernel and qsb for the product name on the shelf ...

Eric


