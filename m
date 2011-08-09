Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqdTQ-0007dM-T5
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Aug 2011 05:59:25 +0200
Received: by iyf13 with SMTP id 13so12331797iyf.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=cqRyxpRCZm8L5YrtImAfoOlFVlhAhT+tJsEWBTNE0qI=;
	b=wZ8kfPHYYXmWTxDZ3Hna0F0ulna3k8LFU6BLszV32oJKGOadx2a0PM0xNTQqEtuJHN
	F3T18oodSH4xlRoDWheLFKLyellMChRIeTc5numos5XIeMppn4m3Rh2SzkprdGA4IV0+
	BxAT22Kh9pv67fXqndpMxomhhiVJKpqH2ugb4=
Received: by 10.42.246.1 with SMTP id lw1mr6128031icb.47.1312862094597;
	Mon, 08 Aug 2011 20:54:54 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id a11sm4699042ibg.55.2011.08.08.20.54.52
	(version=SSLv3 cipher=OTHER); Mon, 08 Aug 2011 20:54:53 -0700 (PDT)
Message-ID: <4E40AF8B.4080103@gmail.com>
Date: Mon, 08 Aug 2011 20:54:51 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110801 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1312858153686306500@rkmorris.us>
In-Reply-To: <1312858153686306500@rkmorris.us>
X-Enigmail-Version: 1.2pre
Subject: Re: ISO-Codes Build Failing
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
X-List-Received-Date: Tue, 09 Aug 2011 03:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/08/2011 07:49 PM, Russell Morris wrote:
> Hi,
> 
> I have been trying to build angstrom-x-image, but it fails - at
> iso-codes. The issue may be because Verizon FIOS is now blocking FTP
> (as more and more ISP's are), but in any case I created a new recipe
> to correct this (and it works). How do I get this change in to the
> official OpenEmbedded build (or can I even?)?
> 
> Also ... what is the official OE path? I admit, now with
> OpenEmbedded, core, etc. - it's getting a bit confusing ... :-(. It
> really seems like (base?) OpenEmbedded is getting quite out of date,
> but I could be wrong.
> 

send patches for meta-openembedded to add the recipe that will make it
into the new layered metadata based distros.


> On to gs next (which seems to be failing during the do_configure
> stage).
> 
> Thanks, ... Russell
> 
> _______________________________________________ Openembedded-devel
> mailing list Openembedded-devel@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


- --
> 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk5Ar4sACgkQuwUzVZGdMxQEYgCffYNw/R3mvw8XZQ8NkOxqKKgO
Nv0An0g0n9S6r/vW/vKG0HrZ5ktvEgQu
=HSTm
-----END PGP SIGNATURE-----


