Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P3B0Q-00056E-7a
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 19:09:54 +0200
Received: (qmail 24466 invoked by uid 0); 5 Oct 2010 17:08:27 -0000
Received: from 193.8.40.126 by www037.gmx.net with HTTP;
	Tue, 05 Oct 2010 19:08:25 +0200 (CEST)
Date: Tue, 05 Oct 2010 19:08:25 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101005170825.23610@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX19Jnfd8vHtJ5TwBeVsY/mqSxJWx2BONVQYbML+Upm
	cf2Q0h46u+IaD87sdrg4glSF1RGjGvW2uJFQ== 
X-GMX-UID: 7TLODVd9fW47WIIfkGVozRxudmllcgWe
X-FuHaFi: 0.69999999999999996
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [patch] fix for building freetype-native on a symlinked build environment
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
X-List-Received-Date: Tue, 05 Oct 2010 17:10:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

my initial proposal got merged into the freetype repository
in a functionally equivalent sed based variant by Werner Lemberg.
it is now most probably included in the short after released freetype version 2.4.3

see this link for the final patch:
http://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=75eeb32a2e55ffb3e4102ee56cd913a442d1ac9a

regards, Alex.
-- 
GRATIS: Spider-Man 1-3 sowie 300 weitere Videos!
Jetzt freischalten! http://portal.gmx.net/de/go/maxdome


