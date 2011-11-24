Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RTdSh-0005iC-1Y for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:51:51 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RTdMN-0003bn-69 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Nov 2011 18:45:19 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 18:45:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Nov 2011 18:45:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Nov 2011 18:45:07 +0100
Message-ID: <jalvr1$3bl$1@dough.gmane.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 24 Nov 2011 17:51:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-11-11 12:43, Otavio Salvador schreef:
> On Thu, Nov 24, 2011 at 09:33, Paul Menzel < 
> paulepanter@users.sourceforge.net> wrote:
> 
>> Am Donnerstag, den 24.11.2011, 09:12 -0200 schrieb Otavio Salvador:
>>> On Thu, Nov 24, 2011 at 08:23, Hauser, Wolfgang (external) wrote:
>>> 
>>>> I would vote for an open classic master for bugfixing too, our
>>>> project based on 2011.03-maintenance goes into the final phase and
>>>> to switch to oe-core, the budged is not available jet.
>>> 
>>> I also believe oe-classic master ought to be read-only as soon as
>> possible;
>>> I understand that people are using it but the soonner we make it
>> read-only,
>>> sooner people will move to oe-core otherwise people will keep
>>> starting
>> new
>>> project on it and it will never die.
>> 
>> You seem to use OE-core and meta-oe already so I understand your point 
>> of view. Martin, Koen, Andreas and you are doing the major work for 
>> meta-oe and not a lot of other people contribute.
>> 
>> In my opinion it is a bad sign to force people to switch. OE-core and 
>> meta-oe should be so appealing that they switch by themselves. My 
>> impression from reading the list and from IRC is that a lot of people 
>> still have objections and are not totally comfortable. Good community 
>> management would be to listen to these people then try to find
>> solutions and implement them. People then should come by themselves.
>> 
> 
> In fact I use both. The projects running at oe-classic are working well
> and will be kept running that way but all new ones are based on oe-core
> + meta-oe.

With both my angstrom and TI hat on: I use both 2011.03-maintenance and OE-core.

> I am not against oe-classic maintainence branch and people contributting 
> new fixes but I am against the work on new features and recipes being
> put on master branch.

Exactly!

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7OgqAACgkQMkyGM64RGpF3TgCfWAfwcn7rIZD4cdfHVf1GQW1h
PiIAnRrWDAeKvSeSoitXe8JC3ZJsnRY0
=9/Cy
-----END PGP SIGNATURE-----



