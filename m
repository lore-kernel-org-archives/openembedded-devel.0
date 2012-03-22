Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAezr-00080K-SU for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:11:56 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAerH-00060h-4j for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 11:03:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:03:03 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 11:03:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 11:02:53 +0100
Message-ID: <jketcd$1lo$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520> <jkes69$nt2$1@dough.gmane.org>
	<20120322104517.0600295f@eb-e6520>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <20120322104517.0600295f@eb-e6520>
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
X-List-Received-Date: Thu, 22 Mar 2012 10:11:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 10:45, Eric Bénard schreef:
> Le Thu, 22 Mar 2012 10:42:33 +0100, Koen Kooi
> <koen@dominion.thruhere.net> a écrit :
> 
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 22-03-12 10:40, Eric Bénard schreef:
>>> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel 
>>> <s.stirtzel@googlemail.com> a écrit :
>>>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>>>> why not add meta-oe dependency to meta-kde/README?
>>>> 
>>>> It is already listed as dependency [1]. But somehow it seems like
>>>> that there are users, interested in testing this layer, with an use
>>>> case which excludes the meta-oe layer.
>>>> 
>>>> 
>>> can you describe this use case so that meta-oe gets a chance to
>>> adapt.
>>> 
>>> One problem I can see with meta-oe is the fact that it makes changes
>>> to the oe-core toolchain : that would be great to put all the
>>> toolchain changes in a meta-toolchain (but I think that's what is
>>> scheduled with meta-linaro).
>> 
>> In the mean time I bet Khem would love to have people sending patches
>> to move the toolchain bits to a meta-toolchain layer inside the 
>> meta-openembedded repo.
>> 
> ok so expect patches by this weekend for this point.

I sent an RFC patch to get some more peoples attention :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPavjLAAoJEHZqAkdh1vT6wU4P/ioH3asxsreEWPmdYsYP+K+Q
JaLTLlXYqv6asne9a7+Gmro7WaHboalmrUQgISgWNjF7iTrBuKAby2zV1PjC1vJg
eXkpLv25xSdFVlbhHSl46iJvzBlXhFKqodxMwYavgMD+XGS+1ABaYlr5vgZsPdVR
ZDl036PrRhnLN8qYhYy7jatTN7obndwH6DUycc6HbQ/OAg4KDYQnZQ+PSuChfhT/
HIs721q7JOV4fBGEnx2lEm12JW3jy/4SJH4WFK44hCQ6YcHt7dkHWYH7o+HOmO50
SRhWqLtSTTqQiG6hHoVmWHe6jWhlqsmeyYSHOHI5K80nI51ADaweppFEHe4+r2LC
S6WZTN1lvJdnqCtH9aSrUNMlR/+hqLKyO/R892fv9R2wTF1ZVMW3eJHGnr9LfCBq
b77xdq4ErniMWFoP7Oyd/GocHmH7K5NJgFqwMgIRokVmUxU+Y+EzEZoEeR2Ju7So
nancX5XScBRspz4zZDDZkQCBKycG13iTUoT/56ZXelP75y7f42vK9nvHvnwJu+TL
9yn2dCK1bS9e/3cc+yG5/qRlJwLmqeSxfPtrasgcaH0BI+yIKL9CpoYee2Rj6i7P
ZszerMxGBvQEXUoQ5yX3VMC2hrGGJUVoqCNK5UtQUipLOZh3pYNRTB/ThXW3t37h
8bVIjvb5ptE9XAD7ypYt
=dGZ8
-----END PGP SIGNATURE-----



