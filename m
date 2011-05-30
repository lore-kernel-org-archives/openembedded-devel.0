Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQvw7-0007v5-FK for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 08:26:47 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QQvt7-0007dn-KN for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 08:23:41 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 08:23:41 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 May 2011 08:23:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 08:23:33 +0200
Message-ID: <irvd51$kf9$1@dough.gmane.org>
References: <355a220b55867ef7a2fd485fbc1fcb76c06ef5d1.1306706130.git.Martin.Jansa@gmail.com>	<c424bae29966b789e50eb4112a9d95a2b7833942.1306706130.git.Martin.Jansa@gmail.com>	<1306720135.5979.1.camel@perseus>
	<20110530053016.GE18119@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110530053016.GE18119@jama.jama.net>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 07/14] libelf: import from OE rev d4f0211e2078d5033ae0dee74664de5520d8392d
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
X-List-Received-Date: Mon, 30 May 2011 06:26:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-05-11 07:30, Martin Jansa wrote:
> On Sun, May 29, 2011 at 06:48:55PM -0700, Khem Raj wrote:
>> On Sun, 2011-05-29 at 23:56 +0200, Martin Jansa wrote:
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> You do not need to import libelf recipe. oe-core provides libelf via
>> elfutils change the depending recipes to depend on elfutils instead.
> 
> OK, thanks! Will test and update patch.
> koen: should I update patch in same branch or send new patch removing
> libelf and changing deps?

updating the branch would be good enough for me.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN4zflMkyGM64RGpERAhRpAJ9HSrlrJvJe3Hh//DOSmPsRWBNccwCgoKcA
vIjuY40aCNQ5tvsEMWODoeY=
=Oewp
-----END PGP SIGNATURE-----



