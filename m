Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAgKH-00067R-8v for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 12:37:06 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAgBg-0004kL-7F for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 12:28:12 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:28:12 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:28:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 12:28:04 +0100
Message-ID: <jkf2bu$9pb$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
	<CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [PATCH] [meta-oe] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 11:37:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 11:12, Samuel Stirtzel schreef:
> 2012/3/22 Eric Bénard <eric@eukrea.com>:
>> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel
>> <s.stirtzel@googlemail.com> a écrit :
>>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>>> why not add meta-oe dependency to meta-kde/README?
>>> 
>>> It is already listed as dependency [1]. But somehow it seems like
>>> that there are users, interested in testing this layer, with an use
>>> case which excludes the meta-oe layer.
>>> 
>>> 
>> can you describe this use case so that meta-oe gets a chance to adapt.
> 
> Since I have the common use case of the installation provided from the 
> setup-scripts and I don't know the exact use case, I cannot provide this
> information myself right now.

So you can't explain why it should move to oe-core, that should be enough to
NAK this patch without even looking at it.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPawy/AAoJEHZqAkdh1vT6cdAP/3CIpSE6k6BOPHXEri6hgLU4
kfQhs6GKHRxgyCB63jDWJ1EShrErKUrCksWMAXO6p7tBniuMk8X5mJmQ4mBfHH9b
0yTu5bPFxB/zsK0lFqoOfWMOuwaJLZJQCuEQLJP4VvlVxexb5sZMbzMvudh+pGwQ
DZEgDGbTF+hUrcxu0Rjxug9UXJa4nqfiCJ7ShKy3U2+ichZnr4tU9YfUl5ZGoofT
W/xtJOBwEKogGB0KxIb2tphtChpoA8rPMy5WvRqlJ39lDsUOdOHUl5/Vu83Czpee
ynFe5aRxYjsz0NUovuiBc5SUwVCwqJApR164FCFIkhHg7l1G7OJelSrn1+oqA62f
fX6MTno5dYpaWImx2KiGqHOKqJF4wo+C0QqGNFBYde4Yu9Xu2Wdx/GQnycov6TOf
deQtQnDHFZ4K4oaT4ptQvzcb0qN4KU5f3scCjSAR9SMNfPjjuaI7wmlRD8UwGB61
s1oipV+SNE9icv8qSGbV9gw1Bo+B9w4AHRZllt9tdsDhnoMldBot7Fhc+FuW0MbH
uFOmzi4R1j9lXmoh5pcFkmZKSYra4/UhU9DkwGZ4IZzEMCE4cxfwDc3MYGyPPOTE
0oMbq01pmAfPsio7gQ1bE73WC0JWBhKfbFJ7KxF3mH0oC1+mrBw9y2Al+7Zd0o7P
B+y8ooG5B0ELZdWvczXO
=EYSh
-----END PGP SIGNATURE-----



