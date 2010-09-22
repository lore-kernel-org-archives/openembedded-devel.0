Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1OyKUt-00042u-Ba
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 10:16:11 +0200
Received: from [192.168.0.5] (87.30.7.56) by smtp208.alice.it (8.5.124.08)
	id 4C1A271605EC6649 for openembedded-devel@lists.openembedded.org;
	Wed, 22 Sep 2010 10:01:32 +0200
Message-ID: <4C99B7DB.8040602@gmail.com>
Date: Wed, 22 Sep 2010 10:01:31 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C9950D0.7000907@gmail.com>	<201009220913.06632.marcin@juszkiewicz.com.pl>
	<AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>
In-Reply-To: <AANLkTi==90GdQHqJufKx6HEaOsM-y-Sgb7E8WsH0Zmvg@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.57.200.104
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] at91bootstrap.inc: Mark COMPATIBLE_MACHINEs.
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
X-List-Received-Date: Wed, 22 Sep 2010 08:16:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: Quoted-Printable

Graham Gower ha scritto, Il 22/09/2010 09:36:
> On 22 September 2010 16:43, Marcin Juszkiewicz
> <marcin@juszkiewicz.com.pl> wrote:
>> Dnia =C5=9Broda, 22 wrze=C5=9Bnia 2010 o 02:41:52 Graham Gower napisa=C5=
=82(a):
>>
>>> --- a/recipes/at91bootstrap/at91bootstrap.inc
>>> +++ b/recipes/at91bootstrap/at91bootstrap.inc
>>> +COMPATIBLE_MACHINE =3D
>>> "(afeb9260|at91cap9adk|at91sam9g20ek|at91sam9rlek|at91sam9263ek|at91s=
am926
>>> 0ek|at91sam9xeek|at91sam9261ek)"
>> mk355 is also atmel at91sam9263 so at91bootstrap is used on it probabl=
y.
>>
>=20
> The compatible machines here are those that have a defconfig in the
> the files/ directory.
>=20

Yes please
mh55 is also atmel at91sam9263 so at91bootstrap is used on it too.
It also have its defconfig in the recipes/linux/linux-2.6.28/mh355/
directory.


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


