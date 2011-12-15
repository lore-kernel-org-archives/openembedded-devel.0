Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rb6me-000452-9v for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:35:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rb6fw-0003XW-S3 for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:28:24 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:28:24 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:28:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 15 Dec 2011 09:28:20 +0100
Message-ID: <jccb2s$qlr$1@dough.gmane.org>
References: <cover.1323772986.git.otavio@ossystems.com.br>
	<dd9bd4910b7278f024c9602b8d0cc162efc485fa.1323772987.git.otavio@ossystems.com.br>
	<jc86fu$pem$1@dough.gmane.org>
	<CAP9ODKpz+RsFfTPqztX6yXM25n+ng813hJ6xJMrMHmn9LN4Cdg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CAP9ODKpz+RsFfTPqztX6yXM25n+ng813hJ6xJMrMHmn9LN4Cdg@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH 3/4] dropbear: bump epoch to ensure an upgrade path and cleanup packaging
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
X-List-Received-Date: Thu, 15 Dec 2011 08:35:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-12-11 19:51, Otavio Salvador schreef:
> On Tue, Dec 13, 2011 at 16:45, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> 
>> I'd really like to avoid PE in bbappends for obvious reasons. Can we
>> get this into OE-core instead?
>> 
> 
> I can send a patch to them for this but in meanwhile this ought to be 
> merged as currently dropbear is at broken state.

No, a PE should only get added once and with care.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7pr6IACgkQMkyGM64RGpHgjwCfZeKt8oSrufiyWEMlWOTnp6D3
lIAAn0MKN4wpytvMSiyfbg0dkYnN2O5V
=86zF
-----END PGP SIGNATURE-----



