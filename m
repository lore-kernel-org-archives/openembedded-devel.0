Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1QKqSU-0001R1-1x
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 13:23:02 +0200
Received: from [2001:638:602:1183:619e:fa82:d0c3:b1d0] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1QKqPl-0007wa-8H by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2011 13:20:15 +0200
Received: from stefan by excalibur.local with local (Exim 4.76)
	(envelope-from <stefan@excalibur.local>) id 1QKqPj-0000uc-Ni
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 13:20:11 +0200
Date: Fri, 13 May 2011 13:20:10 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110513112010.GA29302@excalibur.local>
References: <1304926905-4739-1-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1304926905-4739-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCH] llvm2.7_2.7: Add patch for build errors on newer gcc / glibc combinations
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
X-List-Received-Date: Fri, 13 May 2011 11:23:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-05-09 at 09:41, Stefan Schmidt wrote:
> From: Stefan Schmidt <stefan@buglabs.net>
> 
> Its seems there is a stricter header checking again which results in errors like
> this:
> error: 'ptrdiff_t' does not name a type
> 
> This happens on my Debian SID system. Adding the needed includes fixes the
> build.

Have I take no reaction as agreement here? ;)

As it is a build fix I'm going to push this later today if no-one
objects.

regards
Stefan Schmidt


