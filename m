Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SVMoc-00017U-GK for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 15:01:54 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SVMet-0004CO-TB for openembedded-devel@lists.openembedded.org;
	Fri, 18 May 2012 14:51:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 14:51:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2012 14:51:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 May 2012 14:51:28 +0200
Message-ID: <jp5gkp$2ip$1@dough.gmane.org>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Cc: meta-ti@yoctoproject.org
Subject: Re: ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
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
X-List-Received-Date: Fri, 18 May 2012 13:01:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-05-12 14:33, Thilo Fromm schreef:
> Hello *.*,
> 
> sorry for the cross-post (openembedded-devel, meta-ti), I think this 
> affects both projects one way or the other.
> 
> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This means 
> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.7. 
> However, both compilers break the kernel we're using 
> (ti81xx-psp-linux-2.6.37).

What happens when you disable the mailbox? AIUI you shouldn't need that on
Ne/Ce.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPtkXQAAoJEHZqAkdh1vT6SYsQAJndlj4m7rIuuQdsseJYZBDj
C2E/fXa6GkZmZNMWEBmZvdlNlw0C4phg8lGKYFzoL+DPPL4/TrvkZ6h1QU/uHUiU
a0L41O9jI6HsnQ/dS7OzG7V+Gcgduv0gUvdc0wK+km2BtBtnR7nG4501hGd//xjZ
D4XN+WpBsr6PL7XawXyg0cHDEbBvq/yHqy3mTkBW9/d5EdAlWjVTuj6FhaMouZQr
fBIiEAlWl0iZsxa8VbVBFvZHJcAyS5rut1KINO7yXgdZ0Pa58nppJJ8P3DSJ8WkP
vQzvQ6GRuU/0FdKRS/gvvQak1kEa+2vHM3y911ivlppPAdqXu6CszqMi5H5GmI27
4JGq0MJ5h9xltz7+k3EpmriztRHnqoFyG9a4cI8NR5aTtHLc5GzXJBPQ7xKbvf2M
xY/qy9pEtCw6SbKO9I6+oEruVS1UOl9LAG7ATFItWGm0dHw7HXp0EpNhwmo2Si5n
Yc1OdBasCOxA7yRBxzvEtSNfeY0BiDniIAtuWpFVQ/sUY3ao+Aiz+9ATRYSXtBKb
HtXP9pMGM9Oa9L0SADXsQbopt7M8rkgLXD6DkLBq/LMenqp5vkMP8WBqBl45g1yG
8n8EBmohylFP+L0kSI7oHr7+zJu7EZnpUP2jsHR9+8coBTia1zfvrLSq2wZV8W/d
WAFvJzJKWbhrNxzLYLyh
=+Key
-----END PGP SIGNATURE-----



