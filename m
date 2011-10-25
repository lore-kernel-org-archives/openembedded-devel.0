Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RIbrn-0006ri-Px
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Oct 2011 09:56:11 +0200
Received: from ad.chargestorm.se (85.231.30.150) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.83.0;
	Tue, 25 Oct 2011 09:50:13 +0200
Date: Tue, 25 Oct 2011 09:50:30 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20111025075030.GA17580@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013D181@post.tritech.se>
	<8721E570-6C63-4CC6-AC4A-854409FFF3E6@gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C4013D8A9@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4013D8A9@post.tritech.se>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [2011.03-maintenance] Pull request for binutils
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
X-List-Received-Date: Tue, 25 Oct 2011 07:56:12 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Mats K=E4rrman <Mats.Karrman@tritech.se> [111025 09:37]:
> I'm sorry for the slow progress but I'm working 100% on something else
> so this is overtime...

Unfortunately a too common situation...

> What is the correct practice; to fork the oe repository at GitHub or
> to create a "username/maintenance" branch in the same repo?

Well, unless you already have a git account, with rw permission
openembedded.org (and thus can push to e.g. openembedded), the easiest
thing should be to use another hosting. I'm using github for my
pull-requests to meta-oe and oe-core.

If you do that, just:
1) fork openembedded on github
2) add the remote to you local git-tree
3) push your local branch to github, using i.e. `git push github
featureXXX`, assuming that you named the remote github.

Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


