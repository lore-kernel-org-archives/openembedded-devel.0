Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Py1JF-0003j8-2y for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 13:19:09 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Py1Hd-0003TA-8x for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 13:17:29 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 13:17:29 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 13:17:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 11 Mar 2011 13:17:16 +0100
Message-ID: <ild3sc$enc$1@dough.gmane.org>
References: <20110311081950.GG7353@excalibur.local>	<ilcokq$g5i$1@dough.gmane.org>
	<20110311101752.GI7353@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110311101752.GI7353@excalibur.local>
X-Enigmail-Version: 1.0.1
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 11 Mar 2011 12:19:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-03-11 11:17, Stefan Schmidt wrote:
> Hello.
> 
> On Fri, 2011-03-11 at 10:05, Koen Kooi wrote:
>> On 11-03-11 09:19, Stefan Schmidt wrote:
>>>
>>> This topic has come up several times now and it did come up again during a TSC
>>> meeting yesterday.
>>>
>>> It feels like the current OE bugzilla is not in really good shape. The question
>>> is how we are going to handle this. On the one hand it might be good to remove
>>> as it holds a lot outdated informations and it seems developers are not using it
>>> at all.
>>>
>>> On the other hand this would cut off a service for atcual users of OE.
>>>
>>> If we can find a group of people that is willing to clean the current bugzilla
>>> up improve it and make sure that problems in it are actually worked on it still
>>> have a chance to stay. We need a clear maintainership for it and bugs need
>>> atcually be worked.
>>>
>>> Comments? Volunteers?
>>
>> Just kill it already, for OE-core we can use the yocto bugzilla which
>> has dedicated maintainers.
> 
> That leaves still a big part of the metadat without bugzilla coverage.
> meta-openembedded. If we find a group of people maintaining it I don't see a
> problem with the OE bugzilla to stay.

I stopped using OE bugzilla when the maintainer at that time was closing
bugs because patches were posted to the mailinglist for review instead
of attached to bugzilla.
So if the new maintainers are crazy like that bugzilla will be useless.

Maybe we can use something like trac or redmine to have it more
integrated with the SCM. Hell, we could even abuse patchwork as
bugtracker :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNehLMMkyGM64RGpERAnZeAJ9I/A43aBEZmAQB2vYbVDdwEKGTkQCfQFT+
NBTU7ROL4oul5LWGnIIACwA=
=OEJI
-----END PGP SIGNATURE-----



