Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NgeGN-0004CH-BI
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 14:11:54 +0100
Received: from p5b0352a9.dip.t-dialin.net ([91.3.82.169] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NgeDh-0005HO-Dt by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 14:09:16 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NgeDh-0004vg-6f
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 14:09:05 +0100
Date: Sun, 14 Feb 2010 14:09:05 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100214130905.GD5979@excalibur.local>
References: <20100213203508.540D614AF55@gandalf.denix.org>
MIME-Version: 1.0
In-Reply-To: <20100213203508.540D614AF55@gandalf.denix.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] meta-toolchain: Run rmdir only if empty dirs are actually found.
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
X-List-Received-Date: Sun, 14 Feb 2010 13:11:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Sat, 2010-02-13 at 20:34, Denys Dmytriyenko wrote:
> > Prevent a failure in do_populate_sdk when there are no empty
> > directories:
> >    /bin/rmdir: missing operand
> >    Try `/bin/rmdir --help' for more information.
> >
> > See also http://tinderbox.openembedded.net/packages/478437/
> >
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> Acked-by: Denys Dmytriyenko <denis@denix.org>

Acked and pushed. Now I need to find out how to update patchwork with the new
status...

regards
Stefan Schmidt


