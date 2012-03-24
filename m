Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SBKjI-00083y-HM for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 07:45:36 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SBKaX-00087c-EM for openembedded-devel@lists.openembedded.org;
	Sat, 24 Mar 2012 07:36:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 07:36:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2012 07:36:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 24 Mar 2012 07:36:23 +0100
Message-ID: <jkjq17$2v5$1@dough.gmane.org>
References: <1332487454-14897-1-git-send-email-koen@dominion.thruhere.net>
	<20120323140606.00eb484a@eb-e6520>
	<CAMKF1sq742W527ubkcaqyOu5uQ_hDD4ijSHdKq8CeFZKFs5i_Q@mail.gmail.com>
	<CAMKF1spjKz_vGs1=3Yz3230mvBL3nhV4+GVSGJEAnBNYH4W_PA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120313 Thunderbird/11.0
In-Reply-To: <CAMKF1spjKz_vGs1=3Yz3230mvBL3nhV4+GVSGJEAnBNYH4W_PA@mail.gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe][toolchain-layer][PATCH] toolchain-layer: move binutils and gcc from meta-oe into here
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
X-List-Received-Date: Sat, 24 Mar 2012 06:45:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 23-03-12 16:06, Khem Raj schreef:
> On Fri, Mar 23, 2012 at 8:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Mar 23, 2012 at 6:06 AM, Eric Bénard <eric@eukrea.com> wrote:
>>> Le Fri, 23 Mar 2012 08:24:14 +0100, Koen Kooi
>>> <koen@dominion.thruhere.net> a écrit :
>>> 
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>> Acked-by: Eric Bénard <eric@eukrea.com>
>>> 
>> 
>> Looks good now
>> 
>> Acked-by: Khem Raj <raj.khem@gmail.com>
> 
> Koen
> 
> While you are at it I think eglibc 2.12 should either move to 
> toolchain-layer

Yes, that should move there as well.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPbWtlAAoJEHZqAkdh1vT6eCMP/i5AjtC4Svrlg0n/3g6ZL7g8
dKPThtVtXjiG9WJ0PC6yNPg6XN38AHUjRA8lAOaXfjFsW2qpJuB3gFsluv20+fq4
y4UJFypAzARfLl3yo+1CXIsgoNreZyg5AAr4thYA2uaQaZvRIZvCHobOkr7R1nIG
w0nQrSJpVKFsvBaYxWG09IGA+BiDvR7w0uy4x9HfDqvtU7TLv8/Yn9Vp9CvPwGh0
jCshcZsJSdua/GB7s8iN20YFL9KD+eDX0bw46oUYNam6oi+DfICUyiakFR8T7CzK
e+pjSYXcvnFB/4aonCxvLfeWgO53ZsGMW2jHIFPiS6YhCLRV5XBldm/uzxOCI3+i
YKfVWr++SQ33/WypKtmfKER14TWq9GK6ceM3dLXo6nSqIstG0mJ4k9npq+ewBxXL
+8aXDbBT9O0CvX3M7SsoQrVvWZF0D8NJXBlThP4iyeE+m9/YDDjVnbizwoH3+sT0
ZscAMPBxjrF7BeX/gbvK+1mcdEAQ1RCJdjYRA8mt6pPr8bccCd8KG+ElRAnIZaTB
sTnPGcOmhbh99E7PRo5UbtgbQylNSY97ip2Oac4hwit/pu4XCr5H6mX1rfIni2u4
byNE3+5Wz5aNYwuHqxQMAbtxeceb6sN9qHynHp8QWWQZhkxXyVRw8MyDWXWRQDvR
j/Nlj3kKjzzEG3xUwIVB
=VKYk
-----END PGP SIGNATURE-----



