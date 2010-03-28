Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Nvr9x-0004bz-8o
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 14:00:06 +0200
Received: from p5b034aa1.dip.t-dialin.net ([91.3.74.161] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Nvr6p-0004pX-TT by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Mar 2010 13:56:54 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1Nvr6l-00076F-3p
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Mar 2010 13:56:47 +0200
Date: Sun, 28 Mar 2010 13:56:47 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100328115646.GA8462@excalibur.local>
References: <op.u7dmmldamn1qzu@camelguo> <op.u7dt8jyhmn1qzu@camelguo>
	<op.u7dus8qwmn1qzu@camelguo>
	<201001310714.09989.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <201001310714.09989.holger+oe@freyther.de>
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
Subject: Re: building piccontrol - 0.4 failed due to lack of liblua5.1.a
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
X-List-Received-Date: Sun, 28 Mar 2010 12:00:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello.

On Sun, 2010-01-31 at 07:14, Holger Hans Peter Freyther wrote:
> On Sunday 31 January 2010 06:56:58 Guo Hongruan wrote:
> > 在 Sun, 31 Jan 2010 13:44:33 +0800，Guo Hongruan <camelguo@gmail.com> 写道:
> 
> >     20 LDFLAGS += " ${STAGING_LIBDIR}/liblua5.1.a -lpthread -lm -ldl "
> 
> Okay,
> care to write a patch with a proper commit message and a Signed-off-by line?

That never happened. As the subject line was not fitting, it did no longer apply
and a SOB was missing I redid the one-line change as a band-aid.

> PS: In the long run the lua recipe should install the .pc and we should link 
> with pkg-config --libs lua5.1

Gua, are you interested in working this out?

regards
Stefan Schmidt


