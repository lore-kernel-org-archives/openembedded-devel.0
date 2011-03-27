Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3tCa-0007A4-5J for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 18:52:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3tAk-00028D-8p for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 18:50:38 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Mar 2011 18:50:38 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Mar 2011 18:50:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Mar 2011 18:50:22 +0200
Message-ID: <imnpse$p9t$1@dough.gmane.org>
References: <20110326023201.GA13132@denix.org> <4D8F5910.1060803@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D8F5910.1060803@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request for external toolchains updates and matrix-gui
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
X-List-Received-Date: Sun, 27 Mar 2011 16:52:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-03-11 17:34, Tom Rini wrote:
> On 03/25/2011 07:32 PM, Denys Dmytriyenko wrote:
>> Tom,
> 
>> Please pull these 8 commits for the external CSL and Angstrom toolchains, as well
>> as a trivial SRCREV update for TI's matrix-gui. All are cherry picked from oe.dev
> 
> 
>> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>>   Branch: 2011.03-maintenance
>>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
>> Thanks,
>>     Denys Dmytriyenko <denys@ti.com>
> 
> $ git pull git://arago-project.org/git/people/denix/openembedded.git
> 2011.03-maintenance
> fatal: The remote end hung up unexpectedly
> 
> Otherwise I'd apply this.  Thanks!

Try http://, that usually solves that issue

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNj2rOMkyGM64RGpERAt5iAKCQSkGB3xAOE0GiY6+Ca4h19Xoj0wCeO/0Y
NXHMFC5LMWtVP5vZnAG7CpY=
=g8Hr
-----END PGP SIGNATURE-----



