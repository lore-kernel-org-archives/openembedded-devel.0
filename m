Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPIZf-0000kQ-Nf for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 20:12:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QPIWj-0008Qn-Pd for openembedded-devel@lists.openembedded.org;
	Wed, 25 May 2011 20:09:49 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 20:09:49 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2011 20:09:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 25 May 2011 20:09:38 +0200
Message-ID: <irjgl2$jur$1@dough.gmane.org>
References: <1306336287-23286-1-git-send-email-eyalr@ti.com>
	<1306345185.4888.2.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1306345185.4888.2.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] wpa-gui-e: build the latest version from git sources
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
X-List-Received-Date: Wed, 25 May 2011 18:12:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-05-11 19:39, Paul Menzel wrote:
> Am Mittwoch, den 25.05.2011, 18:11 +0300 schrieb Eyal Reizer:
>> Builds wpa-gui for qt4-embedded from the latest wpa-supplicant (0.8x)
>> git sources
>>
>> update based on comments from comunity members.
> 
> This is only useful for reviews and therefore should go after the `---`
> so that it is not included into the commit message.
> 
>> Signed-off-by: Eyal Reizer <eyalr@ti.com>
>> ---
>>  recipes/wpa-supplicant/wpa-gui-e_git.bb |   29 +++++++++++++++++++++++++++++
> 
> Why do you use that recipe name?

'-e' is for qt/e builds and '' or '-qt4' for qt4/x11 builds
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN3UXiMkyGM64RGpERAkm0AKCjhwxmFmdAP8WvziJ9yh9YGQeR2wCgojps
H2ELk5aG4On2IK08p+BW1nw=
=R0MZ
-----END PGP SIGNATURE-----



