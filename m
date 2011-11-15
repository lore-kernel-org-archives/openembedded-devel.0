Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RQO5y-0006Av-UQ for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 19:50:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RQNzp-0008IV-R7 for openembedded-devel@lists.openembedded.org;
	Tue, 15 Nov 2011 19:44:37 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 19:44:37 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2011 19:44:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Nov 2011 19:44:25 +0100
Message-ID: <j9ubu8$6f8$1@dough.gmane.org>
References: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
	<j9ti8o$q4t$2@dough.gmane.org>
	<201111151509.44547.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201111151509.44547.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-xfce][V2 0/5] cleanup and bugfixes
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
X-List-Received-Date: Tue, 15 Nov 2011 18:50:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-11-11 15:09, Andreas Müller schreef:
> On Tuesday, November 15, 2011 12:26:16 PM Koen Kooi wrote:
>> Op 14-11-11 22:35, Andreas Müller schreef:
>>> V1 -> V2: * midori: cleanup commit message * tumbler: use
>>> INSANE_SKIP
>>> 
>>> Andreas Müller (5): xfce4-dev-tools: cleanups midori: update to
>>> 0.4.2 tumbler: initial add 0.1.22 ristretto: update to 0.3.0
>>> ristretto: add tumbler to RRECOMMENDS_${PN}
>> 
>> To double check: this one can be pulled in as-is, right?
> From my point of view the patches are OK (run tested based fresh build
> dir / V2 change in tumbler build tested) - but I think I havent't got the
> point: you need a branch to pull from?

Patchwork is good enough, I was under the mistaken impression you wanted to
do a v3 :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7CswUACgkQMkyGM64RGpH+8ACfSAjPc034sbGuierm7xGF00aA
9n8AnR7pB2NFi9Rhv0IZ4vpPhn7ZtkQo
=YSSv
-----END PGP SIGNATURE-----



