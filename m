Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLdFI-0008IE-2b
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 19:05:28 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so4850544pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=SAUjNWyEOGjFkjAwF/KRd0LtSwzT6qSXhCOKVh6muYA=;
	b=UJ8aW02BVWx4k+OnowEEIPH8h6zIILuL9qpanLalHS/mkjo0esRBWkqw9519w54+du
	6B4rTtW/DAUxsAwFmEHj5X8X34fRhfVynFA02DCquVScwS0sS8hcJ3tBlWjKo2mg0VEP
	Zv0WnnKhKmBwGVtqR9wa4is0Pe9LXyK99nVv2YHMZnnl+2pffS5FDlEKd6yfJc2zg0FA
	jKskZSq1XT6LYIV4Zt+Ubq4W7n/n4q9tBNtjlyfp2iIvAeqPiTyewBamqtxAwINA/sa0
	O8kbuPsu40QSRXrRcngvShEu9PIXXgVh9I+leyQ5xqD6puArDiMkeNoOQ0z13VpIzfNN
	lB2A==
Received: by 10.68.125.226 with SMTP id mt2mr64696242pbb.120.1349801539442;
	Tue, 09 Oct 2012 09:52:19 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	it6sm12651491pbc.14.2012.10.09.09.52.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Oct 2012 09:52:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <k5157e$he4$2@ger.gmane.org>
Date: Tue, 9 Oct 2012 09:52:14 -0700
Message-Id: <246BA823-B7D9-41FF-9C0D-E6F29A35F5CB@gmail.com>
References: <1348594741-21920-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1srkgtpOhjkY1hb_FTZjD+9e=PF8PbdX=tez_OyCxZwKpQ@mail.gmail.com>
	<k5157e$he4$2@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: [meta-systemd][PATCH] systemd: Upgrade past v191
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
X-List-Received-Date: Tue, 09 Oct 2012 17:05:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Oct 9, 2012, at 5:27 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Op 06-10-12 20:06, Khem Raj schreef:
>> ping
>> 
>> On Tue, Sep 25, 2012 at 10:39 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Booted on eglibc/uclibc i586 systems
>>> 
> 
> Let's update to 011afa76fb7b888a0a29e46665708c404f991e5d so we also get the
> infamous udev firmware fix for people not running 3.7-rc0 or newer.


OK I will test out and send a V3 




