Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QYGGO-0005hU-7o for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 13:34:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QYGD1-0003BM-Dq for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 13:30:31 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2011 13:30:31 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jun 2011 13:30:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 19 Jun 2011 13:30:14 +0200
Message-ID: <itkmk6$j7n$1@dough.gmane.org>
References: <1308476190.18748.6.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1308476190.18748.6.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: Git server error: `fatal: read error: Connection reset by peer`
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
X-List-Received-Date: Sun, 19 Jun 2011 11:34:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-06-11 11:36, Paul Menzel wrote:
> Dear OE administrators,
> 
> 
> `git remote update` fails using `git://git.openembedded.org/openembedded`.
> 
>         $ git remote update
>         Fetching origin
>         fatal: read error: Connection reset by peer
>         error: Could not fetch origin

Something is running rampant:
http://munin.nas-admin.org/openembedded.org/melo/load.html

You can use the mirror for the time being:
https://github.com/openembedded/openembedded

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN/d3GMkyGM64RGpERAnL6AKCjj1HYGuay8yi6RFYhcV8tW6vSRACeIkut
j7lCw+qM+knN7tA13Clr478=
=hwin
-----END PGP SIGNATURE-----



