Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LOTwi-0003XH-4T
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 10:27:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 198AD2C8D7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 09:21:02 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dq+Wll3xw3cX
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 09:21:00 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 7AA3E2C8A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 09:21:00 +0000 (UTC)
Message-ID: <4972F482.4080603@gmail.com>
Date: Sun, 18 Jan 2009 10:21:06 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.19 (X11/20090105)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4972660D.7070905@dls.net> <gkur78$pai$1@ger.gmane.org>
In-Reply-To: <gkur78$pai$1@ger.gmane.org>
Subject: Re: mdev?
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
X-List-Received-Date: Sun, 18 Jan 2009 09:27:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi ha scritto:
> On 18-01-09 00:13, Mike (mwester) wrote:
>> I think I missed something somewhere.  It seems that recent images have
>> mdev included in addition to udev - which doesn't work well.
>>
>> Poking around at the updated busybox recipes, I see no way to disable
>> mdev.  I already investigated mdev as a replacement for udev on SlugOS,
>> and found it deficient in a number of areas -- so removing udev is not
>> an option for me.
>>
>> So, how do I disable mdev?
> 
> The mdev symlink, config file and initscript need to get put in their
> own package (package, not recipe!).
> 
> regards,
> 
> Koen
> 

So, no issue exists regarding mdev?

--
Marco Cavallini


