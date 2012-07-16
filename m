Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqhUY-0006qn-IH for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:21:22 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SqhJc-0001ck-7Q for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 11:10:04 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:10:04 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 11:10:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 Jul 2012 11:07:53 +0200
Message-ID: <ju0ll8$usc$2@dough.gmane.org>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
	<20120716072152.GB3729@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <20120716072152.GB3729@jama.jama.net>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe,V2 00/32] transit to meta-systemd
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
X-List-Received-Date: Mon, 16 Jul 2012 09:21:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-07-12 09:21, Martin Jansa schreef:
> On Fri, Jul 13, 2012 at 10:30:08AM +0200, Andreas Müller wrote:
>> v1->v2: * rebase to latest head * 4 meta-oe/layer.conf:
>> systemd-serialgetty moved to meta-systemd * 5 append systemd package to
>> RRECOMMENDS * remove warning in case systemd-stuff is packed in ${PN} *
>> 7+8 make tasks usable without meta-systemd * xserver-nodm-init: include
>> Martin's patch [1] * use FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>> for multiple bbappends
> 
> I haven't tested this V2, because I was away on holidays, but from my 
> tests with V1 I would say:
> 
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> and then we can resolve possible minor issues :).

Pushed
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQA9npMkyGM64RGpERAtqTAJ9412kJIdC9EG08zoayP9JfjcpubgCgoZTJ
qH7+dTWAs55otaFpMcBNNsM=
=HYhp
-----END PGP SIGNATURE-----



