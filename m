Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Tbtre-0004Qj-Oa
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Nov 2012 15:04:18 +0100
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.279.1; Fri, 23 Nov 2012
	14:49:47 +0100
Date: Fri, 23 Nov 2012 14:50:09 +0100
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20121123135008.GC2808@ad.chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <cover.1353603007.git.paul.eggleton@linux.intel.com>
	<k8nh49$jq6$1@ger.gmane.org>
	<20121123131256.GB2808@ad.chargestorm.se>
	<20121123143619.7997e637@eb-e6520>
MIME-Version: 1.0
In-Reply-To: <20121123143619.7997e637@eb-e6520>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-systemd][PATCH 0/3] Fix ntp bbappends
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
X-List-Received-Date: Fri, 23 Nov 2012 14:04:18 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Eric B=E9nard <eric@eukrea.com> [121123 14:36]:

> Le Fri, 23 Nov 2012 14:12:57 +0100,
> Anders Darander <anders@chargestorm.se> a =E9crit :

> >=20
> > * Koen Kooi <koen@dominion.thruhere.net> [121123 10:54]:
> >=20
> > > Op 22-11-12 17:54, Paul Eggleton schreef:
> > > > This is the meta-systemd patch series corresponding to the recently=
 sent=20
> > > > out patches for ntp in meta-networking. 1/3 and 2/3 should be appli=
ed=20
> > > > ASAP even if 3/3 is not applied immediately, as the layer is curren=
tly=20
> > > > broken; 3/3 needs to wait until after the meta-networking patches g=
o in.
> >=20
> > > 1/3 and 2/3 have been applied.
> >=20
> > Could you, or Eric, apply them to danny also, or should we do a new pul=
l-request?
> >=20
> please simply provide the commit hash you want to provide so that I can
> easily cherry-pick them


Sure, as I'm out of office, I'll only list the commit hashes here, in
order (otherwise I would have sent a pull request).

7da3e44c0dc53c05acce387bf5461d0e292f8d34
c6fe627660a6085f9377337f486e11bad92082e4

These are (in the same order):
meta-systemd: Move ntp recipes to 'meta-networking' sublayer
meta-systemd: meta-networking: ntp: Update bbappend to 4.2.6p5

These commits will make meta-systemd parse again.


Cheers,
Anders

--=20
Anders Darander
ChargeStorm AB / eStorm AB


