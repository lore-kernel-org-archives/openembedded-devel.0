Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1RTWYw-0003ui-MJ for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 11:29:50 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id pAOANBH8006789
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 11:23:17 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 24 Nov 2011 11:23:14 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 24 Nov 2011 11:23:13 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Plans for OE classic future
Thread-Index: AQHMqiEmklF2+ZuH1E2iU/5HPfN1AJW65byAgAASxgCAAATjAIAAqPbbgAAqqCA=
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se><CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com><CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com><CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>,
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 24 Nov 2011 10:23:14.0100 (UTC)
	FILETIME=[12E7D740:01CCAA93]
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
X-List-Received-Date: Thu, 24 Nov 2011 10:29:50 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I would vote for an open classic master for bugfixing too, our project =
based on 2011.03-maintenance goes into the final phase and to switch to =
oe-core, the budged is not available jet.

Regards=20
Wolfgang Hauser
 =20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Mats K=E4rrman
Gesendet: Donnerstag, 24. November 2011 09:04
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Plans for OE classic future

>From: openembedded-devel-bounces@lists.openembedded.org =
[openembedded-devel-bounces@lists.openembedded.org] on behalf of Andreas =
Oberritter [obi@opendreambox.org]
>Sent: Wednesday, November 23, 2011 11:42 PM
>To: openembedded-devel@lists.openembedded.org
>Subject: Re: [oe] Plans for OE classic future
>
>On 23.11.2011 23:25, Khem Raj wrote:
>> On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2011/11/23 Khem Raj <raj.khem@gmail.com>
>>>
>>>> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=E4rrman =
<Mats.Karrman@tritech.se>
>>>> wrote:
>>>>> Hi,
>>>>>
>>>>> Are there any plans for new releases and/or maintenance branches =
of OE
>>>> classic?
>>>>>
>>>>
>>>> 2011.03-maintenance is the last release of OE classic. As long as =
the
>>>> branch is maintained
>>>>
>>>> _
>>>>
>>>> Related: I noticed TSC plans to discuss on whether or not to make =
oe
>>> classic read only.
>>>
>>> I'd like to suggest leaving it open for those of us that are still =
using
>>> it.
>>
>> 2011.03-maintenance branch is maintained and that would be place to =
go.
>>
>>
>>> For instance I have still products that are based on OE classic. If =
there
>>> is a problem that is of a generic nature, I'm more than happy to =
submit
>>> patches so others in the same situation can benefit from it.
>>> (actually I have one pending with a new version of netsnmp; the =
current
>>> recipe does not build with uclibc, whereas the latest version of =
netsnmp
>>> does; found/fixed this today, but haven't had time to make a commit)
>>>
>>> And if there is no interest any more it'll eventually die. But as of =
now I
>>> do see people working on/with it (see the commit log).
>>
>> those fixes are intended for 2011.03-maintenance which go into master =
and then
>> get cherry-picked
>
> So master needs to stay open in order to get patches there first =
before
> being cherry-picked into 2011.03-maintenance, right?
>
> I also don't like the idea to make it read-only. Those who already
> switched to oe-core are free to just ignore the classic master branch.
> Others should still be able to push bugfixes etc, if they care enough
> about it.
>
> Regards,
> Andreas

I have a project based on 2011.03-maintenance that is about to reach =
final
testing and I don't have the confidence (or the budget) to make a switch =
to
oe-core now. However only yesterday I had failing builds due to
missing/obsolete package versions.
--> One more vote to keep classic open!

BR // Mats

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


