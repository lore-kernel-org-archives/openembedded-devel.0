Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1N9yJH-0004NH-CB
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:55:50 +0100
Received: from w1043.wlan.rz.tu-bs.de ([134.169.204.27] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1N9yHn-0001Zc-Vv by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 10:54:27 +0100
Received: from stefan by excalibur with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1N9yHn-0007hB-CD
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:54:15 +0100
Date: Mon, 16 Nov 2009 10:54:15 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116095415.GB7412@excalibur.local>
References: <E1N9xmi-0005Gh-RH@melo.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <E1N9xmi-0005Gh-RH@melo.openembedded.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBKZXJlbXkgTGFpbsOpIDogbGludXgtMi42LjMxIDogZml4IGVtYWlsIGZvciBpc2wxMjAyNCBkcml2ZXIgYXV0aG9y?=
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
X-List-Received-Date: Mon, 16 Nov 2009 09:55:50 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Mon, 2009-11-16 at 09:22, git version control wrote:
V> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 5f13a271b010da627fc8b411182fbc58c03aec23
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=5f13a271b010da627fc8b411182fbc58c03aec23
> 
> Author: Jeremy Lainé <jeremy.laine@m4x.org>
> Date:   Mon Nov 16 10:21:35 2009 +0100
> 
> linux-2.6.31 : fix email for isl12024 driver author

[...]

> -+MODULE_AUTHOR("Guillaume Ligneul <guillaume.ligneul@cenosys.com>");
> ++MODULE_AUTHOR("Guillaume Ligneul <guillaume.ligneul@gmail.com>");

May I ask why such a cosmetic patch needs to be in the build system? It does not
hurd, but it does not bring benifit either. Something like this can go upstream
without a problem.

regards
Stefan Schmidt


