Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S9GF1-0006nl-U6
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 14:33:48 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8D343F81241; Sun, 18 Mar 2012 07:24:58 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id C37F1F811E2;
	Sun, 18 Mar 2012 07:24:53 -0600 (MDT)
Message-ID: <4F65E225.4080400@mlbassoc.com>
Date: Sun, 18 Mar 2012 07:24:53 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
	<jk4j25$dat$1@dough.gmane.org>
	<20120318121834.GL3855@jama.jama.net>
In-Reply-To: <20120318121834.GL3855@jama.jama.net>
Subject: Re: [meta-oe][PATCH] midori: Add project home page info
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
X-List-Received-Date: Sun, 18 Mar 2012 13:33:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-18 06:18, Martin Jansa wrote:
> On Sun, Mar 18, 2012 at 01:05:20PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 16-03-12 20:41, Gary Thomas schreef:
>>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>  ---
>>> meta-oe/recipes-connectivity/midori/midori.inc |    1 + 1 files changed,
>>> 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc
>>> b/meta-oe/recipes-connectivity/midori/midori.inc index 4c7147e..dccb3ee
>>> 100644 --- a/meta-oe/recipes-connectivity/midori/midori.inc +++
>>> b/meta-oe/recipes-connectivity/midori/midori.inc @@ -1,4 +1,5 @@
>>> DESCRIPTION = "Midori is a lightweight web browser." +HOMEPAGE =
>>> "http://www.twotoasts.de/index.php?/pages/midori_summary.html" LICENSE =
>>> "LGPLv2.1" LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>
>> Missing PR bump
>
> Khem applied it before my version upgrade, so it should be fine in
> feeds.

Plus, it's informational only, so why bump the PR?  That's silly.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


