Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMxnz-0004LO-Us for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 09:38:03 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QMxlC-0003bp-6C for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 09:35:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 09:35:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 09:35:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 May 2011 09:31:51 +0200
Message-ID: <ir2h17$bq8$2@dough.gmane.org>
References: <cover.1305755919.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1305755919.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-efl 0/2] Pull request #6
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
X-List-Received-Date: Thu, 19 May 2011 07:38:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-05-11 00:01, Martin Jansa wrote:
> Please merge following 2 patches.
> 
> Pull URL: git://gitorious.org/shr/meta-openembedded.git
>   Branch: jama/meta-efl
>   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/meta-efl

Thanks, applied

> 
> Thanks,
>     Martin Jansa <Martin.Jansa@gmail.com>
> ---
> 
> 
> Martin Jansa (2):
>   efl-from-svn.inc: import from meta-shr
>   e-base: bump EFL_SRCREV a bit
> 
>  meta-efl/classes/e-base.bbclass               |    2 +-
>  meta-efl/conf/distro/include/efl-from-svn.inc |   17 +++++++++++++++++
>  2 files changed, 18 insertions(+), 1 deletions(-)
>  create mode 100644 meta-efl/conf/distro/include/efl-from-svn.inc
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1MdnMkyGM64RGpERAijMAKCvxav0EwlA2gojZjJDZSVf1qjcXQCcDbmn
h5g+vsyUNDSel6lzaTudqkw=
=sgW5
-----END PGP SIGNATURE-----



