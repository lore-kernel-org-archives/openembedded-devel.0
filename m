Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LOZiw-0003gH-HL
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 16:38:06 +0100
Received: by bwz8 with SMTP id 8so6138484bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2009 07:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ekq2wostnyamdfiQfiIIYNL5IBGMn5GBPjX1jK18qQ0=;
	b=Nt5dDzJCB+9thSJh/X5ynZnCAMO5h9P+aQ4fZ2sigXdLnK2X/3QMd2iccHxk+xb3xI
	jqlZN09HSIG3rM+zV2biY5syOqAyNogjIs+yGWohguGw9q2A9MD2YMZp/5tjXuifXxT9
	ocVlOWOrpbiq71j/y24VtNnX1OSqTa5/dCRng=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NBg1h8z3qdmkhhWf6U4pDIewH87WUbKizuxn65DSF/ujpGC+kTkD4lpTNv1yqAukZh
	4X/s4u8tDUmUOVeRL1oFQMVxyhd5EQPijAc6jyT0uUDF8Np+UbpHkjqaHgLq4GByQ5Yq
	aSgY3orC2qKfdV57ZfR3dXA24SpSBk9yPm67E=
MIME-Version: 1.0
Received: by 10.181.197.6 with SMTP id z6mr1691083bkp.213.1232292594918; Sun, 
	18 Jan 2009 07:29:54 -0800 (PST)
In-Reply-To: <gkv1a9$709$1@ger.gmane.org>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
	<c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>
	<be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>
	<gkuqgo$ncn$2@ger.gmane.org>
	<d1b08f940901180240q714ae33agb361b515a44103b5@mail.gmail.com>
	<gkv1a9$709$1@ger.gmane.org>
Date: Sun, 18 Jan 2009 16:29:54 +0100
Message-ID: <d1b08f940901180729t18f33326mc811ec4b25d87581@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 12/14] zaurus-2.6.inc: modules fixes
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
X-List-Received-Date: Sun, 18 Jan 2009 15:38:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> If your kernel has those modules compiled in, the modules won't be present
> and hence can't be loaded. Your case is a non-problem.

The problem was real...probably I did not delete the modules when
changing kernel...

Regards
Andrea


