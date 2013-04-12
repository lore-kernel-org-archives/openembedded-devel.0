Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UQaRy-000698-MF for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 11:39:22 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UQaB5-0000EL-IN for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 11:21:51 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 11:21:51 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 11:21:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 12 Apr 2013 11:21:43 +0200
Message-ID: <kk8jn1$mq$1@ger.gmane.org>
References: <cover.1365489405.git.jackie.huang@windriver.com>
	<c63fb0a794520e59580eeec88b2086494da43986.1365489405.git.jackie.huang@windriver.com>
	<1397311.kYWOu8yYWG@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130216 Thunderbird/17.0.3
In-Reply-To: <1397311.kYWOu8yYWG@helios>
X-Enigmail-Version: 1.5.1
Subject: Re: [meta-webserver][PATCH 2/2] modphp: enable mysql option in PACKAGECONFIG
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
X-List-Received-Date: Fri, 12 Apr 2013 09:39:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-04-13 11:06, Paul Eggleton schreef:
> On Tuesday 09 April 2013 15:11:05 jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>> 
>> * enable mysql option in PACKAGECONFIG ...
>> 
>> -PACKAGECONFIG ??= "" +PACKAGECONFIG ??= "mysql" PACKAGECONFIG[mysql]
>> = 
>> "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5
>
>> 
> So, I'm not entirely sure about this. RFC: what do other people think
> about enabling this by default?

It makes sense to make LAMP as easy as possible. And this is the 'M'.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRZ9InMkyGM64RGpERAixUAJ9wy6qMMiecrXKa2cvx2Zj2sxNZDACdEfMK
/Gj9a0weV+ugccDy7bkJV1U=
=tyWQ
-----END PGP SIGNATURE-----



