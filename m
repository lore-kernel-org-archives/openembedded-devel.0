Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROXnU-0007Og-F6 for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:48:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ROXhR-0008P0-3C for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 17:42:01 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 17:42:01 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 17:42:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Nov 2011 17:41:48 +0100
Message-ID: <j9gusc$722$1@dough.gmane.org>
References: <cover.1320942838.git.otavio@ossystems.com.br>
	<2c620d32a60fd571d00a4b98b572d60f49bf8b0f.1320942838.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <2c620d32a60fd571d00a4b98b572d60f49bf8b0f.1320942838.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 1/1] atftp: add 0.7 version
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
X-List-Received-Date: Thu, 10 Nov 2011 16:48:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-11-11 17:35, Otavio Salvador schreef:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   51
> ++++++++++++++++++++ meta-oe/recipes-extended/atftp/files/atftpd.init   |
> 37 ++++++++++++++ .../recipes-extended/atftp/files/atftpd.service    |
> 11 ++++ 3 files changed, 99 insertions(+), 0 deletions(-) create mode
> 100644 meta-oe/recipes-extended/atftp/atftp_0.7.bb create mode 100644
> meta-oe/recipes-extended/atftp/files/atftpd.init create mode 100644
> meta-oe/recipes-extended/atftp/files/atftpd.service
> 
> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> b/meta-oe/recipes-extended/atftp/atftp_0.7.bb new file mode 100644 index
> 0000000..b84819a --- /dev/null +++
> b/meta-oe/recipes-extended/atftp/atftp_0.7.bb @@ -0,0 +1,51 @@ 
> +DESCRIPTION = "Advanced TFTP server and client" +SECTION = "network" 
> +PRIORITY = "optional"

PRIORITY doesn't exist anymore in the oe-core world.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOu/7MMkyGM64RGpERApkqAJ9Ly5GZ8stHAgvwe8I7ka2PJMoQqwCgrafp
lbBPdfYt9UD3FmJaaCtFH2s=
=w099
-----END PGP SIGNATURE-----



