Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MxQZw-0005c5-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Oct 2009 21:29:11 +0200
Received: from [85.210.191.75] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MxQZ5-0003hF-FA
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Oct 2009 20:28:15 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fca63bcf0910120537n73c7a9dveb742edf1f75542d@mail.gmail.com>
References: <fca63bcf0910120537n73c7a9dveb742edf1f75542d@mail.gmail.com>
Date: Mon, 12 Oct 2009 20:28:13 +0100
Message-Id: <1255375693.9214.311.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.191.75
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: patch: lighttpd runtime issues; lighttpd ssl version;
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
X-List-Received-Date: Mon, 12 Oct 2009 19:29:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-10-12 at 12:37 +0000, Michael Lippautz wrote:
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/configure.in.patch
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/index.html
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd.cnf
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/lighttpd.conf
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/mod_redirect.c.patch
>  create mode 100644 recipes/lighttpd/lighttpd-ssl/src-server.c.patch
>  create mode 100755 recipes/lighttpd/lighttpd-ssl_1.4.18.bb

Are these just straight copies of the equivalent files from
recipes/lighttpd/lighttpd/?  If so, it might be better to find a way for
these two recipes to share them, rather than having all these bits
duplicated.

p.




