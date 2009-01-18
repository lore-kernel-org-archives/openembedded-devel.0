Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LOal5-00035b-0r
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 17:44:23 +0100
Received: (qmail 26296 invoked by uid 813007); 18 Jan 2009 16:37:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 18 Jan 2009 16:37:29 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 17:37:18 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.28; KDE/4.1.96; x86_64; ; )
References: <4972660D.7070905@dls.net> <gkur78$pai$1@ger.gmane.org>
	<gkv7gp$n1v$1@ger.gmane.org>
In-Reply-To: <gkv7gp$n1v$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200901181737.19176.openembedded@haerwu.biz>
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
X-List-Received-Date: Sun, 18 Jan 2009 16:44:23 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 18 of January 2009 13:32:25 Koen Kooi wrote:
> On 18-01-09 10:02, Koen Kooi wrote:
> > On 18-01-09 00:13, Mike (mwester) wrote:
> >> I think I missed something somewhere. It seems that recent images
> >> have mdev included in addition to udev - which doesn't work well.

My fault, sorry.

> >> Poking around at the updated busybox recipes, I see no way to
> >> disable mdev. I already investigated mdev as a replacement for
> >> udev on SlugOS, and found it deficient in a number of areas -- so
> >> removing udev is not an option for me.

> > The mdev symlink, config file and initscript need to get put in
> > their own package.

> I've implemented this solution.

Thanks Koen, I was thinking about adding it today.

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




