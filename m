Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSer-0001Sa-Jq for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:45:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OnSeO-0002Ac-MT for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 10:45:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:45:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 10:45:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 23 Aug 2010 10:43:34 +0200
Message-ID: <i4tcbm$qie$2@dough.gmane.org>
References: <1282248521-32053-1-git-send-email-jkridner@beagleboard.org>
	<1282256264-4206-1-git-send-email-jkridner@beagleboard.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1282256264-4206-1-git-send-email-jkridner@beagleboard.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base-files: beagleboard: profile: use nano
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
X-List-Received-Date: Mon, 23 Aug 2010 08:45:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-08-10 00:17, Jason Kridner wrote:
> If nano is available and EDITOR isn't otherwise set, then use it.
> Advanced users who would prefer vi will know how to set EDITOR anyway.
> I can clearly see myself being frustrated typing 'export EDITOR=vi'
> every time I start a BeagleBoard test ramdisk image, but better me have
> that than to try to explain to someone fresh how to use vi.
> 
> Updated with feedback from Gary Thomas to avoid overwriting anyone
> else's preference.
> 

NAK, this is a distro setting, not a machine setting.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMcjS2MkyGM64RGpERAlQWAJ9DKEMR3LNZ1BGpoPaoqmAH7AeYTwCdGPBb
BTqwSmFm2Kqd7oJMRfoD9DI=
=aBw7
-----END PGP SIGNATURE-----



