Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZWDc-0006pE-5M
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 20:02:45 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZWBV-0000Hh-4z
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 19:00:17 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 19:00:17 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 19:00:17 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 12 Mar 2008 20:00:10 +0100
Message-ID: <fr997r$aat$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<200803111126.04715.openembedded@haerwu.biz>	<fr5ntp$n0v$1@ger.gmane.org>
	<20080311114938.GM30267@ibawizard.net>	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>	<20080311145739.GN30267@ibawizard.net>	<1205250588.4521.111.camel@dax.rpnet.com>	<20080312014945.4783ae6a@widy.localdomain>	<1205280598.16531.26.camel@dax.rpnet.com>	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 19:02:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello all,
|
| having very little experience with both git and hg, I needed to look
| for other people's thoughts on this.
| I found this e-mail from Carl Worth extremely insightfull in the
| decision for either hg or git:
|
| http://lists.freedesktop.org/archives/cairo/2006-February/006255.html
|
| His arguments on the (main two) differences strongly favors me to move
| to GIT, not HG.

Actually it shows that hg fits better into the OE way of using a DSCM:
central repo (and mirrors) with distributed developers.

I keep hearing people saying that they have no clue on how to setup a
git-server for OE where we can commit things as usual, while with hg
it's just 'hg serve'.



regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2Cg6MkyGM64RGpERArCvAJ0ZOXNRysB3/I5HNJwuhto25TrXAQCffaad
VD7lvC0aO123KP3MOPDtweU=
=aHj0
-----END PGP SIGNATURE-----



