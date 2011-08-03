Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QogZ5-0006Ci-Qw for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 20:53:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QogUo-0006iR-PD for openembedded-devel@lists.openembedded.org;
	Wed, 03 Aug 2011 20:48:46 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 20:48:46 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Aug 2011 20:48:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Aug 2011 20:48:33 +0200
Message-ID: <j1c561$jr5$1@dough.gmane.org>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
	<j18cmj$j39$2@dough.gmane.org>
	<201108032018.51667.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <201108032018.51667.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe 00/19] Add xfce48 desktop system to meta-oe
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
X-List-Received-Date: Wed, 03 Aug 2011 18:53:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-08-11 20:18, Andreas Mueller schreef:
> On Tuesday, August 02, 2011 10:32:19 AM Koen Kooi wrote:
>> Do you have a public repo where this can be pulled from?
> 
> Before pushing to
> 
> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git branch meta-xfce
> 
> I did
> 
> * rebase the patches on latest meta-openembedded commits * Add README ( Khem suggested )

small nit: the README doesn't say that it depends on meta-oe for e.g. iceauth

> * xfce-session: Modify commit message ( iceauth now mainline ) * thunar: Minor modifcation in commit message * build-tested xfce-base-image again
> 
> Andreas

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOOZgBMkyGM64RGpERAsccAKCwfS+zn22CNQ+lKFcLWHaAo/RZFgCgqhO5
c/1Oi0zG4DjzTif7KO++f4w=
=psWs
-----END PGP SIGNATURE-----



