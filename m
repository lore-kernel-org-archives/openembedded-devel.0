Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NiFEo-0005kt-P0
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 23:52:53 +0100
Received: by pzk14 with SMTP id 14so10379492pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 14:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=OQ+yAOE8AS3WqbQdKVE7w2ZLvR60oAUWb/TbkwhEXR8=;
	b=mOowD+oIeUx74ekP+3vnBQTZ3szAGke1CMTTALWrpupOoPRYNOUzGXHEnNpDD6nHX0
	C6z180nvtXhiuU21Kw6CQpLOmgaWY4/eyfbUWx2D7f5XjEFH/qMKppHcFl4PapE+MNdi
	D4PIZ8DeAY3c3dZUrsLo0XBxtLgRYlZfoBvys=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VRRqyAZ5DkVyOGN5zQ2nFwmpAzXsNduFhafwzmMAG28IC1PEFEVGJo5++ZVuwGLi+l
	PzCeEnhb4UBRmHRNSqm+wKqhtrq8Nbg8abEupaq2KrV6p4GxepwfCiLjjOgZ1zNl+WnD
	RIv8SHr2OEn4v3GcuCzm7SOi2UOhTY4ZANGo4=
MIME-Version: 1.0
Received: by 10.142.247.20 with SMTP id u20mr166996wfh.209.1266533409157; Thu, 
	18 Feb 2010 14:50:09 -0800 (PST)
In-Reply-To: <hlj04i$926$1@ger.gmane.org>
References: <E1Nhfko-0005KL-8Z@melo.openembedded.org>
	<1266437931.5691.30.camel@trini-m4400> <hlhmn0$5c2$1@ger.gmane.org>
	<1266443018.5691.42.camel@trini-m4400> <hlj04i$926$1@ger.gmane.org>
Date: Fri, 19 Feb 2010 09:20:09 +1030
Message-ID: <6ec4247d1002181450h5c8e09d5i9d61bc034cf47306@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [oe-commits] Koen Kooi : opkg-native: bump to r522 to get a fix to remove duplicate messages from do_rootfs logs
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
X-List-Received-Date: Thu, 18 Feb 2010 22:52:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 18 February 2010 19:39, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>
> Testing various things on target (upgrading >500 packages on one,
> installing >1k packages on another) seems to show no (new) errors. I'll
> do some more testing and bump the rev if things look OK.
>
> regards,
>
> Koen

A new opkg release is imminent. Perhaps the rev bump could hold off
until this time, and a recipe for this release be used instead? Is
there any rush?

-Graham


