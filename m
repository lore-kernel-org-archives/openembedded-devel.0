Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3CACF6CEF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 18:49:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VULIL-0003iS-1v for openembedded-devel@lists.openembedded.org;
	Thu, 10 Oct 2013 20:49:09 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 20:49:09 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 20:49:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Oct 2013 20:49:03 +0200
Message-ID: <l36sqj$dd6$1@ger.gmane.org>
References: <5256F33C.50609@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <5256F33C.50609@balister.org>
X-Enigmail-Version: 1.5.2
Subject: Re: [RFC] Create meta-sdr in meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Oct 2013 18:49:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-10-13 20:34, Philip Balister schreef:
> At the GNU Radio conference last week, several people working with 
> gnuradio on embedded systems asked about creating a meta-sdr to hold 
> gnuradio and uhd. This would be the starting point for adding some other 
> gnuradio out of tree applications. This could also be a home for some 
> other sdr frameworks such as Iris and ALOE.
> 
> Software that is more focused toward the amateur radio community should 
> not end up here since there is little overlap in the developer 
> communities at this time.
> 
> Any comments?

soft66 and rtl-sdr can live there as well. I have recipes for that :)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD4DBQFSVvafMkyGM64RGpERAv9hAJYp+P+siykamukuuYphpOhVyNxjAKCqbHy/
R4h7IGNilTjmyAhRm/AH6Q==
=HwTP
-----END PGP SIGNATURE-----


