Received: from smtpauth11.prod.mesa1.secureserver.net ([64.202.165.33])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1PEM3Y-0002TI-Af
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 14:10:14 +0100
Received: (qmail 13640 invoked from network); 5 Nov 2010 13:09:18 -0000
Received: from unknown (209.242.7.132)
	by smtpauth11.prod.mesa1.secureserver.net (64.202.165.33) with ESMTP;
	05 Nov 2010 13:09:18 -0000
Message-ID: <4CD401E6.4060904@mwester.net>
Date: Fri, 05 Nov 2010 08:08:54 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201011050735.26140.captain.deadly@gmail.com>
In-Reply-To: <201011050735.26140.captain.deadly@gmail.com>
X-SA-Exim-Connect-IP: 64.202.165.33
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: emacs alternative?
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
X-List-Received-Date: Fri, 05 Nov 2010 13:10:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/5/2010 2:35 AM, captain.deadly@gmail.com wrote:
...
> I thought I saw a post here recently that mentioned an embedded version of an 
> emacs editor but can't find any such email. Maybe I imagined it. If anybody 
> knows of the alternative which does build or perhaps knows why the Makefile's 
> would be corrupted I'd be very glad to hear from you.

If all you need is a text-based emacs-like editor that works on small
embedded devices, build "joe".

-Mike (mwester)


