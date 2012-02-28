Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2OS3-0003T8-Tv for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:54:51 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S2OJq-0002Jf-Cz for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:46:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:46:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 15:46:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2012 15:46:04 +0100
Message-ID: <jiipbb$vb5$1@dough.gmane.org>
References: <1330435070-30907-1-git-send-email-koen@dominion.thruhere.net>
	<CAAQYJAv0-czYNsmCCqaXs3jpu-OJmRPd+fZU-C2zhG0xKaP0XQ@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <CAAQYJAv0-czYNsmCCqaXs3jpu-OJmRPd+fZU-C2zhG0xKaP0XQ@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe] xinput-calibrator 0.7.5: fix calibration script
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
X-List-Received-Date: Tue, 28 Feb 2012 14:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-02-12 14:58, Andrea Adami schreef:
> On Tue, Feb 28, 2012 at 2:17 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> The 'auto' format switched to 'xorg.conf.d' which broke the script. The
>> pointercal package also installed an 'empty' pointercal by default,
>> which also broke the script. Fix these 2 in one go.
>> 
>> Also remove the hal script since hal isn't supported in the oe-core
>> universe anymore
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ---
> 
> Koen,
> 
> do you think the recipe is now mature enough to be committed in oe-core?

Well, there is too much in oe-core already, it needs to shrink, not grow :(
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9M6KoACgkQMkyGM64RGpHtNgCgtOc4D2DkDh6U52dwYngDD5Zj
gq8An2Anp4rYkcz0zsXC8EWL0fFtJjUS
=5h+N
-----END PGP SIGNATURE-----



