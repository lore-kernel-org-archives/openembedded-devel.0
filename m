Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PA0QH-0007c0-B8 for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 15:15:41 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PA0Pf-0006fX-FD for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 15:15:03 +0200
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 15:15:03 +0200
Received: from k.kooi by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 15:15:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Oct 2010 15:10:22 +0200
Message-ID: <ia1b7v$p2e$2@dough.gmane.org>
References: <AANLkTi=fqKeS6eu1H5mS-C7rQeJPndf8Xchpghaxjh_d@mail.gmail.com>	<AANLkTikLYDaYCXeg+T0Vn8inWv9v72BTN6hHNKcPZ77V@mail.gmail.com>
	<20101024062941.GE3494@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <20101024062941.GE3494@jama>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Explaining the patches that will be send ...
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
X-List-Received-Date: Sun, 24 Oct 2010 13:15:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-10-10 08:29, Martin Jansa wrote:
> On Fri, Oct 22, 2010 at 10:13:40PM -0200, Fabiano Fidêncio wrote:
>> Howdy!
>>
>> Guys, I'll send a lot of patches made by Eduardo Lima (Etrunko) and I
>> via git send-mail.
>>
>> This patches are creating/fixing svn build from some
>> {EFL,LMS,WebKit-EFL} packages and are keeping in three differents
>> branchs of my git tree. All of this are rebased with the latest HEAD.
>>
>> Please, apply if correct :-)
> 
> Today I'll apply those where was no reply from me or koen, for the rest
> please send updated patches with v2 prefix.

I think I have a way to make the gles situation less worse for TI
targets[1], I need to work on that patch a bit. I'll be too busy next
week to get it done, though.

regards,

Koen

[1] Those are the only armv7a targets with recipes for gles drivers in
the tree.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMxDA+MkyGM64RGpERAqOkAJ44aV8nmSr3/GrFBkRctYX7EkEpowCfW97i
aJiScZbUlCx+QuOhJNTvrFE=
=jIKn
-----END PGP SIGNATURE-----



