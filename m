Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUICD-0005sN-Ss for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 12:12:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUIAA-0000RK-A0
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 12:10:22 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 12:10:22 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 12:10:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Jan 2010 12:09:58 +0100
Message-ID: <hif0u5$trl$1@ger.gmane.org>
References: <hid4ng$12q$1@ger.gmane.org> <1263152005.2342.0@zaurus>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
In-Reply-To: <1263152005.2342.0@zaurus>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] disable static libraries in Angstrom
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
X-List-Received-Date: Mon, 11 Jan 2010 11:12:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I repeat: you need to discuss things like this on the angstrom-devel ml

On 10-01-10 20:33, Stanislav Brabec wrote:
> Jan 10, 2010 19:02:25 Koen Kooi wrote:
>> On 10-01-10 18:10, Stanislav Brabec wrote:
>>> Attached patch disables build of major part of static libraries in
>> the
>>> Angstrom distribution.
>>
>> NAK
> 
>> Static libs are packaged in seperate packages, so they only 'waste'
>> space on the feed server.
> 
> OK, in this case, patch 1/2 can exist standalone and people can set
> their local.conf as they want. Comment can be changed appropriately.
> Even the part in bitbake.conf may be removed (yes+yes is the default)
> and configuration may be completely moved to the local.conf.sample.
> 
> The primary goal of this patch is a decreasing of feed size and
> compilation time, which is useful especially for custom builds.
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLSwcGMkyGM64RGpERAoQ8AKClJitbRzaoBdx0CblffAItrhvWbgCfbQ0S
kkhQnUOhYfpx4EsZOOjP96I=
=Unc2
-----END PGP SIGNATURE-----



