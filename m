Received: from smtp209.alice.it ([82.57.200.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1OtW21-0000z1-7s
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 03:34:30 +0200
Received: from [192.168.1.178] (79.54.144.55) by smtp209.alice.it (8.5.124.08)
	(authenticated as editempo)
	id 4C1A275904E04C32 for openembedded-devel@lists.openembedded.org;
	Thu, 9 Sep 2010 03:33:49 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4C85058D.8070506@gmail.com>
References: <4C85058D.8070506@gmail.com>
Date: Thu, 09 Sep 2010 03:33:47 +0200
Message-ID: <1283996027.3036.1.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.105
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Asterisk and termcap
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
X-List-Received-Date: Thu, 09 Sep 2010 01:34:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-09-06 at 16:15 +0100, Arigead wrote:
> was trying to build Asterisk for the OpenMoko Free runner and it failed
> on a dependency on termcap so I tried to bitbake termcap first and that
> failed. The termcap compile stage is working but it's when it tries to
> install that the recipe seems to fail but I'm new to this.
> 
> I'm off to read the openembedded documentation again but in the mean
> time if anybody can give me a hit that would be great.
We can't help you if you don't post some logs or console output.
Copy-pasting the part where it fails, if it's small, could be enough for
a start.
Denis.





