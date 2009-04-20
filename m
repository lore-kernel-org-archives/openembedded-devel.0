Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LvvxC-0000Xp-W9
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 18:02:43 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1382875ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=nbw9hHC4cQZIqUjOs7bQ9WUjj5uzfabDdzHSln8U+IE=;
	b=vDOOpyCbyRvknl59iJ/Y5zv+LBn0QoC560TRO2gfEVAu7p/l52ZAVVbJPEbyiapfxu
	u/2U5Xn7GAdZ8yBQ4fu0M/nxr3UxVfmCrbC0toHcaxFyqZ7MGKMGhtObhFu9unZCI6sx
	+NId5NbFeBe2mb3Y5MPr8f9qXVLVxpucRWHzQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=shSYdUA/Og+tY0nkBKBGBpaVfzQjonF6TuCDtZreYF9sjPgYal5B2+oGbNicJbFekR
	Z8PmNB35sEAEORl75T/dT/X4T4Kh3SvjxXfvGnRkKdC5D1JXldZTcm9LS/qA0c0exxq8
	OuPcwtMVfQ2Qmdv4KO7gomCAx1XhHLj6ZnrvE=
MIME-Version: 1.0
Received: by 10.90.63.6 with SMTP id l6mr7569238aga.39.1240243103340; Mon, 20 
	Apr 2009 08:58:23 -0700 (PDT)
In-Reply-To: <1240241104-21935-9-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-9-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 20 Apr 2009 17:58:23 +0200
Message-ID: <c384c5ea0904200858k5d6a0a31xa20c8ecd07360b9f@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 1/1] checksums.ini: added checksum for util-linux-ng 2.13.1
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
X-List-Received-Date: Mon, 20 Apr 2009 16:02:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Leon Woestenberg <leon@sidebranch.com>

-- 
Leon


