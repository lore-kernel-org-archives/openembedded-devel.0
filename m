Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSDn-0002hm-GT for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 08:56:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbSAF-00041J-0c for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 08:52:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:52:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 08:52:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 08:52:38 +0200
Message-ID: <iubtnm$jkv$1@dough.gmane.org>
References: <201104102145.44766.patda293@student.liu.se>
	<1309207347.21379.147.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309207347.21379.147.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: python-numpy prone to use host libraries
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
X-List-Received-Date: Tue, 28 Jun 2011 06:56:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 27-06-11 22:42, Paul Menzel wrote:
> Dear Patrik,
> 
> 
> Am Sonntag, den 10.04.2011, 21:45 +0200 schrieb Patrik Dahlström (student):
> 
> […]
> 
>> I am however uncertain on how to proceed with this and could use some 
>> assistance.
> 
> did you find a “generic” solution for this problem?

It requires redoing the numpy buildsystem, it is broken by design. I
tried to teach it about crosscompiling and sysroots last year, but gave
up after a few days :(

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOCXo2MkyGM64RGpERAggYAJ0VMl1Ttg0QGqNCrmBhdlhnp9yPzgCgldQf
d5EbEv+2sn1ssE10DGkigsM=
=Sx4L
-----END PGP SIGNATURE-----



