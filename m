Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SIE85-0004hf-HQ for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 09:07:41 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SIDz3-0001vI-KO for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 08:58:21 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 08:58:21 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 08:58:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Apr 2012 08:58:11 +0200
Message-ID: <jm5ue3$ggg$1@dough.gmane.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
	<1334185891-25460-3-git-send-email-philip@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <1334185891-25460-3-git-send-email-philip@balister.org>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe 2/5] python-cheetah : Remove DEPENDS on python native packages.
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
X-List-Received-Date: Thu, 12 Apr 2012 07:07:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-04-12 01:11, philip@balister.org schreef:
> From: Philip Balister <philip@opensdr.com>
> 
> The oe-core recipe no longer explicitly provides various -native 
> packages. THe recipe builds fine without them.

These are _R_DEPENDS, have you verified that it runs without them?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPhn0BAAoJEHZqAkdh1vT6ecEP/2ywoNnZzDLWDqHmEjtJrrss
NmzyVcVDCiPZGfGDy4HZKyLbiGOs2eoOmByKfUbNQ9h5cBrXdqLeeCEK8zdEoJzV
HRZvLAmVbd9Xvzy4FPCPt7GEkzEPiifviAZ9pi7Q+yWa4DU4wpJeVvYLQ/iM9usH
UtMffuDeSiMjydWfpxftNuWEVNoNPNFqV2x7Zrev1uvssd6GU1YH4Z+LRXtVSppF
2PLeg7FMPHL7LHBi3/3Y/3BoRDDtmqtjSrt05L7vO7lAcnS8njuCHoo8PRlGTt4m
p+LGPMN1QvN4u2aRMdoUWzcwjVbmPTUWWvzE+cI3BYyvCpq6XvqoofNxLGRQdxqA
vjTuQzJGzqPkNQnR9gqwVvAIysBs5OdLaP21DtZoOIgT3yKkWLGl1rAmM9hmfoO1
mhvXEsc9odTDlSMXy63zHnLKbMHLU3NGnJ13rpU19YEvPAMMkrcJVJ5Ckp8gcazs
zk0K0yGbZaKanAgWgz1QvwdCxaks/CeCkWEfHfciGdFh2Z2lMd14fU2+rgUQtP3A
2I6uxp9ufx3Q4OwDl4oyJK7O+pdVIWMVeJFTRyb9uYrFPdYwXeqyFCCIBQgaMOp1
KuZDqTlr07gWO+nC3clFJF1g1A7yawhpWI9g+XntCDGMe0IWjodfH+GOcSiU1Rvf
RVS7dKsdkyDvBjTyPa8K
=dCsm
-----END PGP SIGNATURE-----



