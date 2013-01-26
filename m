Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tz8OV-0004Tm-LP for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2013 17:14:28 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tz89j-00070N-3m for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2013 16:58:59 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2013 16:58:59 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Jan 2013 16:58:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 26 Jan 2013 16:58:39 +0100
Message-ID: <ke0uf5$nr5$1@ger.gmane.org>
References: <20130122122421.A87761034C@opal>
	<20130126114633.GG16904@jama.palm1.palmone.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <20130126114633.GG16904@jama.palm1.palmone.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [oe-commits] Koen Kooi : apcupsd: add 3.14.10
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
X-List-Received-Date: Sat, 26 Jan 2013 16:14:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-01-13 12:46, Martin Jansa schreef:
> On Tue, Jan 22, 2013 at 12:24:21PM +0000, git@git.openembedded.org
> wrote:
>> Module: meta-openembedded.git Branch: master Commit:
>> be12fb6c0762fe474a4d7cda94e814c0c622dfb5 URL:
>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=be12fb6c0762fe474a4d7cda94e814c0c622dfb5
>>
>>
>> 
Author: Koen Kooi <koen@dominion.thruhere.net>
>> Date:   Sun Jan 20 11:32:05 2013 +0000
>> 
>> apcupsd: add 3.14.10
>> 
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> Signed-off-by:
>> Martin Jansa <Martin.Jansa@gmail.com>
> 
> There is new QA warning, can you fix that?
> 
> apcupsd-3.14.10: apcupsd: Files/directories were installed but not
> shipped /usr/share/hal /usr/share/hal/fdi /usr/share/hal/fdi/policy 
> /usr/share/hal/fdi/policy/20thirdparty 
> /usr/share/hal/fdi/policy/20thirdparty/80-apcupsd-ups-policy.fdi

Yes, I was planning to just rm it in do_install_append since we don't have
HAL in OE anymore. OK?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRA/0vMkyGM64RGpERAlhWAJ9QP2bBa+3ImpDlJ/A8IltaRBYIPwCcCaou
lCOvbUY5152lOGXoFmeSMAU=
=Extz
-----END PGP SIGNATURE-----



