Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T4pYx-0003Yp-Sy for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 10:48:19 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T4pNC-0000TX-7l for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 10:36:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 10:36:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 10:36:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 24 Aug 2012 10:35:57 +0200
Message-ID: <k17eda$nmn$1@ger.gmane.org>
References: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
	<20120823093511.GM3029@jama.jama.net>
	<CAJTo0LbmhE+cLgJn2nxcdbj1dVH+5Y8xaT1tgP7FPtBspmLFtg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAJTo0LbmhE+cLgJn2nxcdbj1dVH+5Y8xaT1tgP7FPtBspmLFtg@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: gnome.bbclass
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
X-List-Received-Date: Fri, 24 Aug 2012 08:48:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-08-12 23:32, Burton, Ross schreef:
> On 23 August 2012 10:35, Martin Jansa <martin.jansa@gmail.com> wrote:
>> git log says it was because of 'hicolor-icon-theme-native' and
>> 'gnome-common-native'
> 
> Isn't that quite a sledgehammer approach, why couldn't BBCLASSEXTEND +=
> "native" be added to just those two recipes?

With the current tiny set of gnome recipes, only those 2 needed it. In
OE-classic with a lot more gnome a lot more was needed. Over time the gnome
cleaned up their act as well.

KDE on the other hand....

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQNzzsMkyGM64RGpERArH0AJ4jfChjl+AYJtk+F3dkzIp7yhY9RgCeIWN0
xtyRNgSW6v8z0jkm43GKbYA=
=ozoX
-----END PGP SIGNATURE-----



