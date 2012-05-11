Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SSvSn-0005Vo-DN for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 21:25:17 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SSvJD-0000nJ-9n for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 21:15:23 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 21:15:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 21:15:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 11 May 2012 21:15:07 +0200
Message-ID: <jojofu$9ph$1@dough.gmane.org>
References: <CAGiJk9coc2zTnkX0CoM+cM52CDMwvpSwUN4DjjYoyrHnn5jD7Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <CAGiJk9coc2zTnkX0CoM+cM52CDMwvpSwUN4DjjYoyrHnn5jD7Q@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-kde] Status of the meta-kde layer
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
X-List-Received-Date: Fri, 11 May 2012 19:25:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-05-12 12:44, Samuel Stirtzel schreef:

> Testing meta-kde: Currently it won't work until you can provide
> soprano-native from your host or elsewhere. After this issue is resolved
> it will be easy to archive on OpenEmbedded if you use the branch
> sst-test-images: 
> https://gitorious.org/openembedded-core-layers/meta-kde/trees/sst-test-images/recipes-images
>
> 
*just talking to myself* Maybe it would be a good idea to have a git
> subtree providing the images, so parsing won't fail over 
> "systemd-image.bb not found" on Poky?

changing the 'require' to 'include' should get around that.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPrWU5AAoJEHZqAkdh1vT6cy0P/0WlzLeHjUHYO2Zh88KiOXZg
X688hRl5ajJmV7r7TJoyQeIVW6Q9jCssdckaRCmLR8p0cgxssB/esJHOMC4eltpp
zCOTWOrDmHZp0F+DdQJW6smDZd3pUrcND5VJtJ5nEMowNVgS4rEqQgEczTUz4v3r
AyNglYvHGQaelcNPcpFWkG5lK6N/G/gBUBw3Ntey2DeO7kLbd5gYf6qPqK14jwRd
bxoaXGM1Q26ORx56m2b4eY01gEBopbjZ2bjaBamuTA7WSQzvOxibhYIwYR2tUly1
llsfrHogf/emYmRCv+oMtSTT4T1gU5TyZ4VLqJtUYVhW/r+PG/sFX6Z8EtZAGMey
v05uxk42fTep8VOSga4CUwcuJq5RQdie1ALAfG2rUCFGWJO/Kpe3cUG+NUAqyilO
PsWSUeE6F5j3AgZXDhLLvJMSIi8yy80lCT79frO5/chK2OzBUEwDhrDpH2mGgleF
1ufgUzSjoapsSKn9rFiFn6Rn4Qpe2is1AC84Gzuq2Yy6Uma5PifkA6oiCyndstyh
0LuV+S/16KaFvGGTt8CZERXXwEahlrUfKmBmSffQvjvGBc+aneQ38yvPl7XNxw5t
SlW6tX+oGWrZwLNtS4/8FmqfeMRv0RYYNQ/aWRCBXzo8rijXzfhBJ5ykoQINjDn+
9wpxTAh6g0DsuQx0JnnW
=GVcq
-----END PGP SIGNATURE-----



