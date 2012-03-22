Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAgz7-0004AX-43 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:19:17 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SAgqV-0003UX-0R for openembedded-devel@lists.openembedded.org;
	Thu, 22 Mar 2012 13:10:23 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 13:10:22 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 13:10:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 22 Mar 2012 13:10:13 +0100
Message-ID: <jkf4r1$u81$1@dough.gmane.org>
References: <1332339451-26902-1-git-send-email-s.stirtzel@googlemail.com>
	<jkdg34$om0$1@dough.gmane.org>
	<CAGiJk9cG0mySg454zxYS8VJLc9etr2jAAxxtBSMbN9boq0EnRg@mail.gmail.com>
	<20120322092859.GE4010@jama.jama.net>
	<CAGiJk9ex0qxUQrxyCSjH33dpH_sg40MmLj+Gq5SSgW2AkyoL_w@mail.gmail.com>
	<20120322104009.6a4ed04e@eb-e6520>
	<CAGiJk9cUPhrLHQicRsDfa-e_vn=0OdmE=BuyXxvi7cJX1XUfrw@mail.gmail.com>
	<jkf2bu$9pb$1@dough.gmane.org>
	<CAGiJk9fXnA24HKjF9rkhkoimDO1etb9eEExNG1Div1bze=XQSA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CAGiJk9fXnA24HKjF9rkhkoimDO1etb9eEExNG1Div1bze=XQSA@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 12:19:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-03-12 12:38, Samuel Stirtzel schreef:
> 2012/3/22 Koen Kooi <koen@dominion.thruhere.net>: Op 22-03-12 11:12,
> Samuel Stirtzel schreef:
>>>> 2012/3/22 Eric Bénard <eric@eukrea.com>:
>>>>> Le Thu, 22 Mar 2012 10:35:31 +0100, Samuel Stirtzel 
>>>>> <s.stirtzel@googlemail.com> a écrit :
>>>>>> 2012/3/22 Martin Jansa <martin.jansa@gmail.com>:
>>>>>>> why not add meta-oe dependency to meta-kde/README?
>>>>>> 
>>>>>> It is already listed as dependency [1]. But somehow it seems
>>>>>> like that there are users, interested in testing this layer,
>>>>>> with an use case which excludes the meta-oe layer.
>>>>>> 
>>>>>> 
>>>>> can you describe this use case so that meta-oe gets a chance to
>>>>> adapt.
>>>> 
>>>> Since I have the common use case of the installation provided from
>>>> the setup-scripts and I don't know the exact use case, I cannot
>>>> provide this information myself right now.
> 
> So you can't explain why it should move to oe-core, that should be enough
> to NAK this patch without even looking at it.
> 
>> If the explanation that an user group that has another use case

No, an *alledged* user group that *might* have an *alledged* use case for
which you say yourself you cannot provide the information. That is what I'm
complaining about, the degrees of hearsay and hypotheticals in your argument.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPaxajAAoJEHZqAkdh1vT6+PgP/13/oayQIuLVdpEx2uslB0LZ
XV5ctwGBoPW6VCIXg/GpTe0BzdIe8hUdnCLZt0gLf2UMN44Wy3RNVZ86000s0GM3
R1/cJ+qNCjrjvNQtUYazG5fklvOk1MtHQnhvyznmkhrSYdaPsMQeeZHkdGey35X6
MZavWe0ufOdKwJG7xgRb5LETduk8IgK6l7sYXr8lIvqq+TRzOqwkDO8ny1cQz1O6
yKFPDisAQGsn4IKwwxPnpoS9/78y8HK4oo6jq5KWoLkQHIGmqe224mTTv7F+EV0b
Ph/TwCQO6oNFLj64oaW9lQpBO1sSTBAMj51Oxvs8cHdQsZeswiAYH9qm8rbrNlRy
QM0QRPxx6aB1K242ZcQfAlMXjgiw0akiMxtxMknJJTzVIpXINV+ZLn2TxsRVHRh+
buuL7HCOiwGYXXzheXLaX4fS+Ctf4i6y0oI8o1F3vscAcj5z7n0YCEG0xu4wWddd
bVbKQ/NHAnkdEE2PKYoP3jJirzFAfh/1X2NCWgD0CJSYoNkukZ3Tx1reINHg4mW5
r3pFkaxo3B/5QaEHgo6Q8w/bGHu6toOjc3xt7yZPVp1Ita8yRxFEulrBcecd+UbO
zzorKmBkJ96y98C6q2ihbo+SqrCGn/5Sx1b/8y7r70DWXyuECasdWM+5ASBmiiJs
TAl4oHGfVVoedxmuD7fJ
=AxKX
-----END PGP SIGNATURE-----



