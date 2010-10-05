Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1P36ht-0006OR-Ul
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 14:33:26 +0200
Received: from guest190.ibr.cs.tu-bs.de ([134.169.35.190] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1P36hY-00021Z-97 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 14:33:02 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1P36hV-0005P3-Ss
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 14:32:57 +0200
Date: Tue, 5 Oct 2010 14:32:57 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101005123257.GD3517@excalibur.local>
References: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikzKs+3U0JfEbQxg5dLVuMF51To2qTn55YLOmjg@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-10-04
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
X-List-Received-Date: Tue, 05 Oct 2010 12:33:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2010-10-04 at 14:05, Cliff Brake wrote:
> Testing run from last week:
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-09-27
> 
> testing-next is updated and ready for clean builds:
> http://wiki.openembedded.net/index.php/Testing

Openjdk-6 build fails on cacao:
http://tinderbox.openembedded.net/public/logs/task/8408323.txt

regards
Stefan Schmidt


