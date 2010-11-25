Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1PLerx-0000a2-Uh
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:40:27 +0100
Received: (qmail 8882 invoked by uid 0); 25 Nov 2010 16:39:07 -0000
Received: from 193.8.40.126 by www077.gmx.net with HTTP;
	Thu, 25 Nov 2010 17:39:04 +0100 (CET)
Date: Thu, 25 Nov 2010 17:39:04 +0100
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101125163904.30680@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/SXuFrJynSHrJfofmxovVZv+9V+0P6jw4PaST37V
	OzHSlQvtQNcNaAHjNv+TA5Rwhs5wsNJfde/A== 
X-GMX-UID: f/ScbJhqeSEqW9kmjHQh6A5+IGRvb8B+
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: for doing screenshots from the command line - use scrot
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
X-List-Received-Date: Thu, 25 Nov 2010 16:40:27 -0000
X-Groupsio-MsgNum: 26590
Content-Type: multipart/mixed; boundary="========GMX30681290703144870795"

--========GMX30681290703144870795
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

scrot - this relatively old program should be a nice and handy alternative 
for doing screenshots on the command line on OE based system.

invoke it by "scrot" and get e.g. "2010-11-25-170400_1280x1024_scrot.png".
the offered set of options does look rather helpful for lots of common cases.

binary file size on x86 was 64k. there is in fact a set of librarys needed.
its giblib & Imlib2 & X11 & Xext & Xau & freetype plus few more basic ones.

see attachment for more info and the *.bb file.

regards, Alex.

-- 
GMX DSL Doppel-Flat ab 19,99 &euro;/mtl.! Jetzt auch mit 
gratis Notebook-Flat! http://portal.gmx.net/de/go/dsl

--========GMX30681290703144870795
Content-Type: application/x-bzip; name="scrot.tar.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="scrot.tar.bz2"

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

--========GMX30681290703144870795--
