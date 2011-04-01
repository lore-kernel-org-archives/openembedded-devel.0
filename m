Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5ZXV-0005Qn-CV for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 10:17:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5ZVZ-0002cE-RF for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 10:15:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 10:15:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 10:15:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Apr 2011 10:13:02 +0200
Message-ID: <in41ee$a8h$2@dough.gmane.org>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>	<1301637327-26825-3-git-send-email-raj.khem@gmail.com>
	<AANLkTinRZxiXDGxDO02uSb0T1Et4CCnKVNh9RZ+q1jmp@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTinRZxiXDGxDO02uSb0T1Et4CCnKVNh9RZ+q1jmp@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/7] openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 08:17:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-04-11 09:27, Frans Meulenbroeks wrote:
> 2011/4/1 Khem Raj <raj.khem@gmail.com>:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../openssl/openssl-0.9.8m/configure-targets.patch |    4 ++--
>>  .../binutils-2.20.1/110-arm-eabi-conf.patch        |    4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> maybe partly offtopic but:
> openssl 0.9  is at 0.9.8r; 8m has known security vulnerabilities
> probably better upgrade to 8r.

So make a patch and do a pull request.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNlYkOMkyGM64RGpERAo1sAJ9hLuV+gSYFhA8nsk/W0H3wRKmAkwCfWweL
zw6bbtnfw0TI+1IGbR3hXFI=
=sDSh
-----END PGP SIGNATURE-----



