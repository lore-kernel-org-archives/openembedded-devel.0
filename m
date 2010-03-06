Received: from p3plsmtpa01-02.prod.phx3.secureserver.net ([72.167.82.82])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NnvXp-0004kr-V5
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 16:04:03 +0100
Received: (qmail 18963 invoked from network); 6 Mar 2010 15:01:02 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-02.prod.phx3.secureserver.net (72.167.82.82) with ESMTP;
	06 Mar 2010 15:01:02 -0000
Message-ID: <4B926E27.4090100@mwester.net>
Date: Sat, 06 Mar 2010 09:00:55 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.167.82.82
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Encouraging distros to use newer recipe versions?
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
X-List-Received-Date: Sat, 06 Mar 2010 15:04:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Does it make any sense to create a class (or extend the sanity or testlab classes) so that OE can inform someone when a given build is using a recipe that can be considered obsolete?  Perhaps we might also add a bit more encouragement if it were possible to have that same class call out builds that have selected versions with known security vulnerabilities.

This would certainly help me with the distro I maintain -- one of the questions I cannot easily answer, and therefore tend to ignore, is "exactly how out-of-date has my distro become?".

I have no patches to do such a thing, and neither do I have time to create such a thing at this point in time, but perhaps if someone thinks this is worthwhile time can be made for it...

-Mike (mwester)



