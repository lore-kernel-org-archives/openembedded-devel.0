Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TR1j1-0004jQ-Kf for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 16:14:27 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TR1W5-00089d-Fs for openembedded-devel@lists.openembedded.org;
	Wed, 24 Oct 2012 16:01:05 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:01:05 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:01:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Oct 2012 16:00:49 +0200
Message-ID: <k68sae$b49$1@ger.gmane.org>
References: <1350659734-10362-1-git-send-email-ferlandm@sonatest.com>
	<878vawvynh.fsf@sonatest.com> <2623289.W1gREzD5R9@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <2623289.W1gREzD5R9@helios>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] lmsensors: Initial commit (cover letter)
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
X-List-Received-Date: Wed, 24 Oct 2012 14:14:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-10-12 14:35, Paul Eggleton schreef:
> On Wednesday 24 October 2012 08:32:18 Marc Ferland wrote:
>> Marc Ferland <ferlandm@sonatest.com> writes:
>>> Third version of the patch for lmsensors based on comments from
>>> Koen.
>>> 
>>> Marc Ferland (1): lmsensors: Initial commit.
>>> 
>>> .../recipes-support/lm_sensors/files/fancontrol    |    2 + 
>>> .../recipes-support/lm_sensors/files/fancontrol.sh |   48 +++++++ 
>>> .../recipes-support/lm_sensors/files/sensord.cgi   |   10 ++ 
>>> .../recipes-support/lm_sensors/files/sensord.conf  |   16 +++ 
>>> .../recipes-support/lm_sensors/files/sensord.sh    |   49 +++++++ 
>>> .../recipes-support/lm_sensors/files/sensors.conf  |    2 + 
>>> .../recipes-support/lm_sensors/lmsensors_3.3.2.bb  |  140 
>>> ++++++++++++++++++++ 7 files changed, 267 insertions(+), 0
>>> deletions(-) create mode 100644
>>> meta-oe/recipes-support/lm_sensors/files/fancontrol create mode
>>> 100644 meta-oe/recipes-support/lm_sensors/files/fancontrol.sh create
>>> mode 100644 meta-oe/recipes-support/lm_sensors/files/sensord.cgi 
>>> create mode 100644
>>> meta-oe/recipes-support/lm_sensors/files/sensord.conf create mode
>>> 100644 meta-oe/recipes-support/lm_sensors/files/sensord.sh create
>>> mode 100644 meta-oe/recipes-support/lm_sensors/files/sensors.conf 
>>> create mode 100644
>>> meta-oe/recipes-support/lm_sensors/lmsensors_3.3.2.bb
> 
> Coincidentally this just got merged this morning.

I looked at all patches at
http://patches.openembedded.org/project/oe/list/?q=meta-oe this morning and
only 3 categories are left:

1) meta-networking patches
2) patches with unaddressed feedback
3) denzil backports

If you have a patch that isn't in yet *and* isn't showing in that list
please resend it with a CC: koen@dominion.thruhere.net

And a big thank you to Paul for clearing out patchwork this week!

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQh/SRMkyGM64RGpERAukWAKCUID0//dOHS9Qs1Hndl8MuCa1ZsACcC9Mz
6YC3W2mfBCP91/FmzNW6B7Y=
=tRWM
-----END PGP SIGNATURE-----



