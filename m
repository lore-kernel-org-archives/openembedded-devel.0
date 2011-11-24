Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RTUOK-0005R6-Ex
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 09:10:44 +0100
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id pAO83vau004879
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 09:04:02 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Thu, 24 Nov 2011 09:03:55 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Plans for OE classic future
Thread-Index: AQHMqiEmklF2+ZuH1E2iU/5HPfN1AJW65byAgAASxgCAAATjAIAAqPbb
Date: Thu, 24 Nov 2011 08:03:54 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>,
	<4ECD76E2.3040001@opendreambox.org>
In-Reply-To: <4ECD76E2.3040001@opendreambox.org>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Thu, 24 Nov 2011 08:10:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>From: openembedded-devel-bounces@lists.openembedded.org [openembedded-deve=
l-bounces@lists.openembedded.org] on behalf of Andreas Oberritter [obi@open=
dreambox.org]=0A=
>Sent: Wednesday, November 23, 2011 11:42 PM=0A=
>To: openembedded-devel@lists.openembedded.org=0A=
>Subject: Re: [oe] Plans for OE classic future=0A=
>=0A=
>On 23.11.2011 23:25, Khem Raj wrote:=0A=
>> On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks=0A=
>> <fransmeulenbroeks@gmail.com> wrote:=0A=
>>> 2011/11/23 Khem Raj <raj.khem@gmail.com>=0A=
>>>=0A=
>>>> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=E4rrman <Mats.Karrman@tritech.=
se>=0A=
>>>> wrote:=0A=
>>>>> Hi,=0A=
>>>>>=0A=
>>>>> Are there any plans for new releases and/or maintenance branches of O=
E=0A=
>>>> classic?=0A=
>>>>>=0A=
>>>>=0A=
>>>> 2011.03-maintenance is the last release of OE classic. As long as the=
=0A=
>>>> branch is maintained=0A=
>>>>=0A=
>>>> _=0A=
>>>>=0A=
>>>> Related: I noticed TSC plans to discuss on whether or not to make oe=
=0A=
>>> classic read only.=0A=
>>>=0A=
>>> I'd like to suggest leaving it open for those of us that are still usin=
g=0A=
>>> it.=0A=
>>=0A=
>> 2011.03-maintenance branch is maintained and that would be place to go.=
=0A=
>>=0A=
>>=0A=
>>> For instance I have still products that are based on OE classic. If the=
re=0A=
>>> is a problem that is of a generic nature, I'm more than happy to submit=
=0A=
>>> patches so others in the same situation can benefit from it.=0A=
>>> (actually I have one pending with a new version of netsnmp; the current=
=0A=
>>> recipe does not build with uclibc, whereas the latest version of netsnm=
p=0A=
>>> does; found/fixed this today, but haven't had time to make a commit)=0A=
>>>=0A=
>>> And if there is no interest any more it'll eventually die. But as of no=
w I=0A=
>>> do see people working on/with it (see the commit log).=0A=
>>=0A=
>> those fixes are intended for 2011.03-maintenance which go into master an=
d then=0A=
>> get cherry-picked=0A=
>=0A=
> So master needs to stay open in order to get patches there first before=
=0A=
> being cherry-picked into 2011.03-maintenance, right?=0A=
>=0A=
> I also don't like the idea to make it read-only. Those who already=0A=
> switched to oe-core are free to just ignore the classic master branch.=0A=
> Others should still be able to push bugfixes etc, if they care enough=0A=
> about it.=0A=
>=0A=
> Regards,=0A=
> Andreas=0A=
=0A=
I have a project based on 2011.03-maintenance that is about to reach final=
=0A=
testing and I don't have the confidence (or the budget) to make a switch to=
=0A=
oe-core now. However only yesterday I had failing builds due to=0A=
missing/obsolete package versions.=0A=
--> One more vote to keep classic open!=0A=
=0A=
BR // Mats=0A=
=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


