Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQKmx-0007pH-K4 for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:46:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQKjw-0004PK-8b for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:43:44 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 16:43:44 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 16:43:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 28 May 2011 16:43:31 +0200
Message-ID: <irr1mj$i73$1@dough.gmane.org>
References: <cover.1306591578.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1306591578.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/2] Pull request #11
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
X-List-Received-Date: Sat, 28 May 2011 14:46:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-05-11 16:08, Martin Jansa wrote:
> The following changes since commit 7f9dbc16002bacf2ccc040a2de3ddc134e5fbbad:
> 
>   gcc-4.6: Update with patches from gcc-4_6-branch and linaro 2011.05 release (2011-05-28 09:36:14 +0200)
> 
> are available in the git repository at:
>   git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
>   http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/meta-openembedded-contrib/log/?h=jansa/meta-oe
> 
> Martin Jansa (2):
>   gconf: depend on polkit not policykit
>   policykit: drop recipes, oe-core has newer versions named right
>     polkit

Thanks, I merged both, will push those out soon.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN4QoTMkyGM64RGpERAtIdAJ4l/O7+XJilJ1zU64IPgK0fJ32MiACfQJqn
+3vZQuoHM4XXrQHL7Bt4AyU=
=B/1b
-----END PGP SIGNATURE-----



