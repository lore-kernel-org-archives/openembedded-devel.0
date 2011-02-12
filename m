Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PoBeP-0002Cd-Vv
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Feb 2011 10:20:22 +0100
Received: from p5b033464.dip.t-dialin.net ([91.3.52.100] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PoBdK-0002Ab-TM by authid <stefan@sostec.de> with cram_md5;
	Sat, 12 Feb 2011 10:19:17 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1PoBdI-0001sn-Up; Sat, 12 Feb 2011 10:19:12 +0100
Date: Sat, 12 Feb 2011 10:19:12 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110212091912.GA6582@excalibur.local>
References: <1296657327-11166-1-git-send-email-stefan@buglabs.net>
	<20110212002201.GG1010@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20110212002201.GG1010@gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	Stefan Schmidt <stefan@buglabs.net>
Subject: Re: [PATCH] angstrom-2008-preferred-versions: Bump wpa-supplicant version to 0.7.3
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
X-List-Received-Date: Sat, 12 Feb 2011 09:20:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 16:22, Khem Raj wrote:
> On (02/02/11 15:35), Stefan Schmidt wrote:
> > This allows the use of the new DBUS API which is needed by connman 0.68 and
> > higher.
> > 
> > Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
> 
> I dont know if angstrom-2008 is still taking package verison upgrades but
> nonetheless
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Yes, they do. Koen acked this one in private as he had no mail access durin a
trip. Patch is already pushed and of course I forgot to have a look at
patchwork. Totally my fault. Will go through it now.

regards
Stefan Schmidt


