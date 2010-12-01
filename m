Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PNkEy-0006Lk-FA
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 11:48:48 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PNkDe-0001Ft-FX by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 11:47:29 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PNkDb-00024e-QD
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 11:47:23 +0100
Date: Wed, 1 Dec 2010 11:47:23 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101201104723.GA20482@excalibur.local>
References: <AANLkTi=yLLv7wx_M6fBkZV7+_RJaTqmDRbY995-xpb2P@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTi=yLLv7wx_M6fBkZV7+_RJaTqmDRbY995-xpb2P@mail.gmail.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010: when & what to do
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
X-List-Received-Date: Wed, 01 Dec 2010 10:48:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-12-01 at 10:06, Frans Meulenbroeks wrote:
> 
> I wanted to raise the issue of when to do the release. I seem to
> recall dec 1 was coined in the past (which is today in most of the
> timezones at the time of writing).

Thats correct.

> It seems to me that we still some areas needing attention (uclibc, the
> multiple provides for a few packages and probably some more things).
> What about if we try to get these resolved this week, plan an
> additional testing session over the weekend and decide early next week
> on how to proceed?

Doe we already have patches for the issues? If not I think delaying the release
for issues we don't even have fixes for is not a good idea. If we have fixes
delaying some days for more testing would be ok imho.

We need to keep in mind that none of our releases will be without issues.
Striving for perfection is good but we should not start to delay releases just
in the hope more time will fix more issues. That just does not work.

Our next release would be targetted for 1th March. That means three months time
to fix the issues with uclibc and getting it in good shape in master.

So my opinion would be in short: Get in all fixes that we have today, test and
release on friday. That would only make a two day slip and still a pretty solid
release. The last word on this should be by Khem I think as he has the release
manager hat on this time.

regards
Stefan Schmidt


