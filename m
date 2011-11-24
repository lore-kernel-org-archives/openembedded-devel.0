Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RTVSP-0008Ao-MC for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 10:19:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RTVM1-000108-Bh for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 10:12:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:12:25 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 10:12:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Nov 2011 10:12:11 +0100
Message-ID: <jal1pc$2u7$1@dough.gmane.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <4ECD76E2.3040001@opendreambox.org>
X-Enigmail-Version: 1.3.3
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
X-List-Received-Date: Thu, 24 Nov 2011 09:19:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-11-11 23:42, Andreas Oberritter schreef:
> On 23.11.2011 23:25, Khem Raj wrote:
>> On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks 
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2011/11/23 Khem Raj <raj.khem@gmail.com>
>>> 
>>>> On Thu, Oct 27, 2011 at 3:53 AM, Mats Kärrman
>>>> <Mats.Karrman@tritech.se> wrote:
>>>>> Hi,
>>>>> 
>>>>> Are there any plans for new releases and/or maintenance branches
>>>>> of OE
>>>> classic?
>>>>> 
>>>> 
>>>> 2011.03-maintenance is the last release of OE classic. As long as
>>>> the branch is maintained
>>>> 
>>>> _
>>>> 
>>>> Related: I noticed TSC plans to discuss on whether or not to make
>>>> oe
>>> classic read only.
>>> 
>>> I'd like to suggest leaving it open for those of us that are still
>>> using it.
>> 
>> 2011.03-maintenance branch is maintained and that would be place to
>> go.
>> 
>> 
>>> For instance I have still products that are based on OE classic. If
>>> there is a problem that is of a generic nature, I'm more than happy
>>> to submit patches so others in the same situation can benefit from
>>> it. (actually I have one pending with a new version of netsnmp; the
>>> current recipe does not build with uclibc, whereas the latest version
>>> of netsnmp does; found/fixed this today, but haven't had time to make
>>> a commit)
>>> 
>>> And if there is no interest any more it'll eventually die. But as of
>>> now I do see people working on/with it (see the commit log).
>> 
>> those fixes are intended for 2011.03-maintenance which go into master
>> and then get cherry-picked
> 
> So master needs to stay open in order to get patches there first before 
> being cherry-picked into 2011.03-maintenance, right?

That has been stated multiple times before: No, OE-classic is not the only
way patches can flow into 2011.03-maintenance. It's even listed in the damn
wiki: http://www.openembedded.org/wiki/2011.03-maintenance

OE .dev will go read-only soon, If you need an OE-classic setup,
2011.03-maintenance is there for you.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7OCmgACgkQMkyGM64RGpF6CACeNE8dbi9QIHSKXUtMbGo87Tj5
RewAn0M/iVo9uIqVMPjBCrBt9m9SqwAg
=xqiO
-----END PGP SIGNATURE-----



