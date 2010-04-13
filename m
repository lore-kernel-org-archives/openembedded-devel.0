Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1O1fTr-0008CA-39
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 14:44:39 +0200
Received: by ewy3 with SMTP id 3so250005ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TsKJbYhYwSh9yOCMbKfixPgVXs+mqWpkpW+Mo42sPcQ=;
	b=QMAZZPAyIlydKTOnwHCavlwzqaFPrtLe55gdctsAGXscqVyx+yy/mzCXBBTdHCTte7
	WUA/df2NmKTfaK6RjfFVjghgVW6vZe8UPJEgwn5gOpscLE/XNXZnjLYerfTzFVsy9Beh
	eErAX0871BM/Fyj68tZXrHS30sh0QDUvxGOJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y3RR7b8AHHO/djTERjjhgIojvS89nkwEkx92vGh6f3IPNZpb5zoKgj3KMmEhhHwLK7
	DhMZvxQHHgrzIm6g8mOPsfQh0dXQaA5Kh1nXmIor8HDuqREU2HsgaFjNFnHM8yTXsyWb
	R7o03j83w13jgidjyLaFh+IU0pg722Ycyuk00=
MIME-Version: 1.0
Received: by 10.213.19.141 with HTTP; Tue, 13 Apr 2010 05:41:10 -0700 (PDT)
In-Reply-To: <g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
References: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
	<201004130929.43327.roman@khimov.ru>
	<g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
Date: Tue, 13 Apr 2010 14:41:10 +0200
Received: by 10.213.55.76 with SMTP id t12mr3299921ebg.3.1271162471084; Tue, 
	13 Apr 2010 05:41:11 -0700 (PDT)
Message-ID: <p2nbc36f8ed1004130541g42d4993eh41ec17dc46ca07ec@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 12:44:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/4/13 ttk rpink <ttkrpink@gmail.com>:
> | + xargs opkg-cl -f /home/setup/stuff/tmp/staging/i686-linux/etc/opkg.co=
nf
> -o /home/setup/stuff/tmp/rootfs/beagleboard-demo-image -t
> /home/setup/stuff/tmp/rootfs/beagleboard-demo-image-tmp -nodeps install

I had a simuilar issue a few time ago. I reported it here :
http://bugzilla.openembedded.org/show_bug.cgi?id=3D5397

Hope this helps,

Regards,

Mickael Chazaux

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


