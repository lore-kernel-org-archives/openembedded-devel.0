Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qvsm0-0000Jq-2S for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 17:20:16 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QvshO-0004EB-K8 for openembedded-devel@lists.openembedded.org;
	Tue, 23 Aug 2011 17:15:30 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 17:15:30 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Aug 2011 17:15:30 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 23 Aug 2011 17:15:16 +0200
Message-ID: <j30g64$n1v$1@dough.gmane.org>
References: <1314023559-15827-1-git-send-email-noor_ahsan@mentor.com>
	<1314033226.12202.25.camel@mattotaupa>
	<1314112164.3688.17.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314112164.3688.17.camel@mattotaupa>
X-Enigmail-Version: 1.3
Subject: Re: [PATCH][meta-oe] lmbench: Added 3.0-a9 version recipe files
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
X-List-Received-Date: Tue, 23 Aug 2011 15:20:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-08-11 17:09, Paul Menzel schreef:
> Am Montag, den 22.08.2011, 19:13 +0200 schrieb Paul Menzel:
> 
>> Am Montag, den 22.08.2011, 19:32 +0500 schrieb Noor, Ahsan:
> 
>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \ +	   file://lmbench-run \ +	   file://rename-line-binary.patch \ +	   file://update-results-script.patch \ +	   file://obey-ranlib.patch"
>> 
>> Please add `\` at the end and put " on the new line.
> 
> As to your question on IRC why this is useful. My reasoning is, that in the future patch diffs will be smaller when adding a new line to the end of `SRC_URI`. But in the end it is just taste and no hard rule.

It also makes it easier to copy/paste a line into the end of the SRC_URI instead of making it the second to last entry :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOU8QEMkyGM64RGpERAmB+AJ90xGGui+WJPBA7Yr/PI5MeurfYpACcCtAu
YzAmqSIWY11e1G1PrDHnQ28=
=2SnN
-----END PGP SIGNATURE-----



