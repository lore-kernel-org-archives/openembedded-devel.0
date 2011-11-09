Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RO8QE-0007Co-L7 for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 14:42:34 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RO8KC-00006J-0t for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 14:36:20 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 14:36:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 14:36:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 09 Nov 2011 14:36:05 +0100
Message-ID: <j9dvk5$shg$1@dough.gmane.org>
References: <cover.1320841846.git.anders@chargestorm.se>
	<af4142d54e9a7999e8e705495cb746c07c7d3990.1320841846.git.anders@chargestorm.se>
	<j9dugs$k6f$1@dough.gmane.org>
	<20111109133220.GB5579@ad.chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111109133220.GB5579@ad.chargestorm.se>
X-Enigmail-Version: 1.3.2
Subject: Re: [PATCH 1/1] rsyslog: change postrm to prerm
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
X-List-Received-Date: Wed, 09 Nov 2011 13:42:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-11-11 14:32, Anders Darander schreef:
> * Koen Kooi <koen@dominion.thruhere.net> [111109 14:18]:
>> Op 09-11-11 13:32, Anders Darander schreef:
>>> The systemd service can't be disabled if it already has been
>>> removed, thus disable it prior to removing the package.
> 
>>> Signed-off-by: Anders Darander <anders@chargestorm.se>
> 
>> Applied. Next time could you please follow 
>> https://github.com/openembedded/meta-oe/blob/master/meta-oe/README and
>> use [meta-oe] in the subject?
> 
> Yes, sure. Sorry that I forgot that....

I look at http://patchwork.openembedded.org/project/oe/list/?q=meta- far
more often than oe-devel :)


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOuoHFMkyGM64RGpERAmq/AJ0QQyXQm9w8pAuW9djpTVi2QcubUwCfXZXy
UxerDjXtNhgihdFgTfmaKfg=
=Blqn
-----END PGP SIGNATURE-----



