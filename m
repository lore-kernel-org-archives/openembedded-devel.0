Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGAbr-0006eu-L2 for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:25:39 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RGAWE-0005pm-Fk for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 16:19:50 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 16:19:50 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2011 16:19:50 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 18 Oct 2011 16:19:34 +0200
Message-ID: <j7k1tq$e53$1@dough.gmane.org>
References: <cover.1318946821.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <cover.1318946821.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-efl 0/3] EFL upgrade and lightmediascanner
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
X-List-Received-Date: Tue, 18 Oct 2011 14:25:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-10-11 16:10, Martin Jansa schreef:
> My eve patches were applied upstream, so we can use newer webkit-efl
> without those patches in OE.
> 
> Webkit-efl build depends on fixed fontconfig see 
> http://patches.openembedded.org/patch/13371/

I'll wait till that goes in, I asked on the OE-core list for an ETA.

regards,

Koen

> 
> The following changes since commit
> 2631ed9f4c987192749960bc7a2209b5f5bbfa78:
> 
> epdfview: add initial recipe with version 0.1.8 (2011-10-18 13:47:21
> +0200)
> 
> are available in the git repository at: 
> git://git.openembedded.org/meta-openembedded-contrib jansa/pull 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull
>
>  Martin Jansa (2): e-base: bump EFL_SRCREV webkit-efl: upgrade to 1.6.1
> 
> pespin (1): lightmediascanner: Add version 0.4.4 (initial recipe)
> 
> meta-efl/classes/e-base.bbclass                    |    2 +- 
> .../webkit/webkit-efl/revert.r78057.patch          |   19 -------------- 
> meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |   11 +------ 
> .../lightmediascanner/lightmediascanner_0.4.4.bb   |   27
> ++++++++++++++++++++ 4 files changed, 30 insertions(+), 29 deletions(-) 
> delete mode 100644
> meta-efl/recipes-efl/webkit/webkit-efl/revert.r78057.patch create mode
> 100644
> meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.4.4.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnYr1MkyGM64RGpERAlYAAJ9+hJewnLM3TRk5C/jWmiITOmBLnQCeOtHS
gt8mgcxx5B3H6qOjeiyOSbg=
=8FeF
-----END PGP SIGNATURE-----



