Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpqe-0000ZF-Ny for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:16:12 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RKpko-0002WR-1f for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 12:10:10 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:10:10 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2011 12:10:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 31 Oct 2011 11:50:55 +0100
Message-ID: <j8luif$7vb$4@dough.gmane.org>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
	<1319891607.3756.18.camel@mattotaupa>
	<201110310955.28626.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <201110310955.28626.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Mon, 31 Oct 2011 11:16:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-10-11 10:55, Paul Eggleton schreef:
> On Saturday 29 October 2011 13:33:27 Paul Menzel wrote:
>>> +LIC_FILES_CHKSUM = 
>>> "files://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7" +PR = "r0"
>> 
>> According to Koen these are going away.
> 
> Well, Koen might reject PR = "r0" in meta-oe, that's fine; however 
> LIC_FILES_CHKSUM is mandatory or the recipe will not build, and I don't
> think that will be changing any time soon. I have considered if it would
> be desirable/possible to eliminate it for recipes that don't install any
> files (e.g. tasks), so far I haven't done any work on that. For normal
> recipes it is required however.

Exactly!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOrn2PMkyGM64RGpERAtZRAJ9+q7eDwUbX3o3vuIxOnwKhWSx0VQCgorOy
1FZ3HAsW95D1sXuh3uldPaU=
=OzFY
-----END PGP SIGNATURE-----



