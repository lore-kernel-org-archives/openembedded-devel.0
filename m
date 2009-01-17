Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LOKSR-0005xW-Hu
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 00:20:05 +0100
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LOKLp-0006wQ-53
	for openembedded-devel@openembedded.org; Sat, 17 Jan 2009 17:13:13 -0600
Message-ID: <4972660D.7070905@dls.net>
Date: Sat, 17 Jan 2009 17:13:17 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: mdev?
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
X-List-Received-Date: Sat, 17 Jan 2009 23:20:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I think I missed something somewhere.  It seems that recent images have
mdev included in addition to udev - which doesn't work well.

Poking around at the updated busybox recipes, I see no way to disable
mdev.  I already investigated mdev as a replacement for udev on SlugOS,
and found it deficient in a number of areas -- so removing udev is not
an option for me.

So, how do I disable mdev?

Mike (mwester)


