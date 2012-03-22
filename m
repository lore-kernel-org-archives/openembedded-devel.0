Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAegE-0005Ya-Ub for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:51:38 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAeXd-0007Ce-QU for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 10:42:45 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 10:42:45 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 10:42:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 10:42:33 +0100
Message-ID: <jkes69$nt2$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <20120322104009.6a4ed04e@eb-e6520>
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
X-List-Received-Date: Thu, 22 Mar 2012 09:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 10:40, Eric Bénard schreef:
> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel
> <s.stirtzel@googlemail.com> a écrit :
>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>> why not add meta-oe dependency to meta-kde/README?
>> 
>> It is already listed as dependency [1]. But somehow it seems like that
>> there are users, interested in testing this layer, with an use case
>> which excludes the meta-oe layer.
>> 
>> 
> can you describe this use case so that meta-oe gets a chance to adapt.
> 
> One problem I can see with meta-oe is the fact that it makes changes to 
> the oe-core toolchain : that would be great to put all the toolchain 
> changes in a meta-toolchain (but I think that's what is scheduled with 
> meta-linaro).

In the mean time I bet Khem would love to have people sending patches to
move the toolchain bits to a meta-toolchain layer inside the
meta-openembedded repo.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIbBAEBAgAGBQJPavQHAAoJEHZqAkdh1vT6IGQP+LLOR/8GoZ3Fplqwacx5g0Nf
9CTeHg1Pz+owg6yJ8H0UiQmfks3R5P6mq19vkvxEjXqYMBmv+Apk5O+qwWxLgfgQ
2Bn7v5zywQ9fiIa8NEqDtECFFnYUcgxlOFT6AUTDoN/ZqKXjJkbM8jADkjNGCBWD
0tHSk2V+eELujPAhkboxV+977aUS4vyETUahIr0rWGdUKJbNEse5yN2r6UFxNL8f
7cffRnurY9qhD9Ebm7QZ1AI8shoRoG3Z4SRnFH4Hf5xO7rr7g8M13ItLF6u6GnZk
TZUlGRcMUmAgx1CW16LLfWKPh4s+XACoq1QPJe5LvN0UPlE0q2QOi6254PbkaJSs
2mk7FgaZUN0btBo5XmKfa7YMyh3VMIVhyvj2VPK+HY4Yn9lUcJLlqi98LyZ3kYpA
KwjVJG66XoV5NCUOOIEBriTC+d+keHwdhAPYp6vQMLIu5B4vJQCb/9Vpf7yrkydE
wHYTyUFiXF9BSfRn2k85dYOCtg9e25u0ev4O8JNFiLWM5xfTi1T9WbS4h+duC28D
ukklNHsyJXOL8eT0OzGO8Z88ldRyOpLrcnXmgBw8KVQmWNZAX/TT2+pa2t2FOwvQ
dFB1ay3+AxEHkrYyaeXj5bNQ9ugYchb7UWGh9/2EzUsSMWhYcJi6uWvxex0A/rp0
MnufdpP7bO3CyXxl4Gk=
=Rz9p
-----END PGP SIGNATURE-----



