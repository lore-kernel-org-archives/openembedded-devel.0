Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9zCj-0004wx-3U for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 13:26:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9z8v-000823-Gn for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 13:21:25 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 13:21:25 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 13:21:25 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 May 2010 13:21:16 +0200
Message-ID: <hru8nc$d5l$1@dough.gmane.org>
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
	<hr3im2$gf6$1@dough.gmane.org>	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>	<hr4t3j$tds$1@dough.gmane.org>	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>	<4BD84B08.4000300@eukrea.com>	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>	<4BDFC996.5060606@eukrea.com>	<AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com>
	<4BE29322.7060205@eukrea.com>
	<AANLkTimCrYrjKuREPyUgYQwxlWdAN_OjF5ECiRBLj6Pp@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <AANLkTimCrYrjKuREPyUgYQwxlWdAN_OjF5ECiRBLj6Pp@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Thu, 06 May 2010 11:26:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-10 12:55, Abhishek Sharma wrote:

> About the /dev node, there is no such device as /dev/input/touchscreen0, is
> it because i am only doing a base-image kind of install???
> i set the environment variable which was specified, but no progress.

If you use udev, it will get created for you.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4qYsMkyGM64RGpERAszCAJ9tRRJelQyLDkozlVtBHdgyobx/HQCgs0NP
mB316e3HZG2RsEoAcQEwJrI=
=4Mnu
-----END PGP SIGNATURE-----



