Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZVUn-0006Vz-3L for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 00:02:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZVRM-00022C-Fx for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 23:58:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 23:58:28 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 23:58:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Jun 2011 23:58:13 +0200
Message-ID: <ittohl$fn7$1@dough.gmane.org>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>	<ittkfr$n5n$1@dough.gmane.org>
	<20110622210858.GG1324@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110622210858.GG1324@denix.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Wed, 22 Jun 2011 22:02:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-06-11 23:08, Denys Dmytriyenko wrote:
> On Wed, Jun 22, 2011 at 10:48:59PM +0200, Koen Kooi wrote:
>> On 22-06-11 21:02, Jeff Lance wrote:
>>> * Modify to use arago MACHINE name for platforms
>>
>> This seems to use OE machine names, not arago ones.
> 
> Technically correct. But since Arago is just an OE distro, the machine names 
> are the same. It's like arguing that omap3evm is not Angstrom machine... :)

But since arago is not present in OE we shouldn't make such mistakes in
commit messages, no?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOAmV1MkyGM64RGpERAm98AJ9Dr4/KQ+RCKIdCIYapLoNfVeTKggCgmdCl
/PBldHthKj8lIYWqUBfCFp0=
=wdiK
-----END PGP SIGNATURE-----



