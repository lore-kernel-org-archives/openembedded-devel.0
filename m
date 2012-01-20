Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ro97U-0004eQ-S1 for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 08:42:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ro906-0000jf-Li for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jan 2012 08:35:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 08:35:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jan 2012 08:35:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 08:31:13 +0100
Message-ID: <jfb580$f67$2@dough.gmane.org>
References: <1326978353-5558-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKrcCEUoW+6s2MknUSgtjSOxriU2CSkpSjc7_XOAtUR_Xg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <CAP9ODKrcCEUoW+6s2MknUSgtjSOxriU2CSkpSjc7_XOAtUR_Xg@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH 1/2] udev: add 177
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
X-List-Received-Date: Fri, 20 Jan 2012 07:42:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-01-12 04:37, Otavio Salvador schreef:
> On Thu, Jan 19, 2012 at 11:05, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> 
>> * 'udevadm' moved to ${PN} avoiding the need for the udev-utils package
>> to be installed, so 'udev' has all the needed programs by itself.
>> 
> 
> NACK!
> 
> I have some images that use mdev and I use udevadm to tigger events so 
> please allow for this flexibility.

So that's what the package split was for! I'll fix that in v2
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8ZGEEACgkQMkyGM64RGpFRrgCgslxtJzS9MubgqUQPHS/RJbW2
II0An228NmDxGMyoNv5ZFytrWQ10Z3yQ
=8j/8
-----END PGP SIGNATURE-----



