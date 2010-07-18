Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OaZ6q-0000I1-MB
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 21:01:10 +0200
Received: from p5b0352a5.dip.t-dialin.net ([91.3.82.165] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OaZ6i-0003s0-BP by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 21:01:03 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OaZ6g-00016M-RV
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 21:00:58 +0200
Date: Sun, 18 Jul 2010 21:00:58 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100718190058.GC1772@excalibur.local>
References: <E1OaXxg-0006Jt-No@melo.openembedded.org>
	<1279476715.25205.3.camel@saphir>
MIME-Version: 1.0
In-Reply-To: <1279476715.25205.3.camel@saphir>
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
Subject: Re: [oe-commits] Stefan Schmidt : json-glib_0.10.4: Add json-glib
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
X-List-Received-Date: Sun, 18 Jul 2010 19:01:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2010-07-18 at 20:11, Michael 'Mickey' Lauer wrote:
> Am Sonntag, den 18.07.2010, 17:47 +0000 schrieb git version control:
> > Module: openembedded.git
> > Branch: org.openembedded.dev
> > Commit: 3b441d30742710dbd043938c21bf26d09240cd53
> > URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=3b441d30742710dbd043938c21bf26d09240cd53
> > 
> > Author: Stefan Schmidt <stefan@buglabs.net>
> > Date:   Sun Jul 18 19:40:46 2010 +0200
> > 
> > json-glib_0.10.4: Add json-glib
> 
> Does this supersede the version in recipes/moblin?

Now that I know about the recipe in moblin it looks like it supersedes it. For
me it looks like it was moved from o-hand hosting to gnome.org. We need to make
sure that they are identical and the moblin recipes are working with the newer
version and move them as well.

> Anyhow it might be wise to put it into recipes/json/

Done. Should avoid others missing them like me. Thanks for spotting.

regards
Stefan Schmidt


