Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqhSL-0006ks-Hb for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:19:05 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqhHQ-0007X1-Jm for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:07:48 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:07:48 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:07:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 11:07:36 +0200
Message-ID: <ju0lkn$usc$1@dough.gmane.org>
References: <1342193205-25293-1-git-send-email-koen@dominion.thruhere.net>
	<20120716084701.GD3729@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <20120716084701.GD3729@jama.jama.net>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe][meta-efl][PATCH] various: update ; proto= to ; protocol= in SRC_URI
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
X-List-Received-Date: Mon, 16 Jul 2012 09:19:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-07-12 10:47, Martin Jansa schreef:
> On Fri, Jul 13, 2012 at 05:26:45PM +0200, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> 
> I'm also tracking bitbake master and 100 lines of warnings on every build
> is quite annoying.. so I'm fine with this in (would be even better with
> new bitbake release and required bitbake version bump as Paul said..)
> 
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Pushed, with a minor tweak to elsa_svn.bb to account for the meta-systemd split.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQA9nXMkyGM64RGpERAjlnAKCpJPdeVaVz1SRvBRgyNtGBSfspAgCfdxEW
UWMlUUZBItQOmHgnnqilX0w=
=tHfZ
-----END PGP SIGNATURE-----



