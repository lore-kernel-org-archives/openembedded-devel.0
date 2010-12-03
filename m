Received: from mail.dns-net.ch ([195.160.190.3] helo=111.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.aeschlimann@acn-group.ch>) id 1POQCi-0001Ut-Ad
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 08:37:17 +0100
Received: from [172.16.145.92] (unknown [212.98.42.40])
	by 111.com (Postfix) with ESMTPA id 0B8D62F071
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Dec 2010 08:35:53 +0100 (CET)
Message-ID: <4CF89DD9.4030904@acn-group.ch>
Date: Fri, 03 Dec 2010 08:35:53 +0100
From: Christophe Aeschlimann <c.aeschlimann@acn-group.ch>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF68D24.80900@lambsys.com>	<20101201180621.GB20482@excalibur.local>	<4CF69653.5000504@lambsys.com>	<20101201185406.GC20482@excalibur.local>	<AANLkTins+XE2Zq2P=wBHUc9N9XvD0f+t7zdyVjNevggS@mail.gmail.com>	<4CF80383.6010401@lambsys.com>
	<AANLkTimBA8-FcoVsePaoe8zi8FcdcZxRhupsviF8VWQC@mail.gmail.com>
In-Reply-To: <AANLkTimBA8-FcoVsePaoe8zi8FcdcZxRhupsviF8VWQC@mail.gmail.com>
X-SA-Exim-Connect-IP: 195.160.190.3
X-SA-Exim-Mail-From: c.aeschlimann@acn-group.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Documentation
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
X-List-Received-Date: Fri, 03 Dec 2010 07:37:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On 02.12.2010 21:52, Robert Foerster wrote:
> On Thu, Dec 2, 2010 at 3:37 PM, David Lambert <dave@lambsys.com> wrote:
>=20
>> Thanks for all the suggestions. While on the subject, does a dictionar=
y of
>> keywords with their meanings exist anywhere? Newbies like me may find =
it
>> very useful when browsing recipes. Some terms are intuitively obvious,=
 such
>> as DEV_BASE, but others such as PR, INHERIT, PV, leave me with some
>> ambiguity.
>>
>>
> Some info can be found in the manual:
> http://docs.openembedded.org/usermanual/usermanual.html#recipes_version=
ing
> Discussed in the manual are many of the items which are initially confu=
sing:
> P, PN, PV, PR, PF, S, D, WORDIR, etc

The poky handbook also gives a few useful definitions:

http://www.pokylinux.org/releases/green-3.3/doc/poky-handbook.html#var-gl=
ossary-a

>=20
> Also useful is to read the bitbake manual, which defines the basic meta=
data
> syntax handled by bitbake. http://bitbake.berlios.de/manual/
>=20
> Hope that helps.
> Bob
>=20

[...]


--=20
Christophe Aeschlimann

Embedded Software Engineer

Advanced Communications Networks S.A.

Rue du Puits-Godet 8a
2000 Neuch=E2tel, Switzerland

T=E9l. +41 32 724 74 31

c.aeschlimann@acn-group.ch


