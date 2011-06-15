Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWpuK-0007bq-FK for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 15:13:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QWpr1-0001rF-Pl for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 15:09:55 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 15:09:55 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 15:09:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 15 Jun 2011 15:09:39 +0200
Message-ID: <itaauj$jjj$1@dough.gmane.org>
References: <cover.1308070134.git.otavio@ossystems.com.br>	<c8746f02a08b8529448e09e7d2e2f28b2ae05bf2.1308070134.git.otavio@ossystems.com.br>	<1308131824.4304.6.camel@mattotaupa>	<BANLkTikKOpSeLzch8VZ5DjQnmBbspKRhxw@mail.gmail.com>	<1308141294.7961.8.camel@mattotaupa>
	<BANLkTinEFGs7ChX+3bpQcbCBuUjG3Pfzuw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTinEFGs7ChX+3bpQcbCBuUjG3Pfzuw@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [[meta-oe][PATCH 1/3] xf86-video-geode: add 2.11.12 version recipe
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
X-List-Received-Date: Wed, 15 Jun 2011 13:13:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-06-11 14:59, Otavio Salvador wrote:
> On Wed, Jun 15, 2011 at 12:34, Paul Menzel
> <paulepanter@users.sourceforge.net> wrote:
>>> In fact no ... it is based on an old version from OE that I changes to
>>> look like we're using today.
>>
>> So you just changed the checksums and added the `LICENSE` field?
> 
> I don't recall exactly what I did but I guess so.
> 
>> Could also please answer why setting `PE` is needed.
> 
> It had it already IIRC.

Historical reasons, it's from the x11r6 -> x11r7 -> 1.0 transitions.
I've been silently dropping them when adding X recipes to meta-oe

>>> But AFAIK it is on Koen queue already so too late to change.
>>
>> Koen has not pushed them yet so it is not too late in my opinion.
> 
> I asked him to drop it and wait for a new version.

Done

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN+K8SMkyGM64RGpERAhvUAJ9X3VZqVqEEScWwS9Z0QfStYDWWZQCfel3u
KGvvI5FMR58T1O1jm/NGqag=
=klWr
-----END PGP SIGNATURE-----



