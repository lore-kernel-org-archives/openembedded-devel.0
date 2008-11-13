Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L0fwb-0000Lo-07
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 18:25:25 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1L0fua-0006is-9C
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 11:23:20 -0600
Message-ID: <491C626D.3040703@dls.net>
Date: Thu, 13 Nov 2008 11:22:53 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>	<gf76q2$le2$1@ger.gmane.org>
	<49184199.90100@balister.org>
	<200811131743.18880.openembedded@haerwu.biz>
In-Reply-To: <200811131743.18880.openembedded@haerwu.biz>
Subject: Re: [PATCH] checksums.ini: correct wrong checksums
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
X-List-Received-Date: Thu, 13 Nov 2008 17:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> I have 1212 new entries for checksums.ini file. Do you want 1212 commits 
> or just one?

Thanks for doing this work!  Committing this will dramatically cut down
the frequency of commits to the checksums.ini file going forward.

My opinion is that this is the sort of situation where the rules have to
bend to suit the size of the change.

I vote this commits directly to the dev branch in a single commit.

Mike (mwester)


