Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZpax-0001Wk-Vb
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 16:43:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZpYq-00050C-16
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 15:41:40 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 15:41:40 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 15:41:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 13 Mar 2008 16:41:32 +0100
Message-ID: <frbhvc$gg8$1@ger.gmane.org>
References: <47D71B8F.1030108@balister.org>	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>	<20080313101513.3e72ca08@widy.localdomain>
	<f96d234e0803130726q446bb89dg3698e2cec8c675e3@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <f96d234e0803130726q446bb89dg3698e2cec8c675e3@mail.gmail.com>
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
Subject: Re: Git versus Hg
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
X-List-Received-Date: Thu, 13 Mar 2008 15:43:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cliff Brake schreef:

| I still maintain that that tools do impact developer workflow, and
| this should be a serious consideration when selecting tools.  What is
| the workflow that will maximize the productivity and output of the OE
| community?  The tool selection should follow.

Having been through the bk->mtn switchover and the re-evaluation I
noticed that people who said "I will start contributing (much more) to
OE if you weren't using bitkeeper" didn't actually start contributing
*at all*, so I'm extremely sceptical of the promised influx of a
gazillion ISVs, OEMs, ODMs and users with a switch to hg/git/vss.

All I can see is that the people taking care of the OE infrastructure
(Mickey and me) will have to allocate some weeks to do a good
changeover[1], and we both aren't known for our copious amounts of spare
time that would be needed.

regards,

Koen

[1] As it is, we were(are?) beginning the move of large parts of the
existing infrastructure to a new machine, but that's put on hold[2] due
to this discussion.
[2] Yes, that's why you haven't seen any commits mails lately.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2UsrMkyGM64RGpERAlvcAJ92SgGXGs8amaDIN1ef+JAlxXtqmgCgqTkF
4vrvx1JEyVXseQRAp7D2w1o=
=594a
-----END PGP SIGNATURE-----



