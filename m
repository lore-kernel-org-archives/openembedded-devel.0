Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwMuD-00057g-4N
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:49:25 +0200
Received: by gxk28 with SMTP id 28so3820020gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 13:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nbw9hHC4cQZIqUjOs7bQ9WUjj5uzfabDdzHSln8U+IE=;
	b=jNJbCg7UmX3QODyIOdF62UJ0e5K10l1+bAl4GM+GS2WTli8zodOjXDoZdbR/qmF/h7
	pOtScN1IEDvuuzpsPYsC5btjI4YPGCm9PbuqX6pyWkD5Pj3AMH05lzxFJXSROaWWu4Ur
	PTynMfDgdBw2pvWjO9JXhDm+dCY4pnWsQP38g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y8736EKFKiJS05YxvyVrNaUTrQ/U25Lz+K1PWBbfu+R7Go8un3JTFAxQsC0dErsZW6
	Ea0BCluy8/m9eePl7dBH3FQwiQJ1zbeSEaYl9y6dGq7iaspbr9Ml+62V/NkXR/0dUODv
	eGwsn3ULrY7M0wLA+FlYBIJrZRvP5oYbz8y7g=
MIME-Version: 1.0
Received: by 10.90.113.11 with SMTP id l11mr9344093agc.2.1240346696074; Tue, 
	21 Apr 2009 13:44:56 -0700 (PDT)
In-Reply-To: <1239963741-12123-1-git-send-email-khimov@altell.ru>
References: <1239963741-12123-1-git-send-email-khimov@altell.ru>
Date: Tue, 21 Apr 2009 22:44:55 +0200
Message-ID: <c384c5ea0904211344i5e1e4a31vffd3d0e9df37f7e0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] icecc.bbclass: fix kernel distributed compilation
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
X-List-Received-Date: Tue, 21 Apr 2009 20:49:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon


