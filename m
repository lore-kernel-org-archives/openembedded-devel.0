Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LepK7-0000x1-4O
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 12:31:44 +0100
Received: by bwz9 with SMTP id 9so2781624bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2009 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0BNubCyHG+/4V1HuAlgrIlUaH6zDskHn08bGNffrP5s=;
	b=nMAIS09ZI8UPeW0OCb579BtpjxDjLQJ3+4C983bEviX2uIfnRTiw/rArgpvugDRltK
	dRcdK7ofaATV5OEbzDvX0f1A+cVsbUNmof2Mm+UaHGpbWpG8fwfeeOfyDsFHWke3i32K
	g4/egLv0Kp1y8cu67H7hACXJQaE4vzLFUv2Cg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=bkJyyw68ulG8g14eJ2wSN3L7nM9l7qMOLL0r2Qtd+YKlvOdCyw4XQddGzhDgIVWqag
	7teiKeGJWnsEkScJ+jSgLvEhslBOXArd2Gne+g4/5t/cfkQcfH4dGXLIHe+l0z5yR/b7
	QoIHrc/G7AsAAA4va9J8Fr6d/jIlrUwPBJR5I=
MIME-Version: 1.0
Received: by 10.223.106.14 with SMTP id v14mr8046414fao.49.1236166046005; Wed, 
	04 Mar 2009 03:27:26 -0800 (PST)
In-Reply-To: <go6gt0$5hp$1@ger.gmane.org>
References: <go498c$bqq$1@ger.gmane.org>
	<200902261144.46548.openembedded@haerwu.biz>
	<49A69217.3070705@opensimpad.org> <go6gt0$5hp$1@ger.gmane.org>
Date: Wed, 4 Mar 2009 12:27:25 +0100
Message-ID: <d1b08f940903040327p29b22d01ye816f23b2ddc5469@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Wed, 04 Mar 2009 11:33:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>I have some other intrusive proposals about shuffling things around in TMP a bit (and out of TMP as well), standardizing on
> source locations for source_distribute and sourcepkg, etc, but let's start with this easy one.

+1

bump

Andrea


