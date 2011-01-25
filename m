Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhkEq-0006pD-E8 for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:51:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhkE5-0005Hj-I8 for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:50:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:50:33 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 15:50:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 15:50:16 +0100
Message-ID: <ihmnv8$n3g$1@dough.gmane.org>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>	<4D373CFC.8010400@balister.org>
	<ihmjum$vdq$2@dough.gmane.org>
	<AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTinHGa136tXLwyBO2L=TUOQP+kW2WQTLyjBEU0Zx@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 14:51:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-11 15:40, Frans Meulenbroeks wrote:
> 2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> On 20-01-11 08:10, Koen Kooi wrote:
>>>> On 19-01-11 20:35, Philip Balister wrote:
>>>>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
>>>>>> * Having rpath to sysroot is just as bad as one to workdir
>>>>
>>>>> When you do a build with this, how many recipes have issues?
>>>>
>>>> Console-image is clean now :)
> 
> And angstrom-gnome-image as well, so can I get some Acks or tested-bys
> please?
> 
>> NAK, I feel other distro's like shr and minimal should be given some
>> time to test this too.

Martin has already Acked it, fwiw
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPuMoMkyGM64RGpERAqb6AJ4kMGJ1alDw/I5JZQ4ktQ8R6tT3+wCfQgDJ
DW0T7/k96XHQKeqGGS+5WXQ=
=QlxQ
-----END PGP SIGNATURE-----



